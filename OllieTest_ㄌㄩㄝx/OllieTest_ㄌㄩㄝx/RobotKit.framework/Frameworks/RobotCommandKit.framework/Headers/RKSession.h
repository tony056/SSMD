//
//  RKSession.h
//  RobotCommandKit
//
//  Created by wes on 6/5/14.
//  Copyright (c) 2014 Orbotix Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKDeviceResponse.h"
#import "RKDeviceAsyncData.h"
#import "RKDeviceCommand.h"



@protocol RKSessionDelegate <NSObject>

-(void) handleResponse:(RKDeviceResponse*) response;

-(void) handleStringResponse:(NSString*) stringResponse;

-(void) handleAsyncData:(RKAsyncMessage*) asyncData;

@end

@interface RKSession : NSObject

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

+(id) sessionWithDelegate:(id<RKSessionDelegate>) delegate;

-(void) processRawData:(NSData*) rawBytesFromConnectedDevice;

+ (void)setMaxNativeSequenceNumber:(uint8_t)sequenceNumber;

-(NSData*) generatePacketForCommand:(RKDeviceCommand*) command withAck:(BOOL) ack;
-(NSData*) generatePacketForCommand:(RKDeviceCommand*) command;

@end
