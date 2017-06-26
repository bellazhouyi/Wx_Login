//
//  ViewController.m
//  Wx_Login
//
//  Created by 航汇聚科技 on 2017/6/22.
//  Copyright © 2017年 Yi Zhou. All rights reserved.
//

#import "ViewController.h"

///自定义.h文件
#import "WXManager.h"
//配置文件
#import "MacroConfig.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadSubViews];
}

- (void)loadSubViews {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:button];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitle:@"微信登录" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(wxLoginAction:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - wxLoginAction
- (void)wxLoginAction:(UIButton *)sender {
    
    [WXManager sendAuthRequest];
}

@end
