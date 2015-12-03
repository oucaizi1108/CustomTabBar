//
//  OCZSendMessageViewController.m
//  HtmlImage
//
//  Created by oucaizi on 15/12/3.
//  Copyright © 2015年 oucaizi. All rights reserved.
//

#import "OCZSendMessageViewController.h"
#import "UIBarButtonItem+OCZBarButtonItem.h"

@implementation OCZSendMessageViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem BarButtonItemWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
}

-(void)cancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
