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
		self.thumbnail.layer.cornerRadius = 5.0;
		self.thumbnail.layer.masksToBounds = YES;
		
		self.top=[[UIView alloc]initWithFrame:CGRectMake(9, 4, 301, 3)];
		self.top.backgroundColor=[UIColor blackColor];
		[self.container addSubview:self.top];
		[self.container addSubview:self.thumbnail];
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
