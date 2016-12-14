//
//  ODUsingHelpViewController.m
//  OneDoor
//
//  Created by 七扇门 on 16/7/12.
//  Copyright © 2016年 Yujing. All rights reserved.
//

#import "ODUsingHelpViewController.h"

@interface ODUsingHelpViewController ()

@end

@implementation ODUsingHelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initNavigationLeftButtonBackWithTitle:@"" IfBelongTabbar:YES];
    [self initNavigationTitleViewLabelWithTitle:@"使用帮助" IfBelongTabbar:YES];
    
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
