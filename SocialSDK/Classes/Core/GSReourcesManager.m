//
//  GSReourcesManager.m
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSReourcesManager.h"
#import "GSLogger.h"

@interface GSReourcesManager ()

@property(nonatomic, strong) NSBundle *localizedBundle;
@property(nonatomic, strong) NSString *mainBundlePath;

@end

@implementation GSReourcesManager

+ (GSReourcesManager *)share
{
    static GSReourcesManager *localizableManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        localizableManager = [[GSReourcesManager alloc] init];
        NSString *l = @"zh-Hans";
//        if ([[localizableManager preferredLanguage] isEqualToString:@"en"]) {
//            l = @"en";
//        }
        [localizableManager setLocalLangage:l];
    });
    return localizableManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _mainBundlePath = [[NSBundle mainBundle] pathForResource:@"GSSocialSDKResources" ofType:@"bundle"];
    }
    return self;
}

- (NSBundle *)localizedBundle
{
    return _localizedBundle;
}

#pragma maark - private
- (NSString *)preferredLanguage
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *languages = [userDefaults objectForKey:@"AppleLanguages"];
    NSString *preferredLang = [languages objectAtIndex:0];
    GSLogger(@"Preferred Language:%@", preferredLang);
    return preferredLang;
}

- (void)setLocalLangage:(NSString *)localLanguage
{
    NSString *local = @"zh-Hans";
    if(localLanguage) {
        local = localLanguage;
    }
    NSBundle *resourceBundle = [NSBundle bundleWithPath:_mainBundlePath];
    NSString *languagePath = [resourceBundle pathForResource:local ofType:@"lproj"];
    _localizedBundle = [NSBundle bundleWithPath:languagePath];
}

- (UIImage *)logoWithName:(NSString *)name;
{
    NSBundle *resourceBundle = [NSBundle bundleWithPath:_mainBundlePath];
    NSString *logoPath = [resourceBundle pathForResource:name ofType:@"png" inDirectory:@"SocialTheme/default"];
    
    NSString *path = nil;
    if (logoPath) {
        path = logoPath;
    } else {
        path = [resourceBundle pathForResource:@"default" ofType:@"png" inDirectory:@"SocialTheme/default"];
    }
    
    return [UIImage imageWithContentsOfFile:path];
}

@end
