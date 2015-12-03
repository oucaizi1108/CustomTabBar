//
//  OCZNavigationController.m
//  HtmlImage
//
//  Created by oucaizi on 15/12/3.
//  Copyright © 2015年 oucaizi. All rights reserved.
//

#import "OCZNavigationController.h"
#import "CustomDefine.h"
#import "UIBarButtonItem+OCZBarButtonItem.h"

@implementation OCZNavigationController

+(void)initialize{
    UINavigationBar *navigationBar= [UINavigationBar appearance];
//    [navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background_"] forBarMetrics:UIBarMetricsDefault];
    NSDictionary *options=@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:18],NSShadowAttributeName:[[NSShadow alloc]init]};
    [navigationBar setTitleTextAttributes:options];
}


-(void)viewDidLoad{
    [super viewDidLoad];
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed=YES;
        viewController.navigationItem.leftBarButtonItem=[UIBarButtonItem BarButtonItemWithBackgroudImageName:@"navigationbar_back_withtext" highBackgroudImageName:@"navigationbar_back_withtext_highlighted" target:self action:@selector(back)];
    }
    [super pushViewController:viewController animated:animated];
}

-(void)back{
    [self popViewControllerAnimated:YES];
}

@end
