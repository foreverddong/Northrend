//
//  EPNewsManagedObject.h
//  Northrend
//
//  Created by ddong on 14-9-28.
//  Copyright (c) 2014年 ddong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface EPNewsManagedObject : NSManagedObject

@property (nonatomic, retain) NSString * imageURL;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * subtitle;
@property (nonatomic, retain) NSString * writer;
@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSString * address;

@end
