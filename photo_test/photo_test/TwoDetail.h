//
//  TwoDetail.h
//  photo_test
//
//  Created by Apple on 20.03.15.
//  Copyright (c) 2015 artes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+AFNetworking.h"
#import "DetailViewController.h"
#import <VKSdk/VKSdk.h>


@interface TwoDetail : UIViewController
- (IBAction)shareVK:(id)sender;


@property (strong, nonatomic) IBOutlet UIImageView *mage3;
- (IBAction)shartFB:(id)sender;

@end
