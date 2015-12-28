//
//  HYCustomAlertView.m
//  HYCustomAlert
//
//  Created by hyyy on 15/12/11.
//  Copyright © 2015年 hyyy. All rights reserved.
//

#import "HYIndicatorAlertView.h"

//定义相关常量
static const CGFloat alertWidth = 270;
static const CGFloat messageHeight = 50;

@interface HYIndicatorAlertView(){
    UIDynamicAnimator *_animator;
    UIView *_alertView;
    UIView *_backgroundView;
    UIActivityIndicatorView *_indicatorView;
    NSString *_message;
}

@end
@implementation HYIndicatorAlertView

#pragma mark - private function
- (void)initView{
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    
    //backgroundView
    _backgroundView = [[UIView alloc] initWithFrame:keyWindow.frame];
    _backgroundView.backgroundColor = [UIColor blackColor];
    _backgroundView.alpha = 0.4;
    [self addSubview:_backgroundView];
    
    //alertView
    _alertView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, alertWidth, messageHeight)];
    _alertView.layer.cornerRadius = 3;
    _alertView.center = CGPointMake(CGRectGetMidX(keyWindow.frame), CGRectGetMidY(keyWindow.frame) - messageHeight);
    _alertView.backgroundColor = [UIColor whiteColor];
    _alertView.clipsToBounds = YES;
    [self addSubview:_alertView];
    
    //indicatorView
    _indicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, messageHeight, messageHeight)];
    _indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [_alertView addSubview:_indicatorView];
    
    //messageView
    UILabel *msgLabel = [[UILabel alloc] initWithFrame:CGRectMake(messageHeight, 0, alertWidth - messageHeight, messageHeight)];
    msgLabel.text = _message;
    msgLabel.font = [UIFont systemFontOfSize:14.0f weight:0.8f];
    msgLabel.textColor = [UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0];
    msgLabel.textAlignment = NSTextAlignmentLeft;
    [_alertView addSubview:msgLabel];
}

#pragma mark - API
- (instancetype)initWithMessage:(NSString *)message{
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    self = [super initWithFrame:keyWindow.frame];
    if (self) {
        _message = message;
        
        [self initView];
    }
    return self;
}

- (void)show{
    [UIView animateWithDuration:1.0 delay:0.3 options:UIViewAnimationOptionLayoutSubviews animations:^{} completion:^(BOOL finished){
        UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
        [keyWindow addSubview:self];
        [_indicatorView startAnimating];
        
    }];
}

- (void)dismiss{
    [UIView animateWithDuration:1.0 delay:0.3 options:UIViewAnimationOptionLayoutSubviews animations:^{} completion:^(BOOL finished){
        [_indicatorView stopAnimating];
        [self removeFromSuperview];
        _alertView = nil;
    }];
}
@end
