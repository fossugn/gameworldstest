//
//  XTNetworkManager.m
//  XyralityTest
//
//  Created by Eugene Kutia on 10/1/15.
//  Copyright © 2015 EugeneKutia. All rights reserved.
//

#import "XTNetworkManager.h"

@implementation XTNetworkManager

#pragma mark - SharedInstance

static XTNetworkManager *_sharedInstance = nil;
static dispatch_once_t once_token = 0;

+ (instancetype)sharedInstance {
    dispatch_once(&once_token, ^{
        if (_sharedInstance == nil) {
            _sharedInstance = [[XTNetworkManager alloc] init];
        }
    });
    return _sharedInstance;
}

#pragma mark - Initializers

- (instancetype)init {

    NSURL *baseURL = [NSURL URLWithString:kBaseUrl];
    
    if (self = [super initWithBaseURL:baseURL]) {

        self.responseSerializer = [AFPropertyListResponseSerializer serializer];
        self.requestSerializer = [AFHTTPRequestSerializer serializer];

        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        securityPolicy.allowInvalidCertificates = YES;
        self.securityPolicy = securityPolicy;
    }
    
    [AFNetworkReachabilityManager sharedManager].reachabilityStatusChangeBlock = ^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"No Internet Connection");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WIFI");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"3G");
                break;
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"Unknown network status");
                break;
        }
    };
    
    return self;
}

@end
