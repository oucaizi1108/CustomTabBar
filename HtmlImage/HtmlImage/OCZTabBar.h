//
//  OCZTabBar.h
//  HtmlImage
//
//  Created by oucaizi on 15/12/3.
//  Copyright © 2015年 oucaizi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OCZTabBar;

@protocol DSTabBarDelegate <NSObject>

@optional

- (void)tabBarDidClickedPlusButton:(OCZTabBar *)tabBar;

@end

@interface OCZTabBar : UITabBar

@property (nonatomic , weak) id<DSTabBarDelegate> tabBarDelegate;

@property (nonatomic , weak) UIImageView *slideImage;
@end
