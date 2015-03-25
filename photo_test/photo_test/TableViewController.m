//
//  TableViewController.m
//  rinh
//
//  Created by Apple on 11.01.15.
//  Copyright (c) 2015 artes. All rights reserved.
//

#import "TableViewController.h"
#import "MyCell.h"




@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {

    
    [super viewDidLoad];
 


    

    
    [self download];


    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source





-(void)download
{

    
    
static NSString *const VK_API_NEEDCOVERS = @"need_covers";
    
    
    
    VKRequest * getWall = [VKRequest requestWithMethod:@"photos.getAlbums" andParameters:@{VK_API_NEEDCOVERS:@"1"} andHttpMethod:@"GET"];
    [getWall executeWithResultBlock:^(VKResponse * response) {
        
 NSString*kol =[response.json objectForKey:@"count"];
        a=[kol intValue]-1;

 arrayPhoto= [[NSMutableArray alloc] init];
         arrayTitle= [[NSMutableArray alloc] init];
               arrayId= [[NSMutableArray alloc] init];
        ownerId= [[NSMutableArray alloc] init];
        
        for(int i=0;i<=a;i++)
        {
            [arrayTitle addObject:[response.json[@"items"] objectAtIndex:i][@"title"]];
  
            [arrayPhoto addObject:[response.json[@"items"] objectAtIndex:i][@"thumb_src"]];
            
            [arrayId addObject:[response.json[@"items"] objectAtIndex:i][@"id"]];
            
            [ownerId addObject:[response.json[@"items"] objectAtIndex:i][@"owner_id"]];
        }
        
        [self.datas reloadData];


        
     // NSLog(@"%@",[response.json[@"items"] objectAtIndex:0][@"thumb_id"]);


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
  
    
    NSIndexPath*indexPath=[self.tableView indexPathForSelectedRow];
   int row=[indexPath row];
    
   ids=arrayId[row];

    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    

    
    return a+1;
}

-(void)fwefew
{
    [self.datas reloadData];
}

- (IBAction)reload:(id)sender
{
    [self download];
   
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CellIdentifier = @"MyCell";
    MyCell*cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier           forIndexPath:indexPath];


    
    NSURL*uri=[NSURL URLWithString:arrayPhoto[indexPath.row]];
    [cell.image1 setImageWithURL:uri];
    cell.TitleLabel.text=arrayTitle[indexPath.row];

    
    
    return cell;
}



@end

