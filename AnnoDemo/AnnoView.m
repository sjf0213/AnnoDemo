//
//  AnnoView.m
//  AnnoDemo
//
//  Created by 宋炬峰 on 2017/3/27.
//  Copyright © 2017年 宋炬峰. All rights reserved.
//

#import "AnnoView.h"
#import "KFAnim.h"

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

@end
