//
//  MRProgressOverlayView_Extension.h
//  XyralityTest
//
//  Created by Eugene Kutia on 10/1/15.
//  Copyright © 2015 EugeneKutia. All rights reserved.
//

#import <MRProgress/MRProgress.h>
#import "MRProgressOverlayView.h"

@interface MRProgressOverlayView ()

- (void)hide:(BOOL)animated completion:(void(^)())completionBlock;
- (void)setSubviewTransform:(CGAffineTransform)transform alpha:(CGFloat)alpha;

@end
