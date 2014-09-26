//
//  EPClientNetworkMessage.h
//  Northrend
//
//  Created by ddong on 14-9-23.
//  Copyright (c) 2014年 ddong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CFNetwork/CFNetwork.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <netinet/in.h>
#import <Arpa/inet.h>
@interface EPClientNetwork : NSObject
{

    NSURL *serverURL;
}
@property NSMutableData *receivedData;
@end
