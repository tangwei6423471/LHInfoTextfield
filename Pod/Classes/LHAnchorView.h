//
//  LHAnchorView.h
//  LHInfoTextfield
//
//  Created by huangwenchen on 16/1/15.
//  Copyright © 2016年 WenchenHuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHAnchorView : UIView

@property (copy,nonatomic)NSString * text;

@property (copy,nonatomic)UIFont * font;

@property (assign,nonatomic)CGSize minSize;

-(void)addObserverWithCondition:(BOOL(^)(UITextField * textfield))condition ConfigLabel:(void(^)(UILabel *textLabel))config Infomation:(NSString *)information;

@property (weak,nonatomic)UITextField * bindedTextfield;

@property (copy,nonatomic)UIColor * borderColor;

@end
