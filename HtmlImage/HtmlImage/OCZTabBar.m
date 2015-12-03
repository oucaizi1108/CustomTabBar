//
//  OCZTabBar.m
//  HtmlImage
//
//  Created by oucaizi on 15/12/3.
//  Copyright © 2015年 oucaizi. All rights reserved.
//

#import "OCZTabBar.h"
#import "CustomDefine.h"
#import "UIView+Extension.h"

const CGFloat slideH=3;

@interface OCZTabBar ()

@property(nonatomic,weak) UIButton*plusButton;

@end

@implementation OCZTabBar


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
          
        if (!IOS7) {
            self.backgroundImage=[UIImage imageNamed:@"tabbar_backgroud"];
        }else
            self.backgroundColor=[UIColor whiteColor];
            self.selectionIndicatorImage = [UIImage imageNamed:@"navigationbar_button_background"];
           [self setupPlusButtonImage];
    }
    return self;
}

- (void)setupPlusButtonImage {
    UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    // 设置背景
    [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    // 设置图标
    [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    [plusButton addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
    // 添加
    [self addSubview:plusButton];
    self.plusButton = plusButton;
    
    UIImageView*image=[[UIImageView alloc] init];
    [image setBackgroundColor:[UIColor orangeColor]];
    [self addSubview:image];
    self.slideImage=image;
}

- (void)plusClick {
    //通知代理
    if ([self.tabBarDelegate respondsToSelector:@selector(tabBarDidClickedPlusButton:)]){
        [self.tabBarDelegate tabBarDidClickedPlusButton:self];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.plusButton.size = self.plusButton.currentBackgroundImage.size;
    self.plusButton.center = CGPointMake(self.width * 0.5, self.height * 0.5);
    [self.slideImage setFrame:CGRectMake(0, self.height-slideH, self.width / (self.items.count + 1), slideH)];
    NSInteger index=0;
    for (UIView *obj in self.subviews) {
        if (![obj isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        [self setupTabBarButtonFrame:obj atIndex:index];
        index++;
    }
}

- (void)setupTabBarButtonFrame:(UIView *)tabBarButton atIndex:(NSInteger)index
{
    // 计算button的尺寸
    CGFloat buttonW = self.width / (self.items.count + 1);
    CGFloat buttonH = self.height;
    
    tabBarButton.width = buttonW;
    tabBarButton.height = buttonH;
    if (index >= 2) {
        tabBarButton.x = buttonW * (index + 1);
    } else {
        tabBarButton.x = buttonW * index;
    }
    tabBarButton.y = 0;
}


@end
