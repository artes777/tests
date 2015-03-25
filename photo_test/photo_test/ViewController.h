//
//  ViewController.h
//  photo_test
//
//  Created by Apple on 26.02.15.
//  Copyright (c) 2015 artes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <VKSdk/VKSdk.h>
#import <VKSdk/VKUploadImage.h>
#import "TableViewController.h"
UIImage *downloadedImage;

NSArray*array;

    VKRequest * getWall;



@interface ViewController : UIViewController


@property (readonly, nonatomic, strong) NSURLRequest *request;


@property (readonly, nonatomic, strong) NSData *responseData;






@end

