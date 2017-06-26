//
//  WXConnection.m
//  Wx_Login
//
//  Created by 航汇聚科技 on 2017/6/23.
//  Copyright © 2017年 Yi Zhou. All rights reserved.
//

#import "WXConnection.h"

///自定义.h文件
#import "ConstantConfig.h"
#import "MacroConfig.h"

#import "WXManager.h"

@implementation WXConnection

+ (instancetype)sharedConnection {
    static WXConnection *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [WXConnection new];
    });
    return instance;
}

#pragma mark - WXApiDelegate
- (void)onReq:(BaseReq *)req {
    
}

- (void)onResp:(BaseResp *)resp {
    //移动应用微信授权登录 回调
    if ([resp isKindOfClass:[SendAuthResp class]]) {
        if (resp.errCode == 0) {
            SendAuthResp *authResp = (SendAuthResp *)resp;
            if ([authResp.state isEqualToString:WX_SENDAUTHSTATE]) {
                
                NSDictionary *dict = [WXManager gainAccess_tokenByCode:authResp.code];
                NSString *access_token = [dict valueForKey:@"access_token"];
                NSString *openid = [dict valueForKey:@"openid"];
                if ([WXManager isValidAccess_token:access_token openId:openid]) {
                    //有效
                }else {
                    //无效
                    NSString *refresh_token = [dict valueForKey:@"refresh_token"];
                    NSDictionary *refresh_dict = [WXManager refreshAccess_token:refresh_token];
                    access_token = [refresh_dict valueForKey:@"access_token"];
                    openid = [refresh_dict valueForKey:@"openid"];
                }
                YLog(@"获取到的个人信息: %@",[WXManager gainUserInfoByAccess_token:access_token openId:openid]);
            }
        }
    }
}

@end
