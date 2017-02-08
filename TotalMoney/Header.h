//
//  Header.h
//  TotalMoney
//
//  Created by Xu Chong on 2017/1/22.
//  Copyright © 2017年 叶慧伟. All rights reserved.
//

#ifndef Header_h
#define Header_h
//base URL
#define BASEURL     @"http://192.168.30.42:5000/app/"//本地服务器
//#define BASEURL     @"http://119.254.209.148:6001/app/"//外网服务器


#define URL_GETREGISTCODE           [BASEURL stringByAppendingString:@"regist/message/"]                //获取注册验证码＊
#define URL_MSGLOGIN_MSG            [BASEURL stringByAppendingString:@"msglogin/message/"]              //短信登陆验证码＊
#define URL_FORGETPASSWORD          [BASEURL stringByAppendingString:@"setusername/message/"]           //修改手机号验证码＊
#define URL_CHECKIFREGISTER         [BASEURL stringByAppendingString:@"checkIfRegisted/"]               //是否已注册*
#define URL_REGIST                  [BASEURL stringByAppendingString:@"regist/confirm/"]                //注册＊
#define URL_LOGIN_USERNAME          [BASEURL stringByAppendingString:@"login/"]                         //用户名登录＊
#define URL_MSGLOGIN                [BASEURL stringByAppendingString:@"msglogin/"]                      //短信登陆＊
#define URL_WEIXINLOGIN             [BASEURL stringByAppendingString:@"wxlogin/"]                       //微信登录＊
#define URL_USERINFO                [BASEURL stringByAppendingString:@"usersInfo/"]                     //用户个人信息＊
#define URL_APPVERSION              [BASEURL stringByAppendingString:@"appVersion/"]                    //app版本号和url获取＊
#define URL_USELOGOUT               [BASEURL stringByAppendingString:@"logout/"]                        //登出
#define URL_FORGETRESETPASSWORD     [BASEURL stringByAppendingString:@"setpwd/"]                        //忘记密码重新设置密码
#define URL_CHANGEATDFACE           [BASEURL stringByAppendingString:@"change/atdFace/"]                //修改头像

#define HEADER_CONTENT_TYPE            [NSDictionary dictionaryWithObjectsAndKeys:@"application/json", @"content-type", nil]
#define USERID                         @"x-user-id"
#define TOKEN                          @"x-auth-token"

#define BODY_APPKEY             @"appkey"
#define BODY_USERNAME           @"username"
#define BODY_PASSWORD           @"password"
#define BODY_UUID               @"uuid"
#define BODY_IMAGE              @"image"
#define BODY_PUSHID             @"pushid"

#define SYSTEMUUID              [[UIDevice currentDevice] identifierForVendor].UUIDString

#define LOGINTOKENDIC           @"loginTokenDic"

//notify
#define NOTIFAUPDATE                @"NEEDUPDATENOTIFICATION"

#define WAITAPPROVALBADGECHANGED    @"WaitApprovalBadgeChanged"
#define MYAPPLYBADGECHANGED         @"MyApplyBadgeChanged"
#define PRAISECHANGED               @"PraiseChanged"

#define MESSAGEBADGECHANGED         @"MessageBadgeChanged"


#define NOT_PHONENUM                @"这不是手机号码"
#define ENTER_PHONENUM              @"请输入手机号码"
#define ENTER_VERIFYCODE            @"请输入验证码"
#define ENTER_RIGHTCODE             @"请输入正确的验证码"
#define ACCOUNT_PASSWORD_ERROR      @"账号或密码错误"
#define NOT_REGISTER                @"该手机号未注册"
#define HAS_REGISTER                @"该手机号已注册"
#define GETVERIFYCODE               @""

#define NET_MESSAGE                 @"message"
#define NET_APPLICATIONINSTANCEID   @"applicationInstanceId"
#define NET_STATUS                  @"status"
#define NET_ERROR                   @"error"
#define NET_SUCCESS                 @"success"
#define LOGIN_INFO_INVALID          @"loginInfoInvalid"
#define NET_NOTCONNECT              @"网络连接异常，请检测后重试"
#define NET_TIMEOUT                 @"连接超时了，请重试"


//app版本号
#define APP_VERSION 1





#endif /* Header_h */
