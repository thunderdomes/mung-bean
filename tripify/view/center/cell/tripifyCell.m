//
//  tripifyCell.m
//  tripify
//
//  Created by Arie on 7/20/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "tripifyCell.h"

@implementation tripifyCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
		self.container=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 125)];
		self.container.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"container"]];
		
		self.thumbnail=[[UIImageView alloc]initWithFrame:CGRectMake(15, 12, 90, 90)];
		self.thumbnail.layer.cornerRadius = 6.5;
		self.thumbnail.layer.masksToBounds = YES;
		
		self.shadow=[[UIView alloc]initWithFrame:CGRectMake(15, 12, 90, 90)];
		self.shadow.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"shadow"]];
		
		self.top=[[UIView alloc]initWithFrame:CGRectMake(9, 4, 301, 3)];
		self.top.backgroundColor=[UIColor blackColor];
		self.symlink=[[UIImageView alloc]initWithFrame:CGRectMake(15, 61.5,40.5,40.5)];
		self.symlink.backgroundColor=[UIColor clearColor];
		
		self.price=[[UILabel alloc]initWithFrame:CGRectMake(110, 15, 200, 20)];
		self.price.backgroundColor=[UIColor clearColor];
		self.price.textColor=[UIColor colorWithRed:0.267 green:0.267 blue:0.267 alpha:1];
		self.price.font=[UIFont fontWithName:@"AvenirNext-Bold" size:18];
		
		self.headline=[[UILabel alloc]initWithFrame:CGRectMake(110,33, 195, 44)];
		self.headline.backgroundColor=[UIColor clearColor];
		self.headline.textColor=[UIColor colorWithRed:0.537 green:0.537 blue:0.537 alpha:1];
		self.headline.font=[UIFont fontWithName:@"HelveticaNeue-Bold" size:12];
		[self.headline setNumberOfLines:2];
		self.headline.lineBreakMode=NSLineBreakByCharWrapping;

		self.location=[[UILabel alloc]initWithFrame:CGRectMake(110, 76.5, 130, 25)];
		self.location.backgroundColor=[UIColor redColor];
		self.location.textColor=[UIColor whiteColor];
		self.location.numberOfLines=1;
		self.location.lineBreakMode=NSLineBreakByCharWrapping;
		self.location.textAlignment=NSTextAlignmentCenter;
		self.location.font=[UIFont fontWithName:@"AvenirNext-DemiBold" size:13];
		self.location.layer.cornerRadius = 3.5;
		self.location.layer.masksToBounds = YES;
		
		[self.container addSubview:self.top];
		[self.container addSubview:self.thumbnail];
		[self.container addSubview:self.shadow];
		[self.container addSubview:self.price];
		[self.container addSubview:self.headline];
		[self.container addSubview:self.symlink];
		[self.container addSubview:self.location];
		
		[self.contentView addSubview:self.container];

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
