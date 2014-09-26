//
//  EPCoreDataManager.h
//  Northrend
//
//  Created by ddong on 14-9-25.
//  Copyright (c) 2014年 ddong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface EPCoreDataManager : NSObject
    @property (strong,nonatomic) NSManagedObjectContext *managedObjectContext;
    @property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
    @property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@end
