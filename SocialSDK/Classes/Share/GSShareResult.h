//
//  GSShareResult.h
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSShareResultProtocol.h"

@interface GSShareResult : NSObject <GSShareResultProtocol>

@property (nonatomic, assign) GSShareResultStatus status;
@property (nonatomic, assign) NSInteger sourceCode;
@property (nonatomic, copy) NSString *soucreMessage;
@property (nonatomic, copy) NSString *message;

@end

@interface UMShareObject : NSObject

/**
 * 标题
 * @note 标题的长度依各个平台的要求而定
 */
@property (nonatomic, copy) NSString *title;

/**
 * 描述
 * @note 描述内容的长度依各个平台的要求而定
 */
@property (nonatomic, copy) NSString *descr;

/**
 * 缩略图 UIImage或者NSData类型或者NSString类型（图片url）
 */
@property (nonatomic, strong) id thumbImage;

/**
 * @param title 标题
 * @param descr 描述
 * @param thumImage 缩略图（UIImage或者NSData类型，或者image_url）
 *
 */
+ (id)shareObjectWithTitle:(NSString *)title
                     descr:(NSString *)descr
                 thumImage:(id)thumImage;

+ (void)um_imageDataWithImage:(id)image completion:(void (^)(NSData *image))completion;

#pragma mark - 6.0.3新版本的函数
+ (void)um_imageDataWithImage:(id)image withCompletion:(void (^)(NSData *imageData,NSError* error))completion;

@end


/** 音乐网页的url地址
 * @note 长度不能超过10K
 */
@property (nonatomic, retain) NSString *musicUrl;
/** 音乐lowband网页的url地址
 * @note 长度不能超过10K
 */
@property (nonatomic, retain) NSString *musicLowBandUrl;
/** 音乐数据url地址
 * @note 长度不能超过10K
 */
@property (nonatomic, retain) NSString *musicDataUrl;

/**音乐lowband数据url地址
 * @note 长度不能超过10K
 */
@property (nonatomic, retain) NSString *musicLowBandDataUrl;

/**
 视频网页的url
 
 @warning 不能为空且长度不能超过255
 */
@property (nonatomic, strong) NSString *videoUrl;

/**
 视频lowband网页的url
 
 @warning 长度不能超过255
 */
@property (nonatomic, strong) NSString *videoLowBandUrl;

/**
 视频数据流url
 
 @warning 长度不能超过255
 */
@property (nonatomic, strong) NSString *videoStreamUrl;

/**
 视频lowband数据流url
 
 @warning 长度不能超过255
 */
@property (nonatomic, strong) NSString *videoLowBandStreamUrl;
