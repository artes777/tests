//
//  DetailViewController.m
//  photo_test
//
//  Created by Apple on 20.03.15.
//  Copyright (c) 2015 artes. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  



    arraySize= [[NSMutableArray alloc] init];
    
    IdPhoto =[[NSMutableArray alloc] init];


    [self load];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)bigload

{
    
  
    //static NSString *const VK_API_SIZES= @"photo_sizes";
    
   

    
    VKRequest * get = [VKRequest requestWithMethod:@"photos.get" andParameters:@{VK_API_OWNER_ID :ownerId[0],VK_API_ALBUM_ID:ids} andHttpMethod:@"GET"];
    
    [get executeWithResultBlock:^(VKResponse * respons) {

        for (int j=0;j<=b;j++)
        {


            [IdPhoto addObject:[respons.json[@"items"] objectAtIndex:j][@"id"]];
            
            
            if ([respons.json[@"items"] objectAtIndex:j][@"photo_2560"] != 0)
                
                 [arraySize addObject:[respons.json[@"items"] objectAtIndex:j][@"photo_2560"]];
            else if([respons.json[@"items"] objectAtIndex:j][@"photo_1280"] != 0)
            
             [arraySize addObject:[respons.json[@"items"] objectAtIndex:j][@"photo_1280"]];
            
            
            else if([respons.json[@"items"] objectAtIndex:j][@"photo_807"] != 0)
                
                [arraySize addObject:[respons.json[@"items"] objectAtIndex:j][@"photo_807"]];
            
            else if([respons.json[@"items"] objectAtIndex:j][@"photo_604"] != 0)
                
                [arraySize addObject:[respons.json[@"items"] objectAtIndex:j][@"photo_604"]];
            
            
            else if([respons.json[@"items"] objectAtIndex:j][@"photo_130"] != 0)
                
                [arraySize addObject:[respons.json[@"items"] objectAtIndex:j][@"photo_130"]];
            
            
         else
                
                [arraySize addObject:[respons.json[@"items"] objectAtIndex:j][@"photo_75"]];
            

            
            
   

        
        }
        
        
    } errorBlock:^(NSError * error) {
        if (error.code != VK_API_ERROR) {
            [error.vkError.request repeat];
        }
        else {
            NSLog(@"VK error: %@", error);
        }
    }];
    


    
    
}

-(void)load
{

    VKRequest * get = [VKRequest requestWithMethod:@"photos.get" andParameters:@{VK_API_OWNER_ID :ownerId[0],VK_API_ALBUM_ID:ids} andHttpMethod:@"GET"];
    
    [get executeWithResultBlock:^(VKResponse * respons) {
        

       
        NSString*ko =[respons.json objectForKey:@"count"];
  
        b=[ko intValue]-1;
    
       
         arrayFoto= [[NSMutableArray alloc] init];
        for(int j=0;j<=b;j++)
        {

    [arrayFoto addObject:[respons.json[@"items"] objectAtIndex:j][@"photo_604"]];
            
        }
   
    [self bigload];
        
    [self.collectionView reloadData];
        
      
        
    

        
        
        
    } errorBlock:^(NSError * error) {
        if (error.code != VK_API_ERROR) {
            [error.vkError.request repeat];
        }
        else {
            NSLog(@"VK error: %@", error);
        }
    }];
    

    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    CollectionViewCell*zc=(CollectionViewCell*)sender;
        
      
  
    
       NSIndexPath*indexpath=[self.collectionView indexPathForCell:zc];
       
    imagenumber =indexpath.row %10;
   
        Photo= arraySize[imagenumber];
    
        
  
        


     
        
    }
    


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
 
  
    
    
  
return b+1;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString*identifire=@"Cellss";
   
    CollectionViewCell*cells=(CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifire forIndexPath:indexPath];
    
    
    

        NSURL*sslk=[NSURL URLWithString:arrayFoto[indexPath.row]];
    [cells.mage2 setImageWithURL:sslk];

    
 
  


    

    return cells;
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
