//
//  XTProgressOverlayView.h
//  XyralityTest
//
//  Created by Eugene Kutia on 10/1/15.
//  Copyright © 2015 EugeneKutia. All rights reserved.
//

#import "MRProgressOverlayView_Extension.h"

@interface XTProgressOverlayView : MRProgressOverlayView

+ (instancetype)currentProgressOverlayView;

+ (instancetype)showProgressOverlayView;
+ (instancetype)showProgressOverlayView:(BOOL)animated;
+ (instancetype)showProgressOverlayViewWithMessage:(NSString *)message;
+ (instancetype)showProgressOverlayViewWithMessage:(NSString *)message animated:(BOOL)animated;

+ (void)hideProgressOverlayView;
+ (void)hideProgressOverlayView:(BOOL)animated;
+ (void)hideProgressOverlayView:(BOOL)animated completion:(void(^)())completionBlock;

- (UIView *)createBlurView;

@end
