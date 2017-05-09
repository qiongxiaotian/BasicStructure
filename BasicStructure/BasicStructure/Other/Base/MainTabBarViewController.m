//
//  MainTabBarViewController.m
//  BasicStructure
//
//  Created by mxy on 2017/5/9.
//  Copyright © 2017年 mxy. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "MainNavigationController.h"
#import "HomeViewController.h"
#import "DiscoverViewController.h"
#import "InfoViewController.h"
#import "TimeViewController.h"
#import "XYTabBar.h"
@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

+ (void)initialize{
    
    // 通过appearance统一设置所有UITabBarItem的文字属性
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectAttrs = [NSMutableDictionary dictionary];
    selectAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //添加自控制器
    [self setupChileViewController:[[HomeViewController alloc] init] title:@"首页" image:@"tabBar_essence_icon" selectImage:@"tabBar_essence_click_icon"];
    [self setupChileViewController:[[TimeViewController alloc] init] title:@"我的发布" image:@"tabBar_new_icon" selectImage:@"tabBar_new_click_icon"];
    
    [self setupChileViewController:[[DiscoverViewController alloc] init] title:@"发现" image:@"tabBar_friendTrends_icon" selectImage:@"tabBar_friendTrends_click_icon"];
    [self setupChileViewController:[[InfoViewController alloc] init] title:@"我的" image:@"tabBar_me_icon" selectImage:@"tabBar_me_click_icon"];
    
    //如果中间的按钮需要自定义，就需要自己更换tabbar
    [self setValue:[[XYTabBar alloc] init] forKey:@"tabBar"];
}

- (void)setupChileViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage{
    
    //设置文字图片
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    
    //包装一个视图控制器
    MainNavigationController *nv = [[MainNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nv];
    
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
