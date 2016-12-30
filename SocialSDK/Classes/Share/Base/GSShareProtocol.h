//
//  GSShareProtocol.h
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSShareChannelType.h"
#import "GSPlatformType.h"
#import "GSHandleProtocol.h"

@protocol GSShareResultProtocol;

typedef void (^GSShareCompletionBlock) (id<GSShareResultProtocol> result);

@protocol GSShareProtocol <NSObject, GSHandleProtocol>

+ (GSPlatformType)platformType;

+ (GSShareChannelType)channelType;

- (void)shareSimpleText:(NSString *)text;

- (void)shareSingleImage:(id)image title:(NSString *)title description:(NSString *)description;

- (void)shareURL:(NSString *)url title:(NSString *)title description:(NSString *)description thumbnail:(id)thumbnail;

- (void)shareMusicURL:(NSString *)musicURL
      musicLowBandURL:(NSString *)musicLowBandURL
         musicDataURL:(NSString *)musicDataURL
  musicLowBandDataURL:(NSString *)musicLowBandDataURL
                title:(NSString *)title
          description:(NSString *)description
            thumbnail:(id)thumbnail;

- (void)shareVideoURL:(NSString *)videoURL
      videoLowBandURL:(NSString *)videoLowBandURL
       videoStreamURL:(NSString *)videoStreamURL
videoLowBandStreamURL:(NSString *)videoLowBandStreamURL
                title:(NSString *)title
          description:(NSString *)description
            thumbnail:(id)thumbnail;

- (void)setShareCompletionBlock:(GSShareCompletionBlock)completionBlock;

@end
