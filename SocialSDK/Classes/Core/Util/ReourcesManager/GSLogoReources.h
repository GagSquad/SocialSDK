//
//  GSLogoReources.h
//  SocialSDKDemo
//
//  Created by lijunjie on 23/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSPlatformType.h"
#import "GSLogoReourcesType.h"

@interface GSLogoReources : NSObject

+ (GSPlatformType)getPlatformTypeWithLogoReourcesType:(GSLogoReourcesType)logoReourcesType;

@end
