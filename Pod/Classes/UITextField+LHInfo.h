//
//  UITextField+LHInfo.h
//  LHInfoTextfield
//
//  Created by huangwenchen on 16/1/15.
//  Copyright © 2016年 WenchenHuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHAnchorView.h"
@interface UITextField (LHInfo)

-(void)lh_addObserverWithCondition:(BOOL(^)(UITextField * textfield))condition Config:(void(^)(LHAnchorView * anchorView))config Infomation:(NSString *)information;
@end
