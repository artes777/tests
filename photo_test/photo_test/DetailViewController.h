//
//  DetailViewController.h
//  photo_test
//
//  Created by Apple on 20.03.15.
//  Copyright (c) 2015 artes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewController.h"
#import <VKSdk/VKSdk.h>
#import "UIImageView+AFNetworking.h"
#import "CollectionViewCell.h"


int b;
int imagenumber;
NSMutableArray *arraySize;
NSMutableArray *arrayFoto;
NSMutableArray *IdPhoto;
UIImageView*ivg;
NSString*Photo;
@interface DetailViewController : UICollectionViewController
@property(strong,nonatomic)IBOutlet NSString*size;


@end
