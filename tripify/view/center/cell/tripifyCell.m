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
		
		self.top=[[UIView alloc]initWithFrame:CGRectMake(9, 4, 301, 2)];
		self.top.backgroundColor=[UIColor blackColor];
		[self.container addSubview:self.top];
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
