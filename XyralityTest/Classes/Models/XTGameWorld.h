//
//  XTGameWorld.h
//  XyralityTest
//
//  Created by Eugene Kutia on 10/1/15.
//  Copyright © 2015 EugeneKutia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XTGameWorldStatus.h"

@interface XTGameWorld : NSObject <EKMappingProtocol>

@property (nonatomic, copy)   NSString *country;
@property (nonatomic, copy)   NSString *worldId;
@property (nonatomic, copy)   NSString *language;
@property (nonatomic, copy)   NSString *mapURL;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, copy)   NSString *URL;
@property (nonatomic, strong) XTGameWorldStatus *worldStatus;

@end
