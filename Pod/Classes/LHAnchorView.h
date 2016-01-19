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
//! Font of text
@property (copy,nonatomic)UIFont * font;
//! Min size,default is (30,10)
@property (assign,nonatomic)CGSize minSize;
//! Text color,default is black
@property (strong,nonatomic)UIColor * textColor;
//! The textfield that is binded to
@property (weak,nonatomic)UITextField * bindedTextfield;
//! Border color,default is darkGray
@property (copy,nonatomic)UIColor * borderColor;

//! Main API to add a new condition
-(void)addObserverWithCondition:(BOOL(^)(UITextField * textfield))condition Config:(void(^)(LHAnchorView *anchorView))config Infomation:(NSString *)information;



@end
