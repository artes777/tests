//
//  VKAppDelegate.m
//  photo_test
//
//  Created by Apple on 28.02.15.
//  Copyright (c) 2015 artes. All rights reserved.
//

#import "VKAppDelegate.h"
@implementation VKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    [VKSdk processOpenURL:url fromApplication:sourceApplication];
    
    return YES;
}

@end
