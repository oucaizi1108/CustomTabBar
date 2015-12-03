//
//  OCZTabBarController.m
//  HtmlImage
//
//  Created by oucaizi on 15/12/3.
//  Copyright © 2015年 oucaizi. All rights reserved.
//

#import "OCZTabBarController.h"
#import "CustomDefine.h"
#import "OCZTabBar.h"
#import "OCZNavigationController.h"
#import "UIView+Extension.h"
@interface OCZTabBarController ()<DSTabBarDelegate,UITabBarControllerDelegate>

@end

@implementation OCZTabBarController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    //添加子视图
    [self addChildVC];
    //设置代理
    [self setDelegate:self];
    //添加自定义tabbar
    [self addCustomTabbar];
    
}

-(void)addCustomTabbar{
  
    OCZTabBar *tabbar=[[OCZTabBar alloc] init];
    [tabbar setTabBarDelegate:self];
    [self setValue:tabbar forKey:@"tabBar"];
    
}


/**
 *  添加子视图 OCZHomeViewController OCZFindViewController OCZSendMessageViewController OCZMessageViewController OCZSettingViewController
 */
-(void)addChildVC{
 NSArray*vcArray=@[@"OCZHomeViewController",@"OCZFindViewController",@"OCZMessageViewController",@"OCZSettingViewController"];
     NSArray *image=@[@"tabbar_home",@"tabbar_message_center",@"tabbar_discover",@"tabbar_profile"];
     NSArray *selectImage=@[@"tabbar_home_selected",@"tabbar_message_center_selected",@"tabbar_discover_selected",@"tabbar_profile_selected"];
     NSArray *title=@[@"首页",@"消息",@"发现",@"我"];
    
    @WeakObj(self);
    [vcArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Class vc=NSClassFromString(obj);
        [selfWeak addChildVC:[[vc alloc] init] title:title[idx] image:[UIImage imageNamed:image[idx]] selectImage:[UIImage imageNamed:selectImage[idx]]];
    }];
}

-(void)addChildVC:(UIViewController*)controller title:(NSString*)title image:(UIImage*)image selectImage:(UIImage*)selectImage{
    controller.title=title;
    controller.tabBarItem.image=image;
    if (IOS7) {
        controller.tabBarItem.selectedImage=[selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }else
        controller.tabBarItem.selectedImage=selectImage;
    [controller.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    OCZNavigationController *navigation=[[OCZNavigationController alloc] initWithRootViewController:controller];
    [self addChildViewController:navigation];
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    OCZTabBar *tabBar=(OCZTabBar*)tabBarController.tabBar;
    CGFloat width=tabBarController.tabBar.width/(tabBarController.tabBar.items.count+1);
    NSInteger index=tabBarController.selectedIndex;
    CGFloat originX;
    if (index >= 2) {
        originX = width * (index + 1);
    } else {
        originX = width * index;
    }
    [UIView animateWithDuration:0.3 animations:^{
        tabBar.slideImage.x=originX;
    }];
    
}

/**
 *  代理
 */
#pragma mark - DSTabBarDelegate
- (void)tabBarDidClickedPlusButton:(OCZTabBar *)tabBar
{
    Class class=NSClassFromString(@"OCZSendMessageViewController");
    UIViewController *controller=[[class alloc] init];
    controller.title=@"Compose";
    OCZNavigationController *nav = [[OCZNavigationController alloc] initWithRootViewController:controller];
    [self presentViewController:nav animated:YES completion:nil];
}


@end
