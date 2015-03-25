//
//  TableViewController.h
//  photo_test
//
//  Created by Apple on 03.03.15.
//  Copyright (c) 2015 artes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "DetailViewController.h"
#import "UIImageView+AFNetworking.h"
#import "CollectionViewCell.h"


 NSMutableArray *arrayPhoto;
NSMutableArray *arrayTitle;

NSMutableArray *arrayId;
NSMutableArray *ownerId;
NSString*ids;



int a;

@interface TableViewController : UITableViewController

{
    
    NSArray*_dats;
    
}
@property (nonatomic,copy) IBOutlet NSString*photo;
@property (nonatomic,copy) IBOutlet NSString*title;


-(void)fwefew;

- (IBAction)reload:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *datas;










@end
