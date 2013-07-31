//
//  tripifyAppDelegate.h
//  tripify
//
//  Created by Arie on 7/20/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tripifyViewController.h"
@interface tripifyAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,strong) tripifyViewController *tripimain;
@property(nonatomic,strong) UINavigationController *mains;
@end
