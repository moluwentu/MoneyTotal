//
//  Tools.m
//  FingerAttendance
//
//  Created by hisign on 15/8/10.
//  Copyright (c) 2015年 hisign.yuwei. All rights reserved.
//

#import "AFNetworking.h"
#import "Tools.h"
#import "AppDelegate.h"
#import "Header.h"
@interface Tools ()

@property (nonatomic,strong) AFURLSessionManager *AFManager;

@end

@implementation Tools



+ (Tools *)shareTools
{
    [[AFNetworkReachabilityManager sharedManager]startMonitoring];
    static Tools *tools = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = [[self alloc] init];
    });
    
    return tools;
}


-(AFURLSessionManager *)AFManager {
    if (!_AFManager) {
        _AFManager = [[AFURLSessionManager alloc]init];
    }
    return _AFManager;
}


- (NSString *)getYearMonthDayWithoutSpace:(NSDate *)date{

    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    NSInteger year = [comps year];
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    
    NSString *currentTime = [NSString stringWithFormat:@"%04ld%02ld%02ld",year,month,day];
    
    return currentTime;

}


//获得当前时间的年月日
- (NSString *)getYearMonthDay:(NSDate *)date;
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    NSInteger year = [comps year];
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    
    NSString *currentTime = [NSString stringWithFormat:@"%04ld-%02ld-%02ld",year,month,day];
    
    return currentTime;
}



- (NSString *)getYearMonth:(NSDate *)date{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    NSInteger year = [comps year];
    NSInteger month = [comps month];
    
    NSString *currentTime = [NSString stringWithFormat:@"%04ld年%ld月",year,month];
    
    return currentTime;

}

- (NSString *)getYearMonthWithDate:(NSDate *)date{
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    NSInteger year = [comps year];
    NSInteger month = [comps month];
    
    NSString *currentTime = [NSString stringWithFormat:@"%04ld-%02ld",year,month];
    
    return currentTime;


}

//获得当前时间的星期和上下午
- (NSString *)getWeekAmPm:(NSDate *)date;
{
    NSArray *weekDays = @[@"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六"];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitHour | NSCalendarUnitWeekday;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    NSInteger hour = [comps hour];
    NSInteger week = [comps weekday];
    NSString *weekAndTime = nil;
    if(hour + 12 > 24) {
        weekAndTime = @"PM";
    } else {
        weekAndTime = @"AM";
    }
    NSString *weekDay = weekDays[week - 1];
    weekAndTime = [NSString stringWithFormat:@"%@     %@", weekDay, weekAndTime];
    return weekAndTime;
}

- (NSString *)getWeek:(NSDate *)date {
    NSArray *weekDays = @[@"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六"];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitWeekday;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    NSInteger week = [comps weekday];
    return weekDays[week - 1];
}

-(NSString *)getDetailDate:(NSDate *)date{
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    NSInteger year = [comps year];
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    NSInteger hour = [comps hour];
    NSInteger minute = [comps minute];
    NSString *currentTime = [NSString stringWithFormat:@"%04ld-%02ld-%02ld %02ld:%02ld",year,month,day,hour,minute];

    return currentTime;
}
- (UIImageView *)creatCoverView:(UIView *)view toView:(UIView *)toView {
    
    UIImage *screenImage = [self convertViewToImage:view];
    NSData *data = UIImagePNGRepresentation(screenImage);
    UIImage *cover = [self creatBlurWith:data];
    
    UIImageView *coverView = [[UIImageView alloc]initWithImage:cover];
    coverView.frame = CGRectMake(-30, -25, toView.frame.size.width + 60, toView.frame.size.height + 60);
    coverView.alpha = 0;
    
    [toView addSubview:coverView];
    [UIView animateWithDuration:0.3 animations:^{
        coverView.alpha = 1;
    }];

    return coverView;
}

- (UIImage *)creatBlurWith:(NSData *)data {
    CIContext *context = [CIContext contextWithOptions:nil];
    
    
    CIImage *image = [CIImage imageWithData:data];
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:image forKey:kCIInputImageKey];
    [filter setValue:@4.0f forKey: @"inputRadius"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef outImage = [context createCGImage: result fromRect:[result extent]];
    UIImage * blurImage = [UIImage imageWithCGImage:outImage];
    CGImageRelease(outImage);
    return blurImage;
}

-(UIImage *)convertViewToImage:(UIView*)view;

{
    
    UIGraphicsBeginImageContext(view.bounds.size);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}

//转化考勤服务器时间 "1970-01-18T02:48:51.300Z"
-(NSString *)getDateStrFromSreverStr:(NSString *)str {
    
    if (!str || str.length <19) {
        return nil;
    }
    
    NSString *timeStr = [str stringByReplacingCharactersInRange:NSMakeRange(10, 1) withString:@" "];
    
    timeStr = [timeStr substringToIndex:19];
        
    return timeStr;
}

//获得当前时间小时和分钟
- (NSString *)getHourMin:(NSDate *)date;
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitHour | NSCalendarUnitMinute;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    NSInteger hour = [comps hour];
    NSInteger minute = [comps minute];
    NSString *currentTime = [NSString stringWithFormat:@"%02ld:%02ld", (long)hour, (long)minute];
    return currentTime;
}

- (NSString *)getHourMinSec:(NSDate *)date{

    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    NSInteger hour = [comps hour];
    NSInteger minute = [comps minute];
    NSInteger second = [comps second];
    NSString *currentTime = [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)hour, (long)minute, (long)second];
    
    return currentTime;

}


//todo 网络请求

