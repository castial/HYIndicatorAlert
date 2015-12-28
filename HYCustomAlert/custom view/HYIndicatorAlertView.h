//
//  HYCustomAlertView.h
//  HYCustomAlert
//
//  Created by hyyy on 15/12/11.
//  Copyright © 2015年 hyyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYIndicatorAlertView : UIView

///初始化
- (instancetype)initWithMessage:(NSString *)message;

//alert显示
- (void)show;

//alert消失
- (void)dismiss;

@end