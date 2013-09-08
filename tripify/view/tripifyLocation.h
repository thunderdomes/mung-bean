//
//  tripifyLocation.h
//  tripify
//
//  Created by Arie on 9/8/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tripifyLocation : UITableViewController<UITableViewDataSource,UITableViewDataSource>
{
	UINavigationBar *navBar;
	UIView *titleView;
	UILabel *titleLabel;
	UIButton *closeButton;
	UIButton *acceptButton;
	UITableView *tableLocation;
	
	NSArray *datasearch;
	NSMutableDictionary *data;
	NSMutableDictionary *data2;
	NSMutableDictionary *data3;
	NSMutableArray *a;
	UIButton *buttonCheck;
	NSMutableArray *locationData;
	UIButton *buttonClose;
	NSString *keypathLocation;
	NSString *location_name;
	NSString *location_id;
	NSString *country_name;
	NSString *World_Name;
}
@end

