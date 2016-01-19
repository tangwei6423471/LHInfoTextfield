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

/*!
 * @discussion Add a new condition,when condition is matched
 * @param condition the block that to decide whether the condition is matched
 * @param config the block that used to configure the UI of AnchorView
 * @param information the string to show of the anchorview
 * @return void
 */
-(void)lh_addObserverWithCondition:(BOOL(^)(UITextField * textfield))condition Config:(void(^)(LHAnchorView * anchorView))config Infomation:(NSString *)information;
/*!
 * @discussion Manual to show anchorView
 * @param config the block that used to configure the UI of AnchorView
 * @param information the string to show of the anchorview
 * @return void
 */
-(void)lh_showInformation:(NSString *)information Config:(void(^)(LHAnchorView * anchorView))config;

/*!
 * @discussion Manual to hide anchorview
 * @return void
 */
-(void)lh_hideInformation;
@end
