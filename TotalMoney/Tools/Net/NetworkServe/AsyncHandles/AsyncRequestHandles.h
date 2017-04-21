/********************************************************************
 文件名称 :  AsyncHandles.h 文件
 作   者 : Caffrey
 创建时间 :16/4/29.
 文件描述 : 类
 ********************************************************************/

#import <Foundation/Foundation.h>
#import "RequestResultBlock.h"

typedef ResponseUtil* (^HandleBlock)(ResponseUtil *responseUtil,NSDictionary *dic);

@interface AsyncRequestHandles : NSObject

//TEST
//获取首页滚动公告
+ (void)getHomeNoticeWithParamters:(NSDictionary *)parameters
                           groupId:(NSString *)groupId
                        identifier:(NSString *)identifier
                         callBlock:(ResultBlock )resultBlock;

//获取首页公告
+ (void)getHomeListWithParamters:(NSDictionary *)parameters
                         groupId:(NSString *)groupId
                      identifier:(NSString *)identifier
                       callBlock:(ResultBlock )resultBlock;

//获取公司列表
+ (void)getCompanyWithParamters:(NSDictionary *)parameters
                        groupId:(NSString *)groupId
                     identifier:(NSString *)identifier
                      callBlock:(ResultBlock )resultBlock;

//建议
+ (void)suggestWithParamters:(NSDictionary *)parameters
                     groupId:(NSString *)groupId
                  identifier:(NSString *)identifier
                   callBlock:(ResultBlock )resultBlock;

//登录
+ (void)loginWithParamters:(NSDictionary *)parameters
                     groupId:(NSString *)groupId
                  identifier:(NSString *)identifier
                   callBlock:(ResultBlock )resultBlock;

//注册
+ (void)registWithParamters:(NSDictionary *)parameters
                   groupId:(NSString *)groupId
                identifier:(NSString *)identifier
                 callBlock:(ResultBlock )resultBlock;

//获取对应公司产品
+ (void)getCompanyProduceWithParamters:(NSDictionary *)parameters
                               groupId:(NSString *)groupId
                            identifier:(NSString *)identifier
                             callBlock:(ResultBlock )resultBlock;

#pragma mark --- 取消单个网络请求 ----
+ (void)cancelRequestForIdentifier:(NSString *)identifier;

#pragma mark --- 取消所有网络请求 ----
+ (void)cancelAllRequest;

#pragma mark --- 取消组网络请求 ----
+ (void)cancelRequestWithGroupId:(NSString *)groupId;

#pragma mark --- 添加组监控 ----
+ (void)addRequestGroupMonitorWithGroupId:(NSString *)groupId handleBlock:(GroupRequestFinish)block;

@end
