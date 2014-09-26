//
//  EPUser.h
//  Northrend
//
//  Created by ddong on 14-9-25.
//  Copyright (c) 2014年 ddong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface EPUser : NSManagedObject

@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * email;

@end
