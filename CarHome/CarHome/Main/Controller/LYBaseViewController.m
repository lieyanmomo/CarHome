//
//  LYBaseViewController.m
//  CarHome
//
//  Created by zhanghaibin on 16/6/18.
//  Copyright © 2016年 zhanghaibin. All rights reserved.
//

#import "LYBaseViewController.h"

@interface LYBaseViewController ()

@end

@implementation LYBaseViewController

#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置item文字属性
    [self setupItemTextAttrs];
    
    // 添加子控制器
    [self setupChildVc];
}

#pragma mark - 添加子控制器
- (void)setupChildVc {

    // 首页
    [self addChildVc:[[UIViewController alloc] init] imageName:@"tab_shouye_baitian" selecatedImageName:@"tab_shouye_baitian_hit" title:@"首页"];
    
    // 论坛
    [self addChildVc:[[UIViewController alloc ]init] imageName:@"tab_luntan_baitian" selecatedImageName:@"tab_luntan_baitian_hit" title:@"论坛"];
    
    // 我
    [self addChildVc:[[UIViewController alloc ]init] imageName:@"tabbar_me" selecatedImageName:@"tabbar_me_hit" title:@"我"];
    
    // 找车
    [self addChildVc:[[UIViewController alloc ]init] imageName:@"tab_zhaoche_baitian" selecatedImageName:@"tab_zhaoche_baitian_hit" title:@"找车"];
    
    // 降价
    [self addChildVc:[[UIViewController alloc ]init] imageName:@"tab_jiangjia_baitian" selecatedImageName:@"tab_jiangjia_baitian_hit" title:@"降价"];
    
}

- (void)addChildVc:(UIViewController *)childVc imageName:(NSString *)imageName selecatedImageName:(NSString *)selecatedImageName title:(NSString *)tabBarItemTitle {
    
    childVc.view.backgroundColor = LYRandomColor;
    [childVc.tabBarItem setImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [childVc.tabBarItem setSelectedImage:[[UIImage imageNamed:selecatedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    childVc.tabBarItem.title = tabBarItemTitle;
    [self addChildViewController:childVc];
}

#pragma mark -- 设置item文字属性
- (void)setupItemTextAttrs
{
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = LYColor(40, 177, 229);
    
    // 方法或者属性后面有个UI_APPEARANCE_SELECTOR宏,才可以通过appearance对象统一设置
    // 统一设置UITabBarItem的文字属性
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

@end
