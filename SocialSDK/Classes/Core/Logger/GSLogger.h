//
//  GSLogger.h
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#ifndef GSLogger_h
#define GSLogger_h
#import "GSLoggerConfig.h"

#define GSLogger(fmt, ...) if ([[GSLoggerConfig share] isLogger]) {\
                               NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__); \
                           }

#endif /* GSLogger_h */
