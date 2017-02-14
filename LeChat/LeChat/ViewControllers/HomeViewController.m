//
//  HomeViewController.m
//  LeChat
//
//  Created by cda on 2017/2/14.
//  Copyright © 2017年 letron. All rights reserved.
//

#import "HomeViewController.h"
#import "ReactNativeViewController.h"

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *mTableView;

@end



@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initUI
{
    self.mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    [self.view addSubview:self.mTableView];
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"home_cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"home_cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSString *cellText;
    switch (indexPath.row) {
        case 0: cellText = @"react native"; break;
        case 1: cellText = @"alpha"; break;
        case 2: cellText = @"beta"; break;
        case 3: cellText = @"garma"; break;
        case 4: cellText = @"thelta"; break;
        default: cellText = @"delta"; break;
    }
    
    cell.textLabel.text = cellText;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            ReactNativeViewController *rnVC = [ReactNativeViewController new];
            [self.navigationController pushViewController:rnVC animated:YES];
        } break;
        case 1:
        {
            
        } break;
        case 2:
        {
            
        } break;
        case 3:
        {
            
        } break;
        case 4:
        {
            
        } break;
        default: break;
    }
}

@end
