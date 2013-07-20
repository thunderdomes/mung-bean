//
//  tripifyViewController.m
//  tripify
//
//  Created by Arie on 7/20/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "tripifyViewController.h"
#import "tripifyCell.h"
@interface tripifyViewController ()

@end

@implementation tripifyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.view.backgroundColor=[UIColor colorWithRed:0.953 green:0.953 blue:0.953 alpha:1];
		deals_array=[[NSMutableArray alloc]init];
		deals_table=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height-44)];
		deals_table.delegate=self;
		deals_table.dataSource=self;
		deals_table.separatorColor=[UIColor clearColor];
		
		[self.view addSubview:deals_table];
		
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:YES];
	[self initNavbar];
	[self fetchData];
	
	
}
-(void)fetchData{
	NSString *url=[NSString stringWithFormat:@"%@&api_key=%@",deal_url,api_key];
	AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:url]];
	[httpClient setParameterEncoding:AFFormURLParameterEncoding];
	NSMutableURLRequest *request = [httpClient requestWithMethod:@"get"
															path:nil
													  parameters:nil];
	[AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
	AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id responseObject) {
		for(id deals_object in [responseObject objectForKey:@"deals"]){
			dealsJSON *object=[[dealsJSON alloc] initWithDictionary:deals_object];
			[deals_array addObject:object];
		}
		[deals_table reloadData];
    }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
		NSLog(@"error %@",error);
    }];
    
	// self.filteredArray = [NSMutableArray arrayWithCapacity:netrax.count];
	
    [operation start];
	
}
-(void)initNavbar{
	[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:UIBarMetricsDefault];
	UIImage* image = [UIImage imageNamed:@"left"];
	CGRect frame = CGRectMake(-5, 0, 44, 44);
	UIButton* leftbutton = [[UIButton alloc] initWithFrame:frame];
	[leftbutton setBackgroundImage:image forState:UIControlStateNormal];
	//[leftbutton setBackgroundImage:[UIImage imageNamed:@"left-push"] forState:UIControlStateHighlighted];
	[leftbutton addTarget:self action:@selector(lefbuttonPush) forControlEvents:UIControlEventTouchUpInside];
	
	UIView *leftbuttonView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
	leftbuttonView.backgroundColor=[UIColor clearColor];
	[leftbuttonView addSubview:leftbutton];
	UIBarButtonItem* leftbarbutton = [[UIBarButtonItem alloc] initWithCustomView:leftbuttonView];
	
	
	UIImage* image3 = [UIImage imageNamed:@"right"];
	CGRect frame3 = CGRectMake(5, 0, 44, 44);
	UIButton *searchbutton = [[UIButton alloc] initWithFrame:frame3];
	[searchbutton setBackgroundImage:image3 forState:UIControlStateNormal];
	//[searchbutton setBackgroundImage:[UIImage imageNamed:@"search-button-pressed"] forState:UIControlStateHighlighted];
	[searchbutton addTarget:self action:@selector(rightbuttonPush) forControlEvents:UIControlEventTouchUpInside];
	
	UIView *RightbuttonView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
	RightbuttonView.backgroundColor=[UIColor clearColor];
	[RightbuttonView addSubview:searchbutton];
	
	
	UIBarButtonItem* rightbarButton = [[UIBarButtonItem alloc] initWithCustomView:RightbuttonView];
	
	
	[self.navigationItem setRightBarButtonItem:rightbarButton];
	[self.navigationItem setLeftBarButtonItem:leftbarbutton];
	
	//[rightbarButton release];
	//[leftbarbutton release];
	
	UIView *top_label=[[UIView alloc]initWithFrame:CGRectMake(45, 0, 230, 44)];
	top_label.backgroundColor=[UIColor clearColor];
	
	UILabel *TitleBig=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 230, 44)];
	TitleBig.text=@"tripify";
	TitleBig.textAlignment=NSTextAlignmentCenter;
	TitleBig.backgroundColor=[UIColor clearColor];
	[TitleBig setFont:[UIFont fontWithName:@"AvenirNext-Regular" size:22]];
	TitleBig.textColor = [UIColor whiteColor];
	TitleBig.hidden=NO;
	[top_label addSubview:TitleBig];
	[self.navigationController.navigationBar addSubview:top_label];


}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return  125;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return deals_array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	dealsJSON  *object_draw=[deals_array objectAtIndex:indexPath.row];
    static NSString *CellIdentifier = @"deals";
    
    tripifyCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[tripifyCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
	cell.textLabel.text=object_draw.headline;
	cell.detailTextLabel.text=object_draw.deal_type;
	[cell.thumbnail setImageWithURL:[NSURL URLWithString:object_draw.image_thumb] placeholderImage:[UIImage imageNamed:@"placeholder-avatar"]];
	if([object_draw.deal_type isEqualToString:@"flights"]){
		cell.top.backgroundColor=[UIColor colorWithRed:0.137 green:0.761 blue:0.918 alpha:1];//[UIColor colorWithRed:0.98 green:0.396 blue:0.639 alpha:1];
	}
	else if([object_draw.deal_type isEqualToString:@"packages"]){
		cell.top.backgroundColor=[UIColor colorWithRed:1 green:0.663 blue:0.353 alpha:1];
	}
	else if([object_draw.deal_type isEqualToString:@"hotels"]){
		cell.top.backgroundColor=[UIColor colorWithRed:0.18 green:0.725 blue:0.486 alpha:1];
	}
	
	cell.detailTextLabel.backgroundColor=[UIColor clearColor];
	cell.selectionStyle=UITableViewCellEditingStyleNone;
	
	
    return cell;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
