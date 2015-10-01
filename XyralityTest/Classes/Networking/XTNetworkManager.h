//
//  XTNetworkManager.h
//  XyralityTest
//
//  Created by Eugene Kutia on 10/1/15.
//  Copyright © 2015 EugeneKutia. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface XTNetworkManager : AFHTTPSessionManager

+ (instancetype)sharedInstance;

@end
