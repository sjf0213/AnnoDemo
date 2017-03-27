//
//  KFAnim.h
//  AnnoDemo
//
//  Created by 宋炬峰 on 2017/3/27.
//  Copyright © 2017年 宋炬峰. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, KFAnimType){
    KFAnimTypeIn1,
    KFAnimTypeOut1,
};

@interface KFAnim : NSObject

+ (CAAnimation*) animOfView:(UIView*)v WithType:(KFAnimType)type;

@end
