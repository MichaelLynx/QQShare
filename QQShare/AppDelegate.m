//
//  AppDelegate.m
//  QQShare
//
//  Created by Admin on 2017/8/22.
//  Copyright © 2017年 DB. All rights reserved.
//

#import "AppDelegate.h"
#import <TencentOpenAPI/TencentOAuth.h>




@interface AppDelegate ()<TencentSessionDelegate>

/** QQ分享*/
@property(nonatomic, strong) TencentOAuth * tencentOAuth;

/** 许可*/
@property(nonatomic, strong) NSArray * permissions;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //1. http://wiki.connect.qq.com/ 2. https://connect.qq.com/
    //AppID请自己申请，并同步更改Info里的URL Types
#warning 此处的AppID要自己改
    _tencentOAuth = [[TencentOAuth alloc]initWithAppId:@"1108611" andDelegate:self];
    
    //可以不写
    _tencentOAuth.redirectURI = @"www.qq.com";
    
    _permissions = [NSArray arrayWithObjects:@"get_user_info",@"get_simple_userinfo", @"add_t", nil];
    
    [_tencentOAuth authorize:_permissions inSafari:NO];
    
    
    
    
    
    
    return YES;
}


//回到App时该回调有走
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    return [TencentOAuth HandleOpenURL:url];
}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [TencentOAuth HandleOpenURL:url];
}


/*
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
#if __QQAPI_ENABLE__
    [QQApiInterface handleOpenURL:url delegate:(id)[QQAPIDemoEntry class]];
#endif
    if (YES == [TencentOAuth CanHandleOpenURL:url])
    {
        return [TencentOAuth HandleOpenURL:url];
    }
    return YES;
}
*/


//登录功能没添加，但调用TencentOAuth相关方法进行分享必须添加<TencentSessionDelegate>，则以下方法必须实现，尽管并不需要实际使用它们
//登录成功
- (void)tencentDidLogin
{
//    _labelTitle.text = @"登录完成";
    if (_tencentOAuth.accessToken && 0 != [_tencentOAuth.accessToken length])
    {
        // 记录登录用户的OpenID、Token以及过期时间
//        _labelAccessToken.text = _tencentOAuth.accessToken;
    }
    else
    {
//        _labelAccessToken.text = @"登录不成功 没有获取accesstoken";
    }
}


//非网络错误导致登录失败
-(void)tencentDidNotLogin:(BOOL)cancelled
{
    if (cancelled)
    {
//        _labelTitle.text = @"用户取消登录";
    }
    else
    {
//        _labelTitle.text = @"登录失败";
    }
}

//网络错误导致登录失败
-(void)tencentDidNotNetWork
{
//    _labelTitle.text=@"无网络连接，请设置网络";
}









- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
