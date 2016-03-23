//
//  TransitionModel.h
//  TestKVC_CoreData
//
//  Created by geng lei on 16/3/22.
//  Copyright © 2016年 genglei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BubbleTransitionMode){
    Present,
    Dismiss,
    Pop
};

@interface TransitionModel : NSObject <UIViewControllerContextTransitioning, UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) BubbleTransitionMode transitionMode;

@property (nonatomic, assign) CGFloat duration;

@property (nonatomic, strong) UIColor *bubbleColor;

@property (nonatomic, assign) CGPoint startingPoint;

@end
