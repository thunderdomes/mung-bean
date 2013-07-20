//
//  tripDetails.m
//  tripify
//
//  Created by Arie on 7/20/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "tripDetails.h"

@interface tripDetails ()

@end

@implementation tripDetails

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.view.backgroundColor=[UIColor whiteColor];
		self.view.frame=CGRectMake(0, 0, 300, 300);

        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view.
}
-(void)viewDidLayoutSubviews{
	NSLog(@"url->%@")

}
-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:YES];

	
	
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
