//
//  SynNetRequest.h
//  Wx_Login
//
//  Created by 航汇聚科技 on 2017/6/23.
//  Copyright © 2017年 Yi Zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 * 网络 同步请求
 */
@interface SynNetRequest : NSObject

+ (instancetype)sharedSynNetRequest;

/*
 * 同步 通过code获取access_token
 * code 微信授权登录后，返回的code值
 * 返回dict
 */
- (NSDictionary *)synGetAccess_tokenByCode:(NSString *)code;

/*
 * 检验授权凭证(access_token)是否有效
 */
- (BOOL)isValidAccess_token:(NSString *)access_token openId:(NSString *)openId;

/*
 * 刷新/续期access_token使用
 */
- (NSDictionary *)synRefreshAccess_token:(NSString *)refresh_token;

/*
 * 获取用户个人信息
 */
- (NSDictionary *)synGetUserInfoByAccess_token:(NSString *)access_token openId:(NSString *)openId;

@end
