//
//  GSReourcesManager.h
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <UIKit/UIKit.h>

#define GSLocalizedString(key) [[GSReourcesManager share].bundle localizedStringForKey:(key) value:@"" table:@"SocialLocalizable"]

@interface GSReourcesManager : NSObject
{
    
}

+ (GSReourcesManager *)share;

- (NSBundle *)localizedBundle;

- (void)setThemeName:(NSString *)themeName;

- (UIImage *)logoWithName:(NSString *)name;

@end
