//
//  EPUserAuthManager.m
//  Northrend
//
//  Created by ddong on 14-9-29.
//  Copyright (c) 2014年 ddong. All rights reserved.
//

#import "EPUserAuthManager.h"
#import "EPUserManagedObject.h"
@implementation EPUserAuthManager

-(id)init
{
    manager = [[EPUserDataManager alloc] init];
    allData = [manager getAllObjectFromDatabase];
    self = [super init];
    return self;
}
-(BOOL)isUsername:(NSString *)sourceUsername matchesPassword:(NSString *)sourcePassword
{
    for (EPUserManagedObject *sourceUser in allData)
    {
        if ([[sourceUser username] isEqualToString:sourceUsername])
        {
            user = sourceUser;
            break;
        }
    }
    if ([[user password] isEqualToString:sourcePassword])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
@end
