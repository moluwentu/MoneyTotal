//
//  Tools.h
//  FingerAttendance
//
//  Created by hisign on 15/8/10.
//  Copyright (c) 2015年 hisign.yuwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef void (^NetWorkReturn)(NSDictionary *statusDic);
typedef void (^networkStatus)(int status);


@interface Tools : NSObject

+ (Tools *)shareTools;


-(void)addNotifacationMessageToView:(UIView *)view withMessage:(NSString *)message;

//转化考勤服务器时间 "1970-01-18T02:48:51.300Z","2016-11-15T06:54:00.000Z"
-(NSString *)getDateStrFromSreverStr:(NSString *)str;


- (NSString *)getYearMonthDayWithoutSpace:(NSDate *)date;

//获得当前时间的年月日
- (NSString *)getYearMonthDay:(NSDate *)date;

- (NSString *)getYearMonth:(NSDate *)date;//带有年月中文

- (NSString *)getYearMonthWithDate:(NSDate *)date;//不带年月中文


//获得当前时间的星期和上下午
- (NSString *)getWeekAmPm:(NSDate *)date;

//获得当前时间小时和分钟
- (NSString *)getHourMin:(NSDate *)date;

- (NSString *)getHourMinSec:(NSDate *)date;

- (NSString *)getDetailDate:(NSDate *)date;//年月日 时分
//获取星期
- (NSString *)getWeek:(NSDate *)date;


//网络请求
- (void)netWorkWithURL:(NSString *)urlString withHeader:(NSDictionary *)header withBody:(NSDictionary *)body withMethod:(NSString *)method withReturn:(NetWorkReturn)returnStatus;

- (void)startMortingNetStateWithBlock:(networkStatus)block;

- (void)cancelRequest;

//创建并且添加萌版，嗯，萌版
- (UIImageView *)creatCoverView:(UIView *)view toView:(UIView *)toView;

-(BOOL)isConnectionAvailable;

//数组元素乱序
- (NSMutableArray *)randomArray:(NSArray *)array withRandomNum:(NSInteger)num;


-(UIImage *)getArcImage:(UIImage *)originImage;

//从640x480图片获得缩放尺寸图片
- (UIImage *)getIconImageFrom640x480Image:(UIImage *)iconImage toSize:(CGSize)rect;
//获得带装饰环的头像
- (UIImage *)getIconImageViewIconRing:(UIImage *)iconImageRing iconImage:(UIImage *)iconImage;
@end
