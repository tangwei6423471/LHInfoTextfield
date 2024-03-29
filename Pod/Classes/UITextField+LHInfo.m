//
//  UITextField+LHInfo.m
//  LHInfoTextfield
//
//  Created by huangwenchen on 16/1/15.
//  Copyright © 2016年 WenchenHuang. All rights reserved.
//

#import "UITextField+LHInfo.h"
#import <objc/runtime.h>
@implementation UITextField (LHInfo)

const char kLHAnchorView;

-(LHAnchorView *)lh_infoView{
    return objc_getAssociatedObject(self, &kLHAnchorView);
}

-(void)setLh_infoView:(LHAnchorView *)lh_infoView{
    objc_setAssociatedObject(self, &kLHAnchorView,lh_infoView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    lh_infoView.bindedTextfield = self;
    if (lh_infoView.superview != nil) {
        [lh_infoView removeFromSuperview];
    }
    [self.superview addSubview:lh_infoView];
    self.lh_infoView.hidden = true;
}
-(void)lh_addObserverWithCondition:(BOOL(^)(UITextField * textfield))condition Config:(void(^)(LHAnchorView *))config Infomation:(NSString *)information{
    [self createInfoViewIfNeeded];
    LHAnchorView * anchorview = [self lh_infoView];
    [anchorview addObserverWithCondition:condition Config:config Infomation:information];
}
-(void)lh_showInformation:(NSString *)information Config:(void (^)(LHAnchorView *))config{
    [self createInfoViewIfNeeded];
    LHAnchorView * ancorview = [self lh_infoView];
    [self.superview addSubview:ancorview];
}
-(void)lh_hideInformation{
    [self lh_infoView].hidden = true;
}

-(void)createInfoViewIfNeeded{
    if ([self lh_infoView] == nil) {
        LHAnchorView * anchorview = [[LHAnchorView alloc] init];
        [self setLh_infoView:anchorview];
    }
}
@end
