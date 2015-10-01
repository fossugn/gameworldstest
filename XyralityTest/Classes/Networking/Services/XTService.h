//
//  XTService.h
//  XyralityTest
//
//  Created by Eugene Kutia on 10/1/15.
//  Copyright © 2015 EugeneKutia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking+PromiseKit.h"

@interface XTService : NSObject

+ (void)resolveFailedResponse:(NSURLSessionDataTask *)operation withError:(NSError *)error;

@end
