//
//  CustomDefine.h
//  HtmlImage
//
//  Created by oucaizi on 15/12/3.
//  Copyright © 2015年 oucaizi. All rights reserved.
//

#ifndef CustomDefine_h
#define CustomDefine_h

// 弱引用
#define WeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;

// 7.0以上系统
#define IOS7  ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0)

#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#endif /* CustomDefine_h */
