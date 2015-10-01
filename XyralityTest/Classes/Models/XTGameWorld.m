//
//  XTGameWorld.m
//  XyralityTest
//
//  Created by Eugene Kutia on 10/1/15.
//  Copyright © 2015 EugeneKutia. All rights reserved.
//

#import "XTGameWorld.h"

@implementation XTGameWorld

+(EKObjectMapping *)objectMapping
{
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        [mapping mapPropertiesFromArray:@[@"country", @"language", @"mapURL", @"name"]];
        [mapping mapPropertiesFromDictionary:@{
                                               @"url"   : @"URL",
                                               @"id"    : @"worldId"
                                               }];
        [mapping hasOne:[XTGameWorldStatus class] forKeyPath:@"worldStatus"];
    }];
}

@end
