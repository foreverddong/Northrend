//
//  FirstViewController.m
//  Northrend
//
//  Created by ddong on 14-9-23.
//  Copyright (c) 2014年 ddong. All rights reserved.
//

#import "UserViewController.h"

@interface UserViewController ()
{
    EPClientNetwork *testNet;
}

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    testNet = [[EPClientNetwork alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)startThread:(id)sender
{
    [testNet startClientConnection];
}
@end
