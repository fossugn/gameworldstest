//
//  XTGameWorldsList.m
//  XyralityTest
//
//  Created by Eugene Kutia on 10/1/15.
//  Copyright © 2015 EugeneKutia. All rights reserved.
//

#import "XTGameWorldsList.h"
#import "XTNetworkManager.h"
#import "XTGameWorlds.h"

@implementation XTGameWorldsList

+ (PMKPromise *)getGameWorldsWithUserWithEmail:(NSString *)email
                                      password:(NSString *)password {
    
    NSString *deviceType = [[self class] getDeviceTypeParameter];
    NSString *deviceId = [[self class] getDeviceIdParameter];
    NSDictionary *params = @{ @"login"      : email,
                              @"password"   : password,
                              @"deviceType" : deviceType,
                              @"deviceId"   : deviceId };
//    __block NSString *passwordBlock = password;
//    __block NSString *emailBlock = email;
    
    return [[XTNetworkManager sharedInstance] POST:@"worlds/"
                                        parameters:params].then(^(id responseObject, NSURLSessionDataTask *task){

        XTGameWorlds *gameWorlds = [EKMapper objectFromExternalRepresentation:responseObject withMapping:[XTGameWorlds objectMapping]];
        
//        User *user = [User createOrUpdateInDefaultContextWithDictionary:responseObject];
//        user.email = emailBlock;
//        user.password = passwordBlock;
//        
//        [ModelManager sharedInstance].user = user;
        
        return [PMKPromise promiseWithValue:gameWorlds];
    }).catch(^(NSError *error, NSURLSessionDataTask *task){
        
        NSLog(@"Error: %@", error);

        [self resolveFailedResponse:task withError:error];
        return [PMKPromise promiseWithValue:error];
    });
}

+ (NSString *)getDeviceTypeParameter {
    
    NSString *deviceType = NSStringWithFormat(@"%@ - %@ %@", [[UIDevice currentDevice] model], [[UIDevice currentDevice] systemName], [[UIDevice currentDevice] systemVersion]);
    
    return deviceType;
}

+ (NSString *)getDeviceIdParameter {
    
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

@end
