//
//  tripifyViewController.m
//  tripify
//
//  Created by Arie on 7/20/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "tripifyViewController.h"
#import "tripifyCell.h"
#import "SVWebViewController.h"
@interface tripifyViewController ()

@end

@implementation tripifyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

		self.view.backgroundColor=[UIColor blackColor];
		deals_array=[[NSMutableArray alloc]init];
		deals_table=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height-44)];
		deals_table.delegate=self;
		deals_table.dataSource=self;
		deals_table.separatorColor=[UIColor clearColor];
		
		popupView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 270, 350)];
		popupView.backgroundColor=[UIColor whiteColor];
		
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
		
		headline_=[[UILabel alloc]initWithFrame:CGRectMake(40, 180, 190, 100)];
		headline_.backgroundColor=[UIColor clearColor];
		headline_.textColor=[UIColor colorWithRed:0.537 green:0.537 blue:0.537 alpha:1];
		headline_.font=[UIFont fontWithName:@"HelveticaNeue-Bold" size:14];
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
		
		[popupView addSubview:deals_image_bg];
		[popupView addSubview:divider];
		[popupView addSubview:deals_image];
		[popupView addSubview:location_];
		[popupView addSubview:price_];
		[popupView addSubview:headline_];
		
		[popupView addSubview:facebook];

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
	[self initNavbar:@"0"];
	current_page=1;
	[self fetchData];
	
	
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	if  (scrollView.contentOffset.y == scrollView.contentSize.height - scrollView.frame.size.height) {
		current_page++;
		[self fetchData];
		return;
	}
}
-(void)fetchData{
	NSString *url=[NSString stringWithFormat:@"%@&api_key=%@&page=%d&per_page=10&currency=IDR",deal_url,api_key,current_page];
	NSLog(@"url-->%@",url);
	AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:url]];
	[httpClient setParameterEncoding:AFFormURLParameterEncoding];
	NSMutableURLRequest *request = [httpClient requestWithMethod:@"get"
															path:nil
													  parameters:nil];
	[AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
	AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id responseObject) {
		total_deals=[[responseObject objectForKey:@"total"]intValue];
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
-(void)initNavbar:(NSString *)status{
	[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar2"] forBarMetrics:UIBarMetricsDefault];
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


	[self.navigationController.navigationBar addSubview:top_label];


}
//////loading cell
-(UITableViewCell *) loadingCell{
	
	UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	UIActivityIndicatorView *activityIndicator=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
	activityIndicator.center=cell.center;
	[cell addSubview:activityIndicator];
	[activityIndicator startAnimating];
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	[activityIndicator startAnimating];
	return cell;
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
	if(current_page<total_page){
		
		return [deals_array count]+1;
	}
	
	return [deals_array count];
}
-(UITableViewCell *) empty{
	UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	return cell;
}
-(UITableViewCell *)DealsCellForRowAtIndexPath:(NSIndexPath *)indexPath{
	dealsJSON  *object_draw=[deals_array objectAtIndex:indexPath.row];
    static NSString *CellIdentifier = @"deals";
    
    tripifyCell *cell = [deals_table dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[tripifyCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
		cell.headline.text=object_draw.headline;
	[cell.symlink setImage:[UIImage imageNamed:object_draw.deal_type]];
	
	
	
	if(object_draw.price_formatted==NULL){
		cell.price.text=@"Enquire";
	}
	else{
		cell.price.text=object_draw.price_formatted;
	}

	if(object_draw.location==NULL){
		cell.location.text=@"Featured";
	}
	else{
		cell.location.text=object_draw.location;
		}
	[cell.location sizeToFit];
	CGRect frame = cell.location.frame;
	frame.size.width += 10; //l + r padding
	frame.size.height+=5;
	cell.location.frame= frame;
	
	
	[cell.thumbnail setImageWithURL:[NSURL URLWithString:object_draw.image_thumb] placeholderImage:[UIImage imageNamed:@"placeholder-avatar"]];
	if([object_draw.deal_type isEqualToString:@"flights"]){
		cell.top.backgroundColor=[UIColor colorWithRed:0.98 green:0.376 blue:0.627 alpha:1] ;//[UIColor colorWithRed:0.98 green:0.396 blue:0.639 alpha:1];
		cell.location.backgroundColor=[UIColor colorWithRed:0.98 green:0.376 blue:0.627 alpha:1] ;
	}
	else if([object_draw.deal_type isEqualToString:@"packages"]){
		cell.top.backgroundColor=[UIColor colorWithRed:1 green:0.663 blue:0.353 alpha:1];
		cell.location.backgroundColor=[UIColor colorWithRed:1 green:0.663 blue:0.353 alpha:1];
	}
	else if([object_draw.deal_type isEqualToString:@"hotels"]){
		cell.top.backgroundColor=[UIColor colorWithRed:0.18 green:0.725 blue:0.486 alpha:1] ;
		cell.location.backgroundColor=[UIColor colorWithRed:0.18 green:0.725 blue:0.486 alpha:1] ;
	}
	
	cell.detailTextLabel.backgroundColor=[UIColor clearColor];
	cell.selectionStyle=UITableViewCellEditingStyleNone;
	
	
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	dealsJSON  *object_draw=[deals_array objectAtIndex:indexPath.row];
	/*
	details =[[tripDetails alloc]init];
	dealsJSON  *object_draw=[deals_array objectAtIndex:indexPath.row];
	details.image_original=object_draw.image_original;
	details.price_amount=object_draw.price_formatted;
	details.location=object_draw.location;
	details.headline=object_draw.headline;
	details.deal_type=object_draw.deal_type;
	details.url=object_draw.url;
	[self presentPopupViewController:details animationType:MJPopupViewAnimationSlideBottomBottom];
	 */
	UIColor *color = [UIColor whiteColor];
	[deals_image_bg setImage:[UIImage imageNamed:[NSString stringWithFormat:@"bg_%@",object_draw.deal_type]]];
	
	if([object_draw.deal_type isEqualToString:@"hotels"]){
		divider.backgroundColor=[UIColor colorWithRed:0.18 green:0.725 blue:0.486 alpha:1];
	}
	else if([object_draw.deal_type isEqualToString:@"packages"]){
		divider.backgroundColor=[UIColor colorWithRed:1 green:0.663 blue:0.353 alpha:1];
	}
	else{
		divider.backgroundColor=[UIColor colorWithRed:0.98 green:0.376 blue:0.627 alpha:1];
	}
	
	if(object_draw.price_formatted==NULL){
		price_.text=@"Enquire";
	}
	else{
		[price_ setText:object_draw.price_formatted];
	}
	
	if(object_draw.location==NULL){
		location_.text=@"Featured";
	}
	else{
		[location_ setText:object_draw.location];
	}
	headline_.text = object_draw.headline;
	[headline_ sizeToFit];
	[deals_image setImageWithURL:[NSURL URLWithString:object_draw.image_original] placeholderImage:nil];
    [ASDepthModalViewController presentView:popupView
                            backgroundColor:color
                                    options:ASDepthModalOptionAnimationGrow | ASDepthModalOptionTapOutsideToClose
                          completionHandler:^{
                              NSLog(@"Modal view closed.");
							  url_dealss=@"";
                          }];
	url_dealss=object_draw.url;

	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if(indexPath.row<deals_array.count){
		return [self DealsCellForRowAtIndexPath:indexPath];
	}
	else{
		return [self loadingCell];
	}

	}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:YES];
	[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:UIBarMetricsDefault];
}
-(void)jump{
	[ASDepthModalViewController dismiss];
	[self initNavbar:@"1"];
	SVWebViewController *webViewController = [[SVWebViewController alloc] initWithURL:[NSURL URLWithString:url_dealss]];
	[self.navigationController pushViewController:webViewController animated:YES];
	[TitleBig setHidden:YES];
	
	
}
@end
