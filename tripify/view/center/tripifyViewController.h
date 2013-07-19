//
//  tripifyViewController.h
//  tripify
//
//  Created by Arie on 7/20/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tripifyViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
	NSMutableArray *deals_array;
	UITableView *deals_table;
}
@end
