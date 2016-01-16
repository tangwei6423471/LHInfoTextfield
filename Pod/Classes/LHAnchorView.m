//
//  LHAnchorView.m
//  LHInfoTextfield
//
//  Created by huangwenchen on 16/1/15.
//  Copyright © 2016年 WenchenHuang. All rights reserved.
//

#import "LHAnchorView.h"
#define ARCHORWIDTH 6
@interface LHAnchorView ()

@property (strong,nonatomic)UILabel * textLabel;
@property (strong,nonatomic)NSMutableArray * conditions;
@property (strong,nonatomic)NSMutableArray * infomations;
@property (strong,nonatomic)NSMutableArray * configs;

@property (copy,nonatomic)NSString * text;

@end
@implementation LHAnchorView
-(void)addObserverWithCondition:(BOOL(^)(UITextField * textfield))condition Config:(void(^)(LHAnchorView *))config Infomation:(NSString *)information{
    if (condition == nil) {
        NSAssert(false, @"You should impment conditon of LHInfoExtesnion");
    }
    if (information != nil) {
        [self.conditions addObject:condition];
        [self.infomations addObject:information];
    }
    if (config != nil) {
        [self.configs addObject:config];
    }else{
        [self.configs addObject:^(LHAnchorView * anchorView){
            anchorView.font = [UIFont systemFontOfSize:12];
            anchorView.textColor = [UIColor blackColor];
            anchorView.borderColor = [UIColor darkGrayColor];
        }];
    }
}

@dynamic font,text,textColor;
-(void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat lineWidth = 0.5;
    
    CGContextMoveToPoint(context, rect.size.width / 2, lineWidth);
    
    CGContextAddArcToPoint(context, rect.size.width - lineWidth, lineWidth,rect.size.width - lineWidth, rect.size.height/2 - ARCHORWIDTH/2, 3.0);
    CGContextAddLineToPoint(context, rect.size.width - lineWidth, rect.size.height/2 - ARCHORWIDTH/2);
    
    CGContextAddArcToPoint(context, rect.size.width - lineWidth, rect.size.height - ARCHORWIDTH, rect.size.width/2 + ARCHORWIDTH/2, rect.size.height -ARCHORWIDTH, 3.0);
    CGContextAddLineToPoint(context, rect.size.width/2 + ARCHORWIDTH/2, rect.size.height -ARCHORWIDTH);
    
    CGContextAddLineToPoint(context, rect.size.width/2, rect.size.height);
    CGContextAddLineToPoint(context, rect.size.width/2 - ARCHORWIDTH/2, rect.size.height - ARCHORWIDTH);
    CGContextAddArcToPoint(context, lineWidth, rect.size.height - ARCHORWIDTH, lineWidth, rect.size.height/2 - ARCHORWIDTH/2, 3.0);
    CGContextAddLineToPoint(context, lineWidth, rect.size.height/2 - ARCHORWIDTH/2);
    
    CGContextAddArcToPoint(context, lineWidth, lineWidth,rect.size.width/2, lineWidth, 3.0);
    
    CGContextClosePath(context);

    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetStrokeColorWithColor(context, self.borderColor.CGColor);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextStrokePath(context);
    
}
-(instancetype)init{
    if (self = [super init]) {
        [self setUp];
    }
    return self;
}
-(void)setUp{
    self.textLabel = [[UILabel alloc] init];
    self.textLabel.textColor = [UIColor blackColor];
    self.textLabel.font = [UIFont systemFontOfSize:12];
    self.textLabel.frame = CGRectMake(0, 0, _minSize.width,_minSize.height - ARCHORWIDTH);
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    _minSize = CGSizeMake(50,30);
    self.borderColor = [UIColor darkGrayColor];
    self.opaque = NO;
    [self addSubview:self.textLabel];
    self.conditions = [NSMutableArray new];
    self.infomations = [NSMutableArray new];
    self.configs = [NSMutableArray new];
}
-(void)setText:(NSString *)text{
    self.textLabel.text = text;
    [self updateSelfIfNeed];
}
-(void)setFont:(UIFont *)font{
    self.textLabel.font = font;
    [self updateSelfIfNeed];
}
-(void)setBorderColor:(UIColor *)borderColor{
    _borderColor = borderColor;
    [self updateSelfIfNeed];
}
-(void)setTextColor:(UIColor *)textColor{
    self.textLabel.textColor = textColor;
}
-(UIColor *)textColor{
    return self.textLabel.textColor;
}
-(UIFont *)font{
    return self.textLabel.font;
}
-(NSString *)text{
    return self.textLabel.text;
}
-(void)setMinSize:(CGSize)minSize{
    _minSize = minSize;
    [self updateSelfIfNeed];
}
-(void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textfieldTextChange:) name:UITextFieldTextDidChangeNotification object:nil];
    self.frame = CGRectMake(0, 0, _minSize.width, _minSize.height);
    self.center = CGPointMake(self.bindedTextfield.center.x, self.bindedTextfield.center.y - CGRectGetHeight(self.bindedTextfield.frame)/2 - CGRectGetHeight(self.frame)/2);
}
-(void)textfieldTextChange:(NSNotification *)notification{
    UITextField * textfield = notification.object;
    if (textfield == self.bindedTextfield) {
        BOOL matchCondition = false;
        for (int index = 0; index < self.conditions.count;index ++) {
            BOOL(^condition)(UITextField *)  = self.conditions[index];
            void(^config)(LHAnchorView *) = self.configs[index];
            if (condition(self.bindedTextfield)) {
                self.text = self.infomations[index];
                config(self);
                matchCondition = true;
                break;
            }
        }
        if (matchCondition == false) {
            self.hidden = true;
        }else{
            self.hidden = false;
        }
    }
}
-(void)updateSelfIfNeed{
    CGFloat height = MAX(self.minSize.height, self.frame.size.height);
    CGSize newSize = [self.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height)
                                             options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                          attributes:@{NSFontAttributeName:self.textLabel.font}
                                             context:nil].size;
    CGFloat newWidth  = MAX(newSize.width, self.minSize.width);
//    if (newWidth != self.frame.size.width) {
    self.frame = CGRectMake(0,0, newWidth + 6, height);
    self.center = CGPointMake(self.bindedTextfield.center.x, self.bindedTextfield.center.y - CGRectGetHeight(self.bindedTextfield.frame)/2 - CGRectGetHeight(self.frame)/2);
    self.textLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - ARCHORWIDTH);
    
    [self setNeedsDisplay];
//    }
    
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}
@end