//网络请求
- (void)netWorkWithURL:(NSString *)urlString
            withHeader:(NSDictionary *)header
              withBody:(NSDictionary *)body
            withMethod:(NSString *)method
            withReturn:(NetWorkReturn)returnStatus {
    
    NSDictionary *headers = header;
    NSDictionary *parameters = body;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:30.0f];
    [request setHTTPMethod:method];
    if (header) {
        [request setAllHTTPHeaderFields:headers];
    }
    if (parameters) {
        NSData *postData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];

        [request setHTTPBody:postData];
    }
    
    [[self.AFManager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
        
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        NSDictionary *dict = (NSDictionary *)responseObject;
        if (dict) {
            if (dict[NET_MESSAGE]&&[dict [NET_MESSAGE] isKindOfClass:[NSString class]] &&[dict[NET_MESSAGE] isEqualToString:@"You must be logged in to do this."]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[NSNotificationCenter defaultCenter]postNotificationName:LOGIN_INFO_INVALID object:nil userInfo:nil];
                });
                returnStatus(nil);
            } else{
                returnStatus(dict);
            }
        }else if (error) {
            if(error.code == NSURLErrorTimedOut){
                returnStatus(@{NET_MESSAGE:NET_TIMEOUT, NET_STATUS:NET_ERROR});
            }else {
                returnStatus(@{NET_MESSAGE:NET_NOTCONNECT, NET_STATUS:NET_ERROR});
            }
        }
    }] resume];

}


//网络
-(BOOL) isConnectionAvailable{
    
    return [AFNetworkReachabilityManager sharedManager].isReachable;

}



- (void)startMortingNetStateWithBlock:(networkStatus)block {
    [[AFNetworkReachabilityManager sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        block(status);
    }];
}


- (void)cancelRequest{
    [self.AFManager.operationQueue cancelAllOperations];

}

-(UIImage *)getArcImage:(UIImage *)originImage{
    
    
    
        NSLog(@"x = %f,y = %f",originImage.size.width,originImage.size.height);
    
        if (!originImage) {
        
                return nil;
        }
    
        //开启上下文
    
        CGFloat clickW = originImage.size.width  +  4;
    
        CGFloat clickH = originImage.size.width  +  4;
    
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(clickW, clickH), NO, 0.0);
    
       //创建下下文
    
        CGContextRef ctx=UIGraphicsGetCurrentContext();
    
    
    
        //要裁切的圆
    
        CGContextAddArc(ctx, clickW*0.5, clickH*0.5, originImage.size.width*0.5, 0, M_PI*2, 0);
    
        CGContextClip(ctx);
    
        //画图片
    
        [originImage drawInRect:CGRectMake(0, 0, originImage.size.width, originImage.size.height)];
    
        UIImage *iconImage=UIGraphicsGetImageFromCurrentImageContext();
    
    
    
        UIGraphicsEndImageContext();
    
    
    
        return iconImage;
    
}

- (UIImage *)getIconImageViewIconRing:(UIImage *)iconImageRing iconImage:(UIImage *)iconImage {

    UIImage *reSizeIconImage = [self getArcImage:iconImage];
    
    CGFloat w = iconImageRing.size.width;
    CGFloat h = iconImageRing.size.height;

    UIGraphicsBeginImageContext(CGSizeMake(w,h));
    
    //创建下下文
    CGContextRef ctx2 = UIGraphicsGetCurrentContext();
    //要裁切的圆
    CGContextAddArc(ctx2, w*0.5, h*0.5, iconImageRing.size.width*0.5, 0, M_PI*2, 0);
    CGContextClip(ctx2);
    
    
    [reSizeIconImage drawInRect:CGRectMake(iconImageRing.size.width*0.08, iconImageRing.size.width*0.08,iconImageRing.size.width*0.84, iconImageRing.size.width*0.84)];

    [iconImageRing drawInRect:CGRectMake(0, 0, w, h)];
    
    //将iconImage变圆形
    
    
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return reSizeImage;
}


//获取小尺寸正方形头像
- (UIImage *)getIconImageFrom640x480Image:(UIImage *)iconImage toSize:(CGSize)size {

    CGImageRef cgimage = iconImage.CGImage;
    CGImageRef subImageRef = CGImageCreateWithImageInRect(cgimage, CGRectMake(0, 0, 480, 480));
    CGRect smallBounds = CGRectMake(0, 0, size.width,size.height);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(size);
    [smallImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return reSizeImage;
    
}


#pragma mark -
#pragma mark 随机数组（配置活体）
- (NSMutableArray *)randomArray:(NSArray *)array withRandomNum:(NSInteger)num
{
    NSMutableArray *startArray = [[NSMutableArray alloc] initWithArray:array];
    //随机数产生结果
    NSMutableArray *resultArray=[[NSMutableArray alloc] initWithCapacity:0];
    //随机数个数
    NSInteger m=num;
    for (int i=0; i<m; i++) {
        int t=arc4random()%startArray.count;
        resultArray[i]=startArray[t];
        startArray[t]=[startArray lastObject]; //为更好的乱序，故交换下位置
        [startArray removeLastObject];
    }
    return resultArray;
}



#pragma mark -
- (UILabel *)createLabelWithText:(NSString *)text textColor:(UIColor *)textColor {
    
    NSString *string = [NSString stringWithFormat:@" %@ ", text];
    
    CGRect rect = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, 0)
                                     options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading
                                  attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14.f]}
                                     context:nil];
    
    CGFloat width = rect.size.width;
    UILabel  *label  = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 20)];
    label.font       = [UIFont systemFontOfSize:14.f];
    label.text       = string;
    label.textColor  = textColor;
    return label;
}
@end












