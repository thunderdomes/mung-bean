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
		self.view.frame=CGRectMake(0, 0, 270, 320);
		deals_image_bg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 270, 160)];
		divider=[[UIView alloc]initWithFrame:CGRectMake(0, 160, 270, 3)];
		deals_image=[[UIImageView alloc]initWithFrame:CGRectMake(95, 20,80, 80)];
		deals_image.layer.cornerRadius = 6.5;
		
		deals_image.layer.masksToBounds = YES;
		[deals_image.layer setBorderColor: [[UIColor whiteColor] CGColor]];
		[deals_image.layer setBorderWidth: 2.0];
		
		location_=[[UILabel alloc]initWithFrame:CGRectMake(0, 95, 270, 44)];
		location_.textColor=[UIColor whiteColor];
		location_.textAlignment=NSTextAlignmentCenter;
		location_.backgroundColor=[UIColor clearColor];
		location_.font=[UIFont fontWithName:@"AvenirNext-Bold" size:14];
		
		price_=[[UILabel alloc]initWithFrame:CGRectMake(0, 115, 270, 44)];
		price_.textColor=[UIColor whiteColor];
		price_.textAlignment=NSTextAlignmentCenter;
		price_.backgroundColor=[UIColor clearColor];
		price_.font=[UIFont fontWithName:@"AvenirNext-Bold" size:20];
		
		headline_=[[UILabel alloc]initWithFrame:CGRectMake(45, 180, 180, 100)];
		headline_.backgroundColor=[UIColor clearColor];
		headline_.textColor=[UIColor colorWithRed:0.537 green:0.537 blue:0.537 alpha:1];
		headline_.font=[UIFont fontWithName:@"HelveticaNeue-Bold" size:12];
		[headline_ setNumberOfLines:4];
		headline_.textAlignment=NSTextAlignmentCenter;
		headline_.lineBreakMode=NSLineBreakByCharWrapping;
		
		facebook=[UIButton buttonWithType:UIButtonTypeCustom];
		facebook.frame=CGRectMake(13, 245, 244, 43);
		//facebook.backgroundColor=[UIColor blackColor];
		[facebook setBackgroundImage:[UIImage imageNamed:@"show"] forState:UIControlStateNormal];
		[facebook setBackgroundImage:[UIImage imageNamed:@"showh"] forState:UIControlStateHighlighted];
		[facebook addTarget:self
					   action:@selector(jump)
			 forControlEvents: UIControlEventTouchUpInside];
		twitter=[UIButton buttonWithType:UIButtonTypeCustom];
		twitter.frame=CGRectMake(60, 225, 34, 34);
		//facebook.backgroundColor=[UIColor blackColor];
		[twitter setBackgroundImage:[UIImage imageNamed:@"twitter"] forState:UIControlStateNormal];
		[twitter setBackgroundImage:[UIImage imageNamed:@"twitter"] forState:UIControlStateHighlighted];
		
		[self.view addSubview:deals_image_bg];
		[self.view addSubview:divider];
		[self.view addSubview:deals_image];
		[self.view addSubview:location_];
		[self.view addSubview:price_];
		[self.view addSubview:headline_];
		
		[self.view addSubview:facebook];

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
	NSLog(@"self url-->%@",self.url);
	[deals_image_bg setImage:[UIImage imageNamed:[NSString stringWithFormat:@"bg_%@",self.deal_type]]];
	
	if([self.deal_type isEqualToString:@"hotels"]){
		divider.backgroundColor=[UIColor colorWithRed:0.18 green:0.725 blue:0.486 alpha:1];
	}
	else if([self.deal_type isEqualToString:@"packages"]){
		divider.backgroundColor=[UIColor colorWithRed:1 green:0.663 blue:0.353 alpha:1];
	}
	else{
		divider.backgroundColor=[UIColor colorWithRed:0.98 green:0.376 blue:0.627 alpha:1];
	}
	
	if(self.price_amount==NULL){
		price_.text=@"Enquire";
	}
	else{
		[price_ setText:self.price_amount];
	}
	
	if(self.location==NULL){
		location_.text=@"Featured";
	}
	else{
		[location_ setText:self.location];
	}
	headline_.text=self.headline;
	[headline_ sizeToFit];
	[deals_image setImageWithURL:[NSURL URLWithString:self.image_original] placeholderImage:nil];
}
-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:YES];

	
	
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)jump{
	//NSURL *url = [NSURL URLWithString:@"http://www.iphonedevelopertips.com"];
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.url]];
}
@end
