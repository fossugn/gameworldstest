//
//  XTGameWorldsList.h
//  XyralityTest
//
//  Created by Eugene Kutia on 10/1/15.
//  Copyright © 2015 EugeneKutia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XTService.h"

@interface XTGameWorldsList : XTService

+ (PMKPromise *)getGameWorldsWithUserWithEmail:(NSString *)email
                                      password:(NSString *)password;

@end
