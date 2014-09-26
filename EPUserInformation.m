//
//  EPUserInformation.m
//  Northrend
//
//  Created by ddong on 14-9-23.
//  Copyright (c) 2014年 ddong. All rights reserved.
//

#import "EPUserInformation.h"

@implementation EPUserInformation
-(id)initWithUsername:(NSString*)targetName password:(NSString*)targetPassword email:(NSString*)targetEmail
{
    _username = targetName;
    _password = targetPassword;
    _email = targetEmail;
    self = [super init];
    return self;
}
-(id)init
{
    _username = @"";
    _password = @"";
    _email = @"";
    self = [super init];
    return self;
}
-(BOOL)isPasswordCorrect:(NSString*)testPassword
{
    if ([testPassword isEqualToString:_password])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
@end
