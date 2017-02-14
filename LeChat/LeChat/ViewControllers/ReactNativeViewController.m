//
//  ReactNativeViewController.m
//  LeChat
//
//  Created by cda on 2017/2/14.
//  Copyright © 2017年 letron. All rights reserved.
//

#import "ReactNativeViewController.h"
#import <React/RCTRootView.h>

@interface ReactNativeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *mTableView;

@end


@implementation ReactNativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
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
    return 8;
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
        case 0: cellText = @"Props Demo"; break;
        case 1: cellText = @"State Demo"; break;
        case 2: cellText = @"Style Demo"; break;
        case 3: cellText = @"Size Demo"; break;
        case 4: cellText = @"Layout Demo"; break;
        case 5: cellText = @"TextInput Demo"; break;
        case 6: cellText = @"ScrollView Demo"; break;
        case 7: cellText = @"ListView Demo"; break;
        default:break;
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
    NSString *compName;
    
    switch (indexPath.row) {
        case 0:
        {
            compName = @"PropsDemo";
        } break;
        case 1:
        {
            compName = @"StateDemo";
        } break;
        case 2:
        {
            compName = @"StyleDemo";
        } break;
        case 3:
        {
            compName = @"SizeDemo";
        } break;
        case 4:
        {
            compName = @"LayoutDemo";
        } break;
        case 5:
        {
            compName = @"TextInputDemo";
        } break;
        case 6:
        {
            compName = @"ScrollViewDemo";
        } break;
        case 7:
        {
            compName = @"ListViewDemo";
        } break;
        default: break;
    }
    
    if (compName.length > 0) {
        NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.ios.bundle"];
        
        UIViewController *vc = [UIViewController new];
        RCTRootView *loadView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                            moduleName:compName
                                                     initialProperties:nil
                                                         launchOptions:nil];
        loadView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
        [vc.view addSubview:loadView];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
