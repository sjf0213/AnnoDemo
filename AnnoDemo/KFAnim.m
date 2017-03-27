//
//  KFAnim.m
//  AnnoDemo
//
//  Created by 宋炬峰 on 2017/3/27.
//  Copyright © 2017年 宋炬峰. All rights reserved.
//

#import "KFAnim.h"
#import <UIKit/UIKit.h>

@implementation KFAnim

+ (CAAnimation*) animOfView:(UIView*)v WithType:(KFAnimType)type{
    
    CAAnimation* anim = nil;
    switch (type) {
        case KFAnimTypeIn1:
        {
            anim = [KFAnim AnimIn1:v];
        }
            break;
        case KFAnimTypeOut1:
        {
            anim = [KFAnim AnimOut1:v];
        }
        default:
            break;
    }
    return anim;
}

+(CAKeyframeAnimation*)AnimIn1:(UIView*)v{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    CATransform3D startingScale ;
    CATransform3D firstStepScale ;
    CATransform3D secondStepScale ;
    
    startingScale = CATransform3DScale (CATransform3DTranslate(v.layer.transform, 0.0f*v.frame.size.width, 1.0f*v.frame.size.height, 0.0f), 0.0f, 0.0f, 1.0);
    firstStepScale = CATransform3DScale (CATransform3DTranslate(v.layer.transform, 0.0f*v.frame.size.width, -0.03f*v.frame.size.height, 0.0f), 0.95f, 1.00f, 1.0);
    secondStepScale = CATransform3DScale (CATransform3DTranslate(v.layer.transform, 0.0f*v.frame.size.width, 0.03f*v.frame.size.height, 0.0f), 1.0f, 0.97f, 1.0);
    
    CATransform3D endingScale = v.layer.transform;
    NSArray *boundsValues = [NSArray arrayWithObjects:[NSValue valueWithCATransform3D:startingScale],
                             [NSValue valueWithCATransform3D:firstStepScale],
                             [NSValue valueWithCATransform3D:secondStepScale],
                             [NSValue valueWithCATransform3D:endingScale], nil];
    [animation setValues:boundsValues];
    animation.keyTimes = @[@(0), @(0.33f), @(0.66f), @(1)];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    animation.duration = 0.8f;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    return animation;
}

+(CAKeyframeAnimation*)AnimOut1:(UIView*)v{
    
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    CATransform3D startingScale = v.layer.transform;

    CATransform3D firstStepScale = CATransform3DScale (CATransform3DTranslate(v.layer.transform, 0.0f*v.frame.size.width, 0.03f*v.frame.size.height, 0.0f), 1.0f, 0.97f, 1.0);

    CATransform3D secondStepScale = CATransform3DScale (CATransform3DTranslate(v.layer.transform, 0.0f*v.frame.size.width, -0.03f*v.frame.size.height, 0.0f), 0.95f, 1.00f, 1.0);

    CATransform3D endingScale = CATransform3DScale (CATransform3DTranslate(v.layer.transform, 0.0f*v.frame.size.width, 1.0f*v.frame.size.height, 0.0f), 0.0f, 0.0f, 1.0);

    
    NSArray *boundsValues = [NSArray arrayWithObjects:[NSValue valueWithCATransform3D:startingScale],
                             [NSValue valueWithCATransform3D:firstStepScale],
                             [NSValue valueWithCATransform3D:secondStepScale],
                             [NSValue valueWithCATransform3D:endingScale], nil];
    [animation setValues:boundsValues];
    animation.keyTimes = @[@(0), @(0.33f), @(0.66f), @(1)];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    animation.duration = 0.8f;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    return animation;

}


@end
