//
//  tripDetails.h
//  tripify
//
//  Created by Arie on 7/20/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tripDetails : UIViewController
{
	UIImageView *deals_image_bg;
	UIImageView *deals_image;
	UILabel *location_;
	UILabel *price_;
	UILabel *headline_;
	UIView *divider;
	
	UIButton *twitter;
	UIButton *facebook;
	UIButton *checkout;
	
	
}
@property(nonatomic,strong) NSString *headline;
@property(nonatomic,strong) NSString *provider;
@property(nonatomic,strong) NSString *featured;
@property(nonatomic,strong) NSString *deal_type;
@property(nonatomic,strong) NSString *url;
@property(nonatomic,strong) NSString *price_currency;
@property(nonatomic,strong) NSString *price_amount;
@property(nonatomic,strong) NSString *price_formatted;
@property(nonatomic,strong) NSString *image_thumb;
@property(nonatomic,strong) NSString *image_original;
@property(nonatomic,strong) NSString *location;
@end
