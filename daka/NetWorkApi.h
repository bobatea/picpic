//
//  NetWorkApi.h
//  daka
//
//  Created by Luming Nie on 7/27/14.
//  Copyright (c) 2014 bobatea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkApi : NSObject

+ (void)signInAccountWithUserName:(NSString *)user_name
                         password:(NSString *)password
                       completion:(void (^)(BOOL success, NSString* desc))completionBlock;

+ (void)signUpAccountWithUserName:(NSString *)userName
                         password:(NSString *)password
                           gender:(bool)gender
                       completion:(void (^)(BOOL success, NSString* desc))completionBlock;

+ (void)getNotification:(int) userId
             completion:(void (^)(NSMutableArray* notificationList))completionBlock;

@end
