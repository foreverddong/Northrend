//
//  EPClientNetworkMessage.m
//  Northrend
//
//  Created by ddong on 14-9-23.
//  Copyright (c) 2014年 ddong. All rights reserved.
//

#import "EPClientNetwork.h"
#import "UserViewController.h"
#define do_something
#define kBufferSize 1024
@implementation EPClientNetwork

-(void)startClientConnection
{
    NSString *serverAddress = @"192.168.1.103:1024";
    serverURL = [NSURL URLWithString:(serverAddress)];
    NSThread *networkThread = [[NSThread alloc] initWithTarget:self selector:@selector(loadDataFromServerWithUrl:) object:serverURL];
    [networkThread start];
}

-(void)loadDataFromServerWithUrl:(NSURL*)serverUrl
{
    NSInputStream *inStream;
    NSOutputStream *outStream;
    NSMutableData *dataBuffer;
    [NSStream getStreamsToHostWithName:[serverUrl host] port:[[serverUrl port] integerValue] inputStream: &inStream outputStream:&outStream];
    [inStream setDelegate:self];
    [inStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [inStream open];
    [[NSRunLoop currentRunLoop] run];
}

- (void)didReceiveData:(NSData *)data {
    if (_receivedData == nil) {
        _receivedData = [[NSMutableData alloc] init];
    }
    [_receivedData appendData:data];
    UIStoryboard *mainBoard = [UIStoryboard storyboardWithName:@"Main.storyboard" bundle:nil];
    
    // Update UI
    //
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
       NSString * resultsString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        UserViewController *userView = [mainBoard instantiateViewControllerWithIdentifier:@"UserView"];
        [[userView resultTextField] setText:resultsString];
    }];
}
#pragma mark NSStreamDelegate
    
-(void)loadDataFromServerWithURL:(NSURL *)url
{
    NSInputStream * readStream;
    [NSStream getStreamsToHostWithName:[url host]
                               port:[[url port] integerValue]
                        inputStream:&readStream
                       outputStream:NULL];
    
    [readStream setDelegate:self];
    [readStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [readStream open];
    
    [[NSRunLoop currentRunLoop] run];
}
- (void)didFinishReceivingData
{
    [self networkSucceedWithData:_receivedData];
}

- (void)networkSucceedWithData:(NSData *)data
{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        NSString * resultsString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@" >> Received string: '%@'", resultsString);
    }];
    
}

- (void)stream:(NSStream *)stream handleEvent:(NSStreamEvent)eventCode
{
    NSLog(@" >> NSStreamDelegate in Thread %@", [NSThread currentThread]);
    
    switch (eventCode) {
        case NSStreamEventHasBytesAvailable: {
            if (_receivedData == nil) {
                _receivedData = [[NSMutableData alloc] init];
            }
            
            uint8_t buf[kBufferSize];
            int numBytesRead = [(NSInputStream *)stream read:buf maxLength:kBufferSize];
            
            if (numBytesRead > 0) {
                [self didReceiveData:[NSData dataWithBytes:buf length:numBytesRead]];
                
            } else if (numBytesRead == 0) {
                NSLog(@" >> End of stream reached");
                
            } else {
                NSLog(@" >> Read error occurred");
            }
            
            break;
        }
            
        case NSStreamEventErrorOccurred: {
            NSError * error = [stream streamError];
            NSString * errorInfo = [NSString stringWithFormat:@"Failed while reading stream; error '%@' (code %d)", error.localizedDescription, error.code];
            
            [self cleanUpStream:stream];
            
            [self networkFailedWithErrorMessage:errorInfo];
        }
            
        case NSStreamEventEndEncountered: {
            
            [self cleanUpStream:stream];
            
            [self didFinishReceivingData];
            
            break;
        }
            
        default:
            break;
    }
}
- (void)cleanUpStream:(NSStream *)stream
{
    [stream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [stream close];
    
    stream = nil;
}
- (void)networkFailedWithErrorMessage:(NSString *)message
{
    // Update UI
    /*
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        NSLog(@" >> %@", message);
        
        self.receiveTextView.text = message;
        self.connectButton.enabled = YES;
        [self.networkActivityView stopAnimating];
    }];
     */
}

@end
