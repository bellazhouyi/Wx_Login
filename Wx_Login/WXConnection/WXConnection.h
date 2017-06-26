//
//  WXConnection.h
//  Wx_Login
//
//  Created by 航汇聚科技 on 2017/6/23.
//  Copyright © 2017年 Yi Zhou. All rights reserved.
//

#import <Foundation/Foundation.h>


///
#import "WXApi.h"

/*
 * 微信SDK 和 Client 链接者
 * 响应 WXApiDelegate
 */
@interface WXConnection : NSObject<WXApiDelegate>


+ (instancetype)sharedConnection;


@end
