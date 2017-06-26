//
//  MacroConfig.h
//  Wx_Login
//
//  Created by 航汇聚科技 on 2017/6/23.
//  Copyright © 2017年 Yi Zhou. All rights reserved.
//

#import <Foundation/Foundation.h>


#ifdef DEBUG

#define YLog(fmt,...) NSLog((@" %s,%s,%d \n" fmt),__FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);

#else

#define YLog(...);

#endif


///本地存储
#define userDefaults [NSUserDefaults standardUserDefaults]

/*
 * 常规宏定义
 */
@interface MacroConfig : NSObject

@end
