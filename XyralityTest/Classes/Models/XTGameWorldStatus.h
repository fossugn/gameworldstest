//
//  XTGameWorldStatus.h
//  XyralityTest
//
//  Created by Eugene Kutia on 10/1/15.
//  Copyright © 2015 EugeneKutia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XTGameWorldStatus : NSObject <EKMappingProtocol>

@property (nonatomic, copy)   NSString *statusDescription;
@property (nonatomic, copy)   NSString *statusId;

@end
