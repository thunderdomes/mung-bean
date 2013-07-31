//
//  tripifyViewController.h
//  tripify
//
//  Created by Arie on 7/20/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tripDetails.h"
@interface tripifyViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
	NSMutableArray *deals_array;
	UITableView *deals_table;
	NSInteger current_page;
	NSInteger total_page;
	NSInteger total_deals;
	tripDetails *details;
}
@end
