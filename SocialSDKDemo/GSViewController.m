//
//  GSViewController.m
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSViewController.h"
#import "GSSinaShare.h"

@import SocialSDK;

@interface GSViewController ()

@end

@implementation GSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *sinaTestBtn = [UIButton new];
    sinaTestBtn.frame = CGRectMake(100, 100, 100, 40);
    [sinaTestBtn setTitle:@"sinaTest" forState:UIControlStateNormal];
    [sinaTestBtn addTarget:self action:@selector(sinaTest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sinaTestBtn];
}

- (void)sinaTest
{
    GSSinaShare *sinaShare = [[GSSinaShare alloc] init];
    [sinaShare shareSimpleText:@"这是一条测试信息"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
