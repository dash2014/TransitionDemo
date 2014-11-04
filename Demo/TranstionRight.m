//
//  TranstionRight.m
//  Demo
//
//  Created by dash on 14/11/4.
//  Copyright (c) 2014年 com.dash.Qjie. All rights reserved.
//

#import "TranstionRight.h"

@implementation TranstionRight

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containerView = [transitionContext containerView];
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    [containerView addSubview:toView];
    toView.transform = CGAffineTransformMakeTranslation(-toView.frame.size.width, 0);
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromView.transform = CGAffineTransformMakeTranslation(fromView.frame.size.width, 0);
        toView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        fromView.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:YES];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.8;
}

@end
