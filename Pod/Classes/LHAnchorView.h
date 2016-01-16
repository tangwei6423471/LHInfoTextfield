//
//  LHAnchorView.h
//  LHInfoTextfield
//
//  Created by huangwenchen on 16/1/15.
//  Copyright © 2016年 WenchenHuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LHAnchorView;

@interface LHAnchorView : UIView


@property (copy,nonatomic)UIFont * font;

@property (assign,nonatomic)CGSize minSize;

@property (strong,nonatomic)UIColor * textColor;

@property (weak,nonatomic)UITextField * bindedTextfield;

@property (copy,nonatomic)UIColor * borderColor;

-(void)addObserverWithCondition:(BOOL(^)(UITextField * textfield))condition Config:(void(^)(LHAnchorView *anchorView))config Infomation:(NSString *)information;



@end
