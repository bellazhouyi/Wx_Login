//
//  WXManager.h
//  Wx_Login
//
//  Created by 航汇聚科技 on 2017/6/23.
//  Copyright © 2017年 Yi Zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 * 微信SDK 管理者
 */
@interface WXManager : NSObject

/*
 * 是否安装 微信 客户端
 * YES 安装
 * NO 未安装
 */
+ (BOOL)isInstalledWXClient;

/*
 * 1、移动应用微信授权登录
 */
+ (void)sendAuthRequest;

/*
 * 2、通过code获取access_token
 */
+ (NSDictionary *)gainAccess_tokenByCode:(NSString *)code;

/*
 * 检验access_token是否有效
 */
+ (BOOL)isValidAccess_token:(NSString *)access_token openId:(NSString *)openId;

/*
 * 刷新/续期access_token使用
 */
+ (NSDictionary *)refreshAccess_token:(NSString *)refresh_token;

/*
 * 获取用户个人信息
 */
+ (NSDictionary *)gainUserInfoByAccess_token:(NSString *)access_token openId:(NSString *)openId;


@end
