//
//  tripifyLocation.m
//  tripify
//
//  Created by Arie on 9/8/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "tripifyLocation.h"

@interface tripifyLocation ()

@end

@implementation tripifyLocation

NSString *url_settings=@"http://deals.wego.com/api/filters.js?market=localize&api_key=c055c1b373c6d9d84c0c";

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self fetchLocation:nil];
	self.view.backgroundColor=[UIColor whiteColor];
	navBar= self.navigationController.navigationBar;
	
	UIImage *imagebar = [UIImage imageNamed:@"navbar2-kanan2"];
	[navBar setBackgroundImage:imagebar forBarMetrics:UIBarMetricsDefault];
	titleView=[[UIView alloc]init];
	titleLabel=[[UILabel alloc]init];
	tableLocation=[[UITableView alloc]init];
	location_name=[[NSString alloc]init];
	location_id=[[NSString alloc]init];
	country_name=[[NSString alloc]init];
	World_Name=[[NSString alloc]init];
    locationData=[[NSMutableArray alloc]init];
	
	
	// Do any additional setup after loading the view.
}


-(void)viewDidLayoutSubviews{
	self.view.backgroundColor=[UIColor colorWithRed:0.98 green:0.984 blue:0.984 alpha:1];
	titleLabel.frame=CGRectMake(0, 0, 210, 40);
	titleView.backgroundColor=[UIColor clearColor];
	titleLabel.backgroundColor=[UIColor clearColor];
	titleLabel.text=@"Choose Location";
	titleLabel.textColor=[UIColor whiteColor];
	titleLabel.textAlignment=NSTextAlignmentCenter;
	[titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:18]];
	[titleView addSubview:titleLabel];
	titleView.frame=CGRectMake(50, 2, 210, 40);
	[navBar addSubview:titleView];
	self.tableView.separatorColor= [UIColor colorWithRed:0.937 green:0.937 blue:0.937 alpha:1];
	self.tableView.backgroundColor=[UIColor whiteColor];
	
	// Create a custom button with the image
    buttonClose=  [UIButton buttonWithType:UIButtonTypeCustom];
	buttonClose.Frame=CGRectMake(20,0, 66, 66);
	//buttonClose.backgroundColor=[UIColor blackColor];
	
	[buttonClose setBackgroundImage:[UIImage imageNamed: @"close-retina"] forState:UIControlStateNormal];
	//[buttonClose setImage:[UIImage imageNamed:@"close-retina"] forState:UIControlStateNormal];
	
	
    [buttonClose addTarget:self action:@selector(closebutton) forControlEvents:UIControlEventTouchUpInside];
	
	
	
    // Create a container bar button
    UIBarButtonItem *containingBarButton2 = [[UIBarButtonItem alloc] initWithCustomView:buttonClose];
    self.navigationItem.leftBarButtonItem = containingBarButton2;
	
	
	
}

