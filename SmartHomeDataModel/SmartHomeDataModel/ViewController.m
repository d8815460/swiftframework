//
//  ViewController.m
//  SmartHomeDataModel
//
//  Created by Jian on 5/10/16.
//  Copyright © 2016 ME. All rights reserved.
//

#import "ViewController.h"
#import "DMGateway.h"


@interface ViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>


@property (nonatomic, strong) DMGateway *gateway;


@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass: [UITableViewCell class]
           forCellReuseIdentifier: @"cell"];

    
    __block typeof(self) weakself = self;
    
    NSString *uid = @"DRFTBHN6XXUUVM6KWTE1";
    
    [DMGateway dataWithUID: uid
           completionBlock: ^(DMGateway *gateway) {
               
               self.gateway = gateway;
               NSLog(@"gateway uid: %@", self.gateway.identity);
               
               [weakself.tableView reloadData];
           }
                errorBlock: ^(NSError *error) {
                    
                    NSLog(@"error: %@", [error description]);
                }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - /// 

-(void)testing
{
    //    NSLog(@"size of NSString class: %ld", sizeof(NSString *));
    
    //    NSString *message = malloc(45);
    
    //@"abcd ...";
    //    int result = kalay_device_message([msg UTF8String], sizeof([NSString class]));
    
    //    char *msg = (char *)[message UTF8String];
    
    //    char msg[sizeof([NSString class])];
    //
    //    strcpy(msg, [message UTF8String]);
    
    //    printf("message: %s;\n size of NSString class: %ld", [message UTF8String], sizeof([NSString class]));
    
    
//    char *msg[8192];
//    
//    // eddy
//    msg = malloc(45);
//    strcpy(msg, "bla bla bla bla bla bla bla bla bla bla ...");
//    
//    
//    // back
//    NSString *string = [NSString stringWithUTF8String: msg];
//    
//    free(msg);
//    
//    NSLog(@"string: %@", string);
}


#pragma mark - /// UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.gateway numberOfLocations];
}

-(NSInteger)    tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section
{
    return [self.gateway numberOfAccessoriesAtSection: section];
}

-(NSString *)   tableView:(UITableView *)tableView
  titleForHeaderInSection:(NSInteger)section
{
    DMLocation *location = [self.gateway locationAtSection: section];
    
    return location.name;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle
                                                   reuseIdentifier: @"cell"];
    
//    [tableView dequeueReusableCellWithIdentifier: @"cell" forIndexPath: indexPath];
    
    DMBaseAccessory *accessory = [self.gateway accessoryAtIndexPath: indexPath];
    NSLog(@"accessory ID: %@; accessory name: %@", accessory.identity, accessory.name);
    
    [self.gateway addAccessoriesAtIndexPaths: @[indexPath]
                          toGroupAtIndexPath: indexPath
                                  errorBlock: ^(NSError *error) {
                                      
                                      NSLog(@"error: %@", error);
                                  }];
    
    cell.textLabel.text = accessory.identity;
    cell.detailTextLabel.text = accessory.name;
    
    return cell;
}


#pragma mark - /// UITableViewDelegate



@end
