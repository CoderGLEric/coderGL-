//
//  ODBlackListViewController.m
//  OneDoor
//
//  Created by 七扇门 on 16/7/12.
//  Copyright © 2016年 Yujing. All rights reserved.
//

#import "ODBlackListViewController.h"
#import "ODBlackListCell.h"

@interface ODBlackListViewController ()<UITableViewDelegate, UITableViewDataSource>

{
    UITableView * _tableView;
}

@end

@implementation ODBlackListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self initNavigationLeftButtonBackWithTitle:@"" IfBelongTabbar:NO];
    [self initNavigationTitleViewLabelWithTitle:@"黑名单" IfBelongTabbar:NO];
    [self createTableView];
    
}
- (void)createTableView{
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}

#pragma mark - <UITableViewDelegate>
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ide = @"ODBlackListCell";
    ODBlackListCell *cell = [tableView dequeueReusableCellWithIdentifier:ide];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ODBlackListCell" owner:self options:nil] firstObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark -- 左划删除黑名单
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"删除");
        
//        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//        hud.labelText = @"删除中...";
//        
//        NSString *urlStr = [kBaseUrl stringByAppendingString:@"3206/ios"];
//        SDNoteListModel *model = _allArray [indexPath.row];
//        
//        NSDictionary *parameters = @{@"customer_id" : model.id,
//                                     @"app_id" : [[NSUserDefaults standardUserDefaults] objectForKey:APPID]
//                                     };
//        
//        NSLog(@"%@", parameters);
//        
//        [[HttpService sharedHttpService]getInfoDetailArrayZeroWithURLString:urlStr parameters:parameters modelClass:nil successBlock:^(NSArray *responseArray) {
//            
//            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//            
//            [self showHint:@"删除成功" yOffset:-200.00f];
//            
//            [_allArray removeObjectAtIndex:indexPath.row];
//            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//            
//            
//        } failureBlock:^(NSError *error) {
//            NSLog(@"%@", error);
//            
//            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//            
//            [[NetworkRequestTools sharedNetworkRequestTools].operationQueue cancelAllOperations];
//            
//        }];
        
        
    }
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLayoutSubviews {
    if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [_tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
    
    if ([_tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [_tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
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
