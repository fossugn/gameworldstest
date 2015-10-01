//
//  XTGameWorlds.m
//  XyralityTest
//
//  Created by Eugene Kutia on 10/1/15.
//  Copyright © 2015 EugeneKutia. All rights reserved.
//

#import "XTGameWorlds.h"
#import "XTGameWorld.h"

@implementation XTGameWorlds

+ (EKObjectMapping *)objectMapping {
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        [mapping hasMany:[XTGameWorld class] forKeyPath:@"allAvailableWorlds" forProperty:@"gameWorlds"];
    }];
}

@end
