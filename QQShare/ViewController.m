//
//  ViewController.m
//  QQShare
//
//  Created by Admin on 2017/8/22.
//  Copyright © 2017年 DB. All rights reserved.
//

#import "ViewController.h"

#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/QQApiInterfaceObject.h>

@interface ViewController ()
{
    
    SendMessageToQQReq *req;
    
    
    
}




@end



/*
 
 具体步骤参照该文档：
 xcode设置：
 1.plist-Bundle display name(NSString，项目名，用于分享后的链接后缀)、LSApplicationQueriesSchemes(NSArray，QQ应用的Schemes需要加入白名单，用于允许QQ相关应用跳转)、NSAppTransportSecurity(NSDictionary，开启网络连接)
 
 2.Info->URL Types：设置QQ的URL Schemes
 
 3.根据要求引入QQ分享相关的SDK
 
 
 */


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSString *utf8String = @"https://v.qq.com/x/cover/rfgkivnu2k0ylyb/i0013m4f0zt.html";
    NSString *title = @"这是一个标题";
    NSString *description = @"内容内容内容内容内容测试测试测试测试测试";
    NSString *previewImageUrl = @"https://imgsa.baidu.com/forum/w%3D580/sign=a45e927533d12f2ece05ae687fc3d5ff/c6ed5adf8db1cb1396e6cfb1d854564e93584b4f.jpg";
    QQApiNewsObject *newsObj = [QQApiNewsObject
                                objectWithURL:[NSURL URLWithString:utf8String]
                                title:title
                                description:description
                                previewImageURL:[NSURL URLWithString:previewImageUrl]];
    req = [SendMessageToQQReq reqWithContent:newsObj];
    /*
    //将内容分享到qq
    //QQApiSendResultCode sent = [QQApiInterface sendReq:req];
    //将内容分享到qzone
    QQApiSendResultCode sent = [QQApiInterface SendReqToQZone:req];
    */
    
    
    
}

//分享到好友
- (IBAction)doShareFriends:(UIButton *)sender {
    
    //将内容分享到qq
    QQApiSendResultCode sent = [QQApiInterface sendReq:req];
    
}


//分享到空间
- (IBAction)doShareZone:(UIButton *)sender {
    
    //将内容分享到qzone
    QQApiSendResultCode sent = [QQApiInterface SendReqToQZone:req];
    
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
