//
//  dealsJSON.m
//  tripify
//
//  Created by Arie on 7/20/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "dealsJSON.h"

@implementation dealsJSON
-(id)initWithDictionary:(NSDictionary *)dictionary{
	self=[super init];
	if(self){
		//self.BirthDate=[dictionary objectForKey:@"BirthDate"];
		self.headline=[dictionary objectForKey:@"headline"];
		self.provider=[dictionary objectForKey:@"provider"];
		self.featured=[dictionary objectForKey:@"featured"];
		self.deal_type=[dictionary objectForKey:@"deal_type"];
		self.url=[dictionary objectForKey:@"url"];
		self.price_currency=[[dictionary objectForKey:@"price"]objectForKey:@"currency"];
		self.price_amount=[[dictionary objectForKey:@"price"]objectForKey:@"amount"];
		self.price_amount=[[dictionary objectForKey:@"price"]objectForKey:@"formatted"];
		self.image_original=[[dictionary objectForKey:@"image"]objectForKey:@"original"];
		self.image_original=[[dictionary objectForKey:@"image"]objectForKey:@"thumbnail"];
		self.location=[dictionary objectForKey:@"location"];
	}
	return self;
}

@end