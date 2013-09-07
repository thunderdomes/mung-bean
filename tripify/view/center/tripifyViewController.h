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
	UIView *popupView;
	UITableView *deals_table;
	NSInteger current_page;
	NSInteger total_page;
	NSInteger total_deals;
	tripDetails *details;
	
	UIImageView *deals_image_bg;
	UIImageView *deals_image;
	UILabel *location_;
	UILabel *price_;
	UILabel *headline_;
	UIView *divider;
	
	UIButton *twitter;
	UIButton *facebook;
	UIButton *checkout;
	NSString *url_dealss;
	UILabel *TitleBig;
	NSInteger status;
}
@end
