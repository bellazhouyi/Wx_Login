//
//  WXManager.m
//  Wx_Login
//
//  Created by 航汇聚科技 on 2017/6/23.
//  Copyright © 2017年 Yi Zhou. All rights reserved.
//

#import "WXManager.h"

///微信SDK
#import "WXApi.h"

//自定义.h文件
//配置文件
#import "ConstantConfig.h"

//网络请求
#import "SynNetRequest.h"

@implementation WXManager

#pragma mark - 是否安装 微信客户端
+ (BOOL)isInstalledWXClient {
    return [WXApi isWXAppInstalled];
}

#pragma mark - 移动应用微信授权登录
static NSString *kAuthScope = @"snsapi_message,snsapi_userinfo,snsapi_friend,snsapi_contact";
+ (void)sendAuthRequest {
    SendAuthReq *request = [SendAuthReq new];
    request.scope = kAuthScope;
    request.state = WX_SENDAUTHSTATE;
    [WXApi sendReq:request];
}

#pragma mark - 通过code获取access_token
+ (NSDictionary *)gainAccess_tokenByCode:(NSString *)code {
     return [[SynNetRequest sharedSynNetRequest] synGetAccess_tokenByCode:code];
}

#pragma mark - 检验access_token是否有效
+ (BOOL)isValidAccess_token:(NSString *)access_token openId:(NSString *)openId {
    return [[SynNetRequest sharedSynNetRequest] isValidAccess_token:access_token openId:openId];
}

#pragma mark - 刷新/续期access_token是否有效
+ (NSDictionary *)refreshAccess_token:(NSString *)refresh_token {
    return [[SynNetRequest sharedSynNetRequest] synRefreshAccess_token:refresh_token];
}

#pragma mark - 获取用户个人信息
+ (NSDictionary *)gainUserInfoByAccess_token:(NSString *)access_token openId:(NSString *)openId {
    return [[SynNetRequest sharedSynNetRequest] synGetUserInfoByAccess_token:access_token openId:openId];
}

@end