-(void)fetchLocation:(NSString*)Keypath{
	
	
	NSURL *URL=[NSURL URLWithString:url_settings];
	NSURLRequest *request=[[NSURLRequest alloc] initWithURL:URL];
	AFJSONRequestOperation *operation=[[AFJSONRequestOperation alloc] initWithRequest:request];
	
	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
		
		data=[responseObject objectForKey:@"location_ids"];
		data2=[responseObject objectForKey:@"country_ids"];
		data3=[responseObject objectForKey:@"world_region_ids"];
		datasearch=[data allKeys];
		NSArray *as=[[NSArray alloc]init];
		NSArray *asu=[[NSArray alloc]init];
		as=[data2 allKeys];
		asu=[data3 allKeys];
		a=[[NSMutableArray alloc]init];
		
		NSArray  *sortedArray = [datasearch sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
		NSDictionary *city = [NSDictionary dictionaryWithObject:sortedArray forKey:@"Countries"];
		[a addObject:city];
		
		
		NSArray  *sortedArrays = [as sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
		NSDictionary *country = [NSDictionary dictionaryWithObject:sortedArrays forKey:@"Countries"];
		[a addObject:country];
		
		NSArray  *sortedArrayss = [asu sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
		NSDictionary *region = [NSDictionary dictionaryWithObject:sortedArrayss forKey:@"Countries"];
		[a addObject:region];
		
		if(Keypath==NULL){
			NSString *Market=[[NSString alloc]init];
			Market=[responseObject objectForKey:@"market_name"];
			[self.tableView reloadData];
		}
		else{
			
			location_name=[NSString stringWithFormat:@"%@",Keypath];
			location_id=[NSString stringWithFormat:@"%@",[data objectForKey:Keypath]];
			
			if([data objectForKey:Keypath]==NULL){
				location_id=@"";
				
			}
			country_name=[NSString stringWithFormat:@"%@",[data2 objectForKey:Keypath]];
			if([data2 objectForKey:Keypath]==NULL){
				country_name=@"";
				
			}
			World_Name=[NSString stringWithFormat:@"%@",[data3 objectForKey:Keypath]];
			if([data3 objectForKey:Keypath]==NULL){
				World_Name=@"";
				
			}
			[locationData addObject:location_name];
			[locationData addObject:location_id];
			[locationData addObject:country_name];
			[locationData addObject:World_Name];
			[self passData];
		}
		
		
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		[self closebutton];
		
	}];
	[operation start];
	
}
-(void)passData{
	[[NSNotificationCenter defaultCenter] postNotificationName:@"passLocation" object:locationData];
	[locationData removeAllObjects];
	
	
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
	return [a count];
}

-(void)closebutton{
	//[self dismissModalViewControllerAnimated:YES];
	
}
// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	//Number of rows it should expect should be based on the section
	NSDictionary *dictionary = [a objectAtIndex:section];
    NSArray *array = [dictionary objectForKey:@"Countries"];
	return [array count];
}
/*
 - (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
 UIView* citySection = [[[UIView alloc] initWithFrame:CGRectMake(0,0,320,26)] autorelease];
 citySection.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Separator-regions"]];
 if(section == 0){
 
 return @"City";
 }
 else
 return @"Country";
 }
 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	UIView* citySection = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,26)];
	citySection.backgroundColor=[UIColor blackColor];
	UILabel *labelforCity=[[UILabel alloc]init];
	labelforCity.backgroundColor=[UIColor clearColor];
	labelforCity.textColor=[UIColor whiteColor];
	labelforCity.text=@"Cities";
	labelforCity.frame=CGRectMake(5, -2, 100, 26);
	[labelforCity setFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:12 ] ];
	[citySection addSubview:labelforCity];
	
	UIView* contrySection = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,26)];
	contrySection.backgroundColor=[UIColor blackColor];
	
	UILabel *labelforCountry=[[UILabel alloc]init];
	labelforCountry.text=@"Contries";
	labelforCountry.backgroundColor=[UIColor clearColor];
	labelforCountry.textColor=[UIColor whiteColor];
	labelforCountry.frame=CGRectMake(5, -2, 100, 26);
	[labelforCountry setFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:12 ] ];
	[contrySection addSubview:labelforCountry];
	
	UIView* worldSection = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,26)];
	worldSection.backgroundColor=[UIColor blackColor];
	
	UILabel *labelforWR=[[UILabel alloc]init];
	labelforWR.text=@"World Region";
	labelforWR.backgroundColor=[UIColor clearColor];
	labelforWR.textColor=[UIColor whiteColor];
	labelforWR.frame=CGRectMake(5, -2, 100, 26);
	[labelforWR setFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:12 ] ];
	[worldSection addSubview:labelforWR];
	
	
    if(section == 0){
		
		return citySection;
	}
	else if(section == 1){
		return contrySection;
	}
	else
		return worldSection;
	
	
}
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Set up the cell...
	
	//First get the dictionary object
	NSDictionary *dictionary = [a objectAtIndex:indexPath.section];
	NSArray *array = [dictionary objectForKey:@"Countries"];
	NSString *cellValue = [array objectAtIndex:indexPath.row];
	
	cell.textLabel.text = cellValue;
	
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
	[cell.textLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:15 ] ];
	cell.textLabel.textColor=[UIColor colorWithRed:0.353 green:0.369 blue:0.376 alpha:1];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	buttonCheck.enabled=TRUE;
	
	NSDictionary *dictionary = [a objectAtIndex:indexPath.section];
	NSArray *array = [dictionary objectForKey:@"Countries"];
	NSString *selectedCountry = [array objectAtIndex:indexPath.row];
	keypathLocation=selectedCountry;
	[self fetchLocation:keypathLocation];
	
	//[self close];
	
}



- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
	
	[self tableView:tableView didSelectRowAtIndexPath:indexPath];
	
}

- (void)dealloc {
}


@end
