//
//  SynNetRequest.m
//  Wx_Login
//
//  Created by 航汇聚科技 on 2017/6/23.
//  Copyright © 2017年 Yi Zhou. All rights reserved.
//

#import "SynNetRequest.h"

///自定义.h文件
#import "ConstantConfig.h"

@implementation SynNetRequest

+ (instancetype)sharedSynNetRequest {
    static SynNetRequest *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [SynNetRequest new];
    });
    return instance;
}

#pragma mark - 同步 请求 入口
- (NSDictionary *)synGetByUrlStr:(NSString *)urlStr {
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [req setHTTPMethod:@"GET"];
    
    NSURLResponse *response = nil;
    
    NSError *error = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:req returningResponse:&response error:&error];
    
    NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    return responseDict;
}

#pragma mark - 同步 通过code获取access_token
- (NSDictionary *)synGetAccess_tokenByCode:(NSString *)code {
    NSString *urlStr = [NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/access_token?appid=%@&secret=%@&code=%@&grant_type=authorization_code", WX_APPID, WX_APPSECRECT, code];
    
    return [self synGetByUrlStr:urlStr];
}
#pragma mark - 检验授权凭证(access_token)是否有效
- (BOOL)isValidAccess_token:(NSString *)access_token openId:(NSString *)openId {
    NSString *urlStr = [NSString stringWithFormat:@"https://api.weixin.qq.com/sns/auth?access_token=%@&openid=%@",access_token, openId];
    NSDictionary *result = [self synGetByUrlStr:urlStr];
    NSString *errcode = [NSString stringWithFormat:@"%@",[result valueForKey:@"errcode"]];
    if ([errcode isEqualToString:@"0"]) {
        //有效
        return YES;
    }else {
        //无效
        return NO;
    }
}

#pragma mark - 刷新/续期access_token使用
- (NSDictionary *)synRefreshAccess_token:(NSString *)refresh_token {
    NSString *urlStr = [NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=%@&grant_type=refresh_token&refresh_token=%@",WX_APPID, refresh_token];
    return [self synGetByUrlStr:urlStr];
}

#pragma mark - 获取个人信息
- (NSDictionary *)synGetUserInfoByAccess_token:(NSString *)access_token openId:(NSString *)openId {
    NSString *urlStr = [NSString stringWithFormat:@"https://api.weixin.qq.com/sns/userinfo?access_token=%@&openid=%@",access_token, openId];
    return [self synGetByUrlStr:urlStr];
}



@end
