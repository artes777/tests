//
//  ViewController.m
//  photo_test
//
//  Created by Apple on 26.02.15.
//  Copyright (c) 2015 artes. All rights reserved.
//

#import "ViewController.h"

static NSString*const TOKEN_KEY = @"my_application_access_token";
static NSString *const NEXT_CONTROLLER_SEGUE_ID = @"START_WORK";
static NSArray  * SCOPE = nil;


@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    SCOPE = @[VK_PER_FRIENDS, VK_PER_WALL, VK_PER_AUDIO, VK_PER_PHOTOS, VK_PER_NOHTTPS, VK_PER_EMAIL, VK_PER_MESSAGES];
    [super viewDidLoad];
    //[VKSdk forceLogout];
    
  
    
    
    [VKSdk initializeWithDelegate:self andAppId:@"4802130"];
    if ([VKSdk wakeUpSession])
    {
        [self startWorking];
    
    }
}


- (void)startWorking {

    [self performSegueWithIdentifier:NEXT_CONTROLLER_SEGUE_ID sender:self];

//   VKRequest * getWall = [VKRequest requestWithMethod:@"photos.getAlbums" andParameters:@{VK_API_OWNER_ID: @"-35047085"} andHttpMethod:@"GET"];
//
//    [getWall executeWithResultBlock: ^(VKResponse *response) {
//        
//        //NSLog(@"%@",[response.json[@"items"] objectAtIndex:1][@"text"]);
//        NSLog(@"Result: %@", response);
//        
//         // self.callResult.text = [NSString stringWithFormat:@"Result: %@", response];
//        
//} errorBlock: ^(NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
//
//    
//


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)authorize:(id)sender {
[VKSdk forceLogout];
    
  [VKSdk authorize:SCOPE revokeAccess:YES];
    
    
   // [VKSdk authorize:SCOPE revokeAccess:YES];
}

- (void)vkSdkNeedCaptchaEnter:(VKError *)captchaError {
    VKCaptchaViewController *vc = [VKCaptchaViewController captchaControllerWithError:captchaError];
    [vc presentIn:self];
}

- (void)vkSdkTokenHasExpired:(VKAccessToken *)expiredToken {
    [self authorize:nil];
}

- (void)vkSdkReceivedNewToken:(VKAccessToken *)newToken {
    [self startWorking];
}

- (void)vkSdkShouldPresentViewController:(UIViewController *)controller {
    [self.navigationController.topViewController presentViewController:controller animated:YES completion:nil];

}
- (void)vkSdkAcceptedUserToken:(VKAccessToken *)token {
    [self startWorking];
}
- (void)vkSdkUserDeniedAccess:(VKError *)authorizationError {
    [[[UIAlertView alloc] initWithTitle:nil message:@"Access denied" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
}
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end