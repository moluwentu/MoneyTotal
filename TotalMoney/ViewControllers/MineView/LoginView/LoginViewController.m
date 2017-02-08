//
//  LoginViewController.m
//  TotalMoney
//
//  Created by Xu Chong on 2017/2/8.
//  Copyright © 2017年 叶慧伟. All rights reserved.
//

#import "LoginViewController.h"
#import "Header.h"
#import "Tools.h"

@interface LoginViewController ()

@property (nonatomic,weak) UITextField *usernameTxfd;
@property (nonatomic,weak) UITextField *passwordTxfd;
@property (nonatomic,weak) UITextField *messageCodeTxfd;

@property (nonatomic,weak) UIButton *loginBtn;
@property (nonatomic,weak) UIButton *messageBtn;
@property (nonatomic,weak) UIButton *registBtn;
@property (nonatomic,weak) UIButton *forget;

@property (nonatomic,copy) NSString *username;
@property (nonatomic,copy) NSString *password;
@property (nonatomic,copy) NSString *messageCode;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    [self setUI];
}

-(NSString *)username {
    
    return self.usernameTxfd.text;
}

-(NSString *)password {
    return self.passwordTxfd.text;
}

-(NSString *)messageCode {
    return self.messageCodeTxfd.text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUI{
    self.view.backgroundColor = RGB(244, 244, 244);
    [self setLeftNaviItemWithTitle:nil imageName:@"whiteLeftArrow"];
    
    //login
    UITextField *usernameTxfd = [[UITextField alloc]initWithFrame:CGRectMake(100, 100, 200, 30)];
    usernameTxfd.backgroundColor = [UIColor lightGrayColor];
    usernameTxfd.placeholder = @"用户名";
    [self.view addSubview:usernameTxfd];
    self.usernameTxfd = usernameTxfd;
    
    UITextField *passwordTxfd = [[UITextField alloc]initWithFrame:CGRectMake(100, 140, 200, 30)];
    passwordTxfd.backgroundColor = [UIColor lightGrayColor];
    passwordTxfd.placeholder = @"密码";
    [self.view addSubview:passwordTxfd];
    self.passwordTxfd = passwordTxfd;
    
    
    UITextField *messageCodeTxfd = [[UITextField alloc]initWithFrame:CGRectMake(100, 180, 200, 30)];
    messageCodeTxfd.backgroundColor = [UIColor lightGrayColor];
    messageCodeTxfd.placeholder = @"验证码";
    [self.view addSubview:messageCodeTxfd];
    self.messageCodeTxfd = messageCodeTxfd;
    
    
    UIButton *loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 220, 200, 30)];
    loginBtn.backgroundColor = [UIColor lightGrayColor];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(passwordLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    self.loginBtn  = loginBtn;

    //regist
    UIButton *registBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 260, 200, 30)];
    registBtn.backgroundColor = [UIColor lightGrayColor];
    [registBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registBtn addTarget:self action:@selector(regist) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registBtn];
    self.loginBtn  = registBtn;

    
    
    //messageCode
    UIButton *messageBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 200, 30)];
    messageBtn.backgroundColor = [UIColor lightGrayColor];
    [messageBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.view addSubview:messageBtn];
    self.loginBtn  = messageBtn;

    
    //forget

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}



-(void)passwordLogin {
    NSDictionary *headers = [NSDictionary dictionaryWithObjectsAndKeys:@"application/json", @"content-type",nil];
    NSDictionary *parameters = @{
                                    BODY_USERNAME:self.username,
                                    BODY_PASSWORD:self.password,
                                    BODY_UUID:SYSTEMUUID
                                 };
    
    [[Tools shareTools] netWorkWithURL:URL_LOGIN_USERNAME
                            withHeader:headers
                              withBody:parameters
                            withMethod:@"POST"
                            withReturn:^(NSDictionary *statusDic) {
                                    //[[Tools shareTools]hideHud:self.beginView];
                                    if (statusDic){
                                        if([statusDic[NET_STATUS] isEqualToString:NET_ERROR]) {
                                            
                                            NSLog(@"%@",statusDic);
                                        }else{
                                            
                                            NSDictionary *dataDict = statusDic[@"data"];
                                            
                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                //todo 存token
                                                
                                                NSDictionary *dict = @{@"userId":dataDict[@"userId"],@"authToken":dataDict[@"authToken"]};
                                                
                                                NSLog(@"%@",dict);
                                                
                                                //存token
                                                [[NSUserDefaults standardUserDefaults]setObject:dict forKey:LOGINTOKENDIC];
                                                //跳转
                                                
                                            });
                                        }
                                    }
                                }];
}

-(void)regist {
    NSDictionary *headers = [NSDictionary dictionaryWithObjectsAndKeys:@"application/json", @"content-type",nil];
    NSDictionary *parameters = @{
                                 BODY_USERNAME:self.username,
                                 BODY_PASSWORD:self.password,
                                 BODY_UUID:SYSTEMUUID
                                 };
    
    [[Tools shareTools] netWorkWithURL:URL_REGIST
                            withHeader:headers
                              withBody:parameters
                            withMethod:@"POST"
                            withReturn:^(NSDictionary *statusDic) {
                                //[[Tools shareTools]hideHud:self.beginView];
                                if (statusDic){
                                    if([statusDic[NET_STATUS] isEqualToString:NET_ERROR]) {
                                        
                                        NSLog(@"%@",statusDic);
                                    }else{
                                        NSLog(@"%@",statusDic);
                                        
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            //todo 存token
                                            
                                            NSDictionary *dict = @{@"userId":statusDic[@"userId"],@"authToken":statusDic[@"authToken"]};
                                            
                                            NSLog(@"%@",dict);
                                            
                                            //登录token存本地
                                            [[NSUserDefaults standardUserDefaults]setObject:dict forKey:LOGINTOKENDIC];
                                            //跳转登录结果页面
                                            
    
                                        });
                                    }
                                }
                            }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
