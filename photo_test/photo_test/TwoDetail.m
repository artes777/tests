//
//  TwoDetail.m
//  photo_test
//
//  Created by Apple on 20.03.15.
//  Copyright (c) 2015 artes. All rights reserved.
//

#import "TwoDetail.h"

@interface TwoDetail ()

@end

@implementation TwoDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    
    [self load];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)load
{
    


    NSURL*url=[NSURL URLWithString:Photo];
    


               [self.mage3 setImageWithURL:url];
    
//

  
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)shareVK:(id)sender {
    
    NSString *string1 = [NSString stringWithFormat:@"%@%@%@",ownerId[0],@"_", IdPhoto[imagenumber]];
//    NSLog(@"%@",ownerId[0]);
//       NSLog(@"%@",IdPhoto[0]);
    NSLog(@"%@",string1);
    
    
    VKShareDialogController * shareDialog = [VKShareDialogController new]; //1
    shareDialog.text = @"Photo test #ios"; //2
    shareDialog.vkImages = @[string1]; //3
 
    [shareDialog setCompletionHandler:^(VKShareDialogControllerResult result) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }]; //5
    [self presentViewController:shareDialog animated:YES completion:nil]; //6
}
- (IBAction)shartFB:(id)sender {
    NSString*string=[NSString stringWithFormat:@"%@%@%@",@"https://www.facebook.com/sharer/sharer.php?&summary=test&u=",Photo,@"&summary=test"];

    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string]];

}
@end
