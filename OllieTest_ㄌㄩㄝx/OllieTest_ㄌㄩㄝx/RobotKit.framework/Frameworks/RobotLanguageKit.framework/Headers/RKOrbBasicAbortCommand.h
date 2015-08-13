//
//  RKOrbBasicAbortCommand.h
//  RobotKit
//
//  Created by Jon Carroll on 3/16/12.
//  Copyright (c) 2012 Orbotix Inc. All rights reserved.
//

#import <RobotCommandKit/RKDeviceCommand.h>
/*!
 *  Aborts execution of any currently running orbBasic program
 */
@interface RKOrbBasicAbortCommand : RKDeviceCommand

+(id) command;

@end
