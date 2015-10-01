//
//  XTGameWorldStatus.m
//  XyralityTest
//
//  Created by Eugene Kutia on 10/1/15.
//  Copyright © 2015 EugeneKutia. All rights reserved.
//

#import "XTGameWorldStatus.h"

@implementation XTGameWorldStatus

+ (EKObjectMapping *)objectMapping {
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        [mapping mapPropertiesFromDictionary:@{ @"description"  : @"statusDescription",
                                                @"id"           : @"statusId"           }] ;
    }];
}

@end
