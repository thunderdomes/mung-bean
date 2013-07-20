//
//  tripifyCell.h
//  tripify
//
//  Created by Arie on 7/20/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tripifyCell : UITableViewCell
@property(nonatomic,strong) UIView *container;
@property(nonatomic,strong) UILabel *price;
@property(nonatomic,strong) UILabel *headline;
@property(nonatomic,strong) UIView *top;
@property(nonatomic,strong) UILabel *location;
@property(nonatomic,strong) UILabel *provider;
@property(nonatomic,strong) UIImageView *thumbnail;
@property(nonatomic,strong) UIImageView *symlink;
@property(nonatomic,strong) UIView *shadow;
@end
