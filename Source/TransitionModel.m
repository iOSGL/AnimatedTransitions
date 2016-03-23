//
//  TransitionModel.m
//  TestKVC_CoreData
//
//  Created by geng lei on 16/3/22.
//  Copyright © 2016年 genglei. All rights reserved.
//

#import "TransitionModel.h"

@interface TransitionModel () 

@property (nonatomic, strong) UIView *buble;

@end

@implementation TransitionModel

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return self.duration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];;
    if (self.transitionMode == Present) {
        UIView *presentedControllerView = [transitionContext viewForKey:UITransitionContextToViewKey];
        CGPoint originalCenter = presentedControllerView.center;
        CGSize originalSize = presentedControllerView.frame.size;
        self.buble = [UIView new];
        self.buble.frame = [self frameForBubble:originalCenter size:originalSize start:self.startingPoint];
        self.buble.layer.cornerRadius = self.buble.frame.size.height/2;
        self.buble.center = self.startingPoint;
        self.buble.transform = CGAffineTransformMakeScale(0.001, 0.001);
        self.buble.backgroundColor = self.bubbleColor;
        [containerView addSubview:self.buble];
        
        presentedControllerView.center = self.startingPoint;
        presentedControllerView.transform = CGAffineTransformMakeScale(0.001, 0.001);
        presentedControllerView.alpha = 0;
        [containerView addSubview:presentedControllerView];
    
        [UIView animateWithDuration:self.duration animations:^{
            self.buble.transform = CGAffineTransformIdentity;
            presentedControllerView.transform = CGAffineTransformIdentity;
            presentedControllerView.alpha = 1;
            presentedControllerView.center = originalCenter;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:true];
        }];
        
    }else {
        NSString *key = self.transitionMode == Pop ? UITransitionContextToViewKey :UITransitionContextFromViewKey;
        UIView *returningControllerView = [transitionContext viewForKey:key];
        CGPoint originalCenter = returningControllerView.center;
        CGSize originalSize = returningControllerView.frame.size;
        
        self.buble.frame = [self frameForBubble:originalCenter size:originalSize start:self.startingPoint];
        self.buble.layer.cornerRadius = self.buble.frame.size.height / 2;
        self.buble.center = self.startingPoint;
        
    
        [UIView animateWithDuration:self.duration animations:^{
            self.buble.transform = CGAffineTransformMakeScale(0.001, 0.001);
            returningControllerView.transform = CGAffineTransformMakeScale(0.001, 0.001);
            returningControllerView.center = self.startingPoint;
            returningControllerView.alpha = 0;
            
            if (self.transitionMode == Pop) {
                [containerView insertSubview:returningControllerView belowSubview:returningControllerView];
                [containerView insertSubview:self.buble belowSubview:returningControllerView];
            }
        } completion:^(BOOL finished) {
            returningControllerView.center = originalCenter;
            [returningControllerView removeFromSuperview];
            [self.buble removeFromSuperview];
            [transitionContext completeTransition:true];
        }];

    }
}

- (CGRect)frameForBubble:(CGPoint)originalCenter size:(CGSize)originalSize start:(CGPoint)start {
    CGFloat lengthX = fmaxf(start.x, originalSize.width - start.x);
    CGFloat lengthY = fmaxf(start.y, originalSize.height - start.y);
    CGFloat offset = sqrt(lengthX * lengthX + lengthY * lengthY) * 2;
    CGSize size = CGSizeMake(offset, offset);
    return CGRectMake(0, 0, size.width, size.height);
}

@end
