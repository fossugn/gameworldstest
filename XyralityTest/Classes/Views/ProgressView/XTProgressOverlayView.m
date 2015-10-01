//
//  XTProgressOverlayView.m
//  XyralityTest
//
//  Created by Eugene Kutia on 10/1/15.
//  Copyright © 2015 EugeneKutia. All rights reserved.
//

#import "XTProgressOverlayView.h"
#import "MRBlurView.h"

@implementation XTProgressOverlayView

+ (instancetype)currentProgressOverlayView {
    
    return [XTProgressOverlayView overlayForView:[XTProgressOverlayView targetView]];
}

+ (instancetype)showProgressOverlayView {
    
    return [XTProgressOverlayView showProgressOverlayViewWithMessage:@"" animated:YES];
}

+ (instancetype)showProgressOverlayView:(BOOL)animated {
    
    return [XTProgressOverlayView showProgressOverlayViewWithMessage:@"" animated:animated];
}

+ (instancetype)showProgressOverlayViewWithMessage:(NSString *)message {
    
    return [XTProgressOverlayView showProgressOverlayViewWithMessage:message animated:YES];
}

+ (instancetype)showProgressOverlayViewWithMessage:(NSString *)message animated:(BOOL)animated {
    
    UIView *targetView = [XTProgressOverlayView targetView];
    XTProgressOverlayView *overlayView = [XTProgressOverlayView overlayForView:targetView];
    if (overlayView) {
        
        overlayView.titleLabelText = message;
        if ([overlayView isHidden]) {
            
            [overlayView setSubviewTransform:CGAffineTransformIdentity alpha:0.0f];
            [targetView bringSubviewToFront:[XTProgressOverlayView currentProgressOverlayView]];
            [overlayView show:YES];
        }
    } else {
        
        overlayView = [XTProgressOverlayView new];
        overlayView.titleLabelText = message;
        [overlayView setTintColor:XT_COLOR_YELLOW_GREEN];
        [overlayView setMode:MRProgressOverlayViewModeIndeterminate];
        [targetView addSubview:overlayView];
        [overlayView show:animated];
    }
    
    return overlayView;
}

+ (void)hideProgressOverlayView {
    
    [XTProgressOverlayView hideProgressOverlayView:YES];
}

+ (void)hideProgressOverlayView:(BOOL)animated {
    
    [XTProgressOverlayView hideProgressOverlayView:animated completion:nil];
}

+ (void)hideProgressOverlayView:(BOOL)animated completion:(void(^)())completionBlock {
    
    [[XTProgressOverlayView currentProgressOverlayView] hide:animated completion:completionBlock];
}

#pragma mark - Internal

+ (UIView *)targetView {
    
    return [[UIApplication sharedApplication].delegate window];
}

- (UIView *)createBlurView {
    
    UIView *blurView = [MRBlurView new];
    blurView.alpha = 0.00;
    [self addSubview:blurView];
    return blurView;
}

@end
