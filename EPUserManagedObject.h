//
//  EPUserManagedObject.h
//  Northrend
//
//  Created by ddong on 14-9-28.
//  Copyright (c) 2014年 ddong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface EPUserManagedObject : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * username;

@end