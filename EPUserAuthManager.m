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

-(id)initWithDatabase
{
    manager = [[EPUserDataManager alloc] init];
    allData = [manager getAllObjectFromDatabase];
    self = [super init];
    return self;
}
-(id)init
{
    self = [super init];
    return self;
}
-(id)initWithDatabaseAndUser:(EPUserManagedObject*)sourceUser
{
    manager = [[EPUserDataManager alloc] init];
    allData = [manager getAllObjectFromDatabase];
    user = sourceUser;
    self = [super init];
    return self;
}
-(BOOL)selectUserWithName:(NSString *)sourceUsername ifMatchesPassword:(NSString *)sourcePassword
{
    for (EPUserManagedObject *sourceUser in allData)
    {
        if ([[sourceUser username] isEqualToString:sourceUsername])
        {
            user = sourceUser;
            break;
        }
    }
    if ([[user password] isEqualToString:sourcePassword] && user != nil)
    {
        return YES;
    }
    else
    {
        user = nil;
        return NO;
    }
}
-(BOOL)selectUserWithName:(NSString*)sourceUsername
{
    for (EPUserManagedObject *sourceUser in allData)
    {
        if ([[sourceUser username] isEqualToString:sourceUsername])
        {
            user = sourceUser;
            break;
        }
    }
    if (user != nil)
    {
    return YES;
    }
    else
    {
        return NO;
    }
}
-(BOOL)insertUserIntoDatabase
{
    return YES;
}
@end
