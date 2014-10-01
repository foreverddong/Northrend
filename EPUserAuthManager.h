//
//  EPUserAuthManager.h
//  Northrend
//
//  Created by ddong on 14-9-29.
//  Copyright (c) 2014年 ddong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EPUserDataManager.h"
#import "EPUserManagedObject.h"
@interface EPUserAuthManager : NSObject{
    EPUserManagedObject *user;
    EPUserDataManager *manager;
    NSMutableArray *allData;
}
-(BOOL)selectUserWithName:(NSString*)sourceUsername ifMatchesPassword:(NSString*)sourcePassword;
-(BOOL)selectUserWithName:(NSString*)sourceUsername;
@end
