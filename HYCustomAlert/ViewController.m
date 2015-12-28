//
//  ViewController.m
//  HYCustomAlert
//
//  Created by hyyy on 15/12/11.
//  Copyright © 2015年 hyyy. All rights reserved.
//

#import "ViewController.h"
#import "HYIndicatorAlertView.h"

@interface ViewController (){
    BOOL _BShow;
    UIButton *_button;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _button = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 50, 30)];
    _button.backgroundColor = [UIColor redColor];
    [_button setTitle:@"显示" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(touchBtnHandler) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchBtnHandler{
    HYIndicatorAlertView *alertView = [[HYIndicatorAlertView alloc] initWithMessage:@"正在登录中..."];
    [alertView show];
    [self performSelector:@selector(dismissAlert:) withObject:alertView afterDelay:5.0];
}

- (void)dismissAlert:(HYIndicatorAlertView *)alertView{
    [alertView dismiss];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
