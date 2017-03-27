//
//  AnnoView.m
//  AnnoDemo
//
//  Created by 宋炬峰 on 2017/3/27.
//  Copyright © 2017年 宋炬峰. All rights reserved.
//

#import "AnnoView.h"

@interface AnnoView ()
@property(nonatomic, strong)UIImageView* iconView;
@end

@implementation AnnoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = [[UIColor cyanColor] colorWithAlphaComponent:0.1];
        self.backgroundColor = [UIColor whiteColor];
        
        self.iconView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.iconView.image = [UIImage imageNamed:@"annoicon"];
        [self addSubview:self.iconView];
    }
    return self;
}

-(void)comeout{
    DLog(@"updateAnnotation - - - - 3.2");
    self.hidden = NO;
    CGRect frame = self.frame;
    
    CATransform3D startingScale ;
    CATransform3D firstStepScale ;
    CATransform3D secondStepScale ;
    
    startingScale = CATransform3DScale (CATransform3DTranslate(self.layer.transform, 0.0f*frame.size.width, 1.0f*frame.size.height, 0.0f), 0.0f, 0.0f, 1.0);
    firstStepScale = CATransform3DScale (CATransform3DTranslate(self.layer.transform, 0.0f*frame.size.width, -0.03f*frame.size.height, 0.0f), 0.95f, 1.00f, 1.0);
    secondStepScale = CATransform3DScale (CATransform3DTranslate(self.layer.transform, 0.0f*frame.size.width, 0.03f*frame.size.height, 0.0f), 1.0f, 0.97f, 1.0);
    
    CATransform3D endingScale = self.layer.transform;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
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
    
    [self.layer addAnimation:animation forKey:@"comeout"];
}

-(void)buryin{
    DLog(@"updateAnnotation - - - - 3.2");
    self.hidden = NO;
    CGRect frame = self.frame;
    
    CATransform3D startingScale = self.layer.transform;
    
    CATransform3D firstStepScale = CATransform3DScale (CATransform3DTranslate(self.layer.transform, 0.0f*frame.size.width, 0.03f*frame.size.height, 0.0f), 1.0f, 0.97f, 1.0);
    
    CATransform3D secondStepScale = CATransform3DScale (CATransform3DTranslate(self.layer.transform, 0.0f*frame.size.width, -0.03f*frame.size.height, 0.0f), 0.95f, 1.00f, 1.0);
    
    CATransform3D endingScale = CATransform3DScale (CATransform3DTranslate(self.layer.transform, 0.0f*frame.size.width, 1.0f*frame.size.height, 0.0f), 0.0f, 0.0f, 1.0);
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
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
    
    [self.layer addAnimation:animation forKey:@"buryin"];
}
@end
