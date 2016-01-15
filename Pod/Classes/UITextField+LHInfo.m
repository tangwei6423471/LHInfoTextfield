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
-(void)lh_addObserverWithCondition:(BOOL(^)(UITextField * textfield))condition ConfigLabel:(void(^)(UILabel *))config Infomation:(NSString *)information{
    if ([self lh_infoView] == nil) {
        LHAnchorView * anchorview = [[LHAnchorView alloc] init];
        [self setLh_infoView:anchorview];
    }
    LHAnchorView * anchorview = [self lh_infoView];
    [anchorview addObserverWithCondition:condition ConfigLabel:config Infomation:information];
}
@end
