//
//  MultiAnnoController.m
//  AnnoDemo
//
//  Created by 宋炬峰 on 2017/3/27.
//  Copyright © 2017年 宋炬峰. All rights reserved.
//

#import "MultiAnnoController.h"
#import "AnnoView.h"
#import "KFAnim.h"

const NSInteger NUM = 10;

@interface MultiAnnoController ()
@property(nonatomic, strong)UIView* container;
@end

@implementation MultiAnnoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 150)];
    [self.view addSubview:self.container];
    self.container.backgroundColor = [[UIColor cyanColor] colorWithAlphaComponent:0.1];
    
    UIButton* btnUp = [[UIButton alloc] initWithFrame:CGRectMake(0.5 * self.view.bounds.size.width - 120, self.view.bounds.size.height - 100, 100, 50)];
    btnUp.backgroundColor = [UIColor lightGrayColor];
    [btnUp setTitle:@"Up" forState:UIControlStateNormal];
    [self.view addSubview:btnUp];
    [btnUp addTarget:self action:@selector(onTapUp:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* btnDown = [[UIButton alloc] initWithFrame:CGRectMake(0.5 * self.view.bounds.size.width + 20, self.view.bounds.size.height - 100, 100, 50)];
    btnDown.backgroundColor = [UIColor lightGrayColor];
    [btnDown setTitle:@"Down" forState:UIControlStateNormal];
    [self.view addSubview:btnDown];
    [btnDown addTarget:self action:@selector(onTapDown:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)onTapUp:(id)sender{
    [self clearContainer];
    
    for (int i = 0; i < NUM; i++) {
        AnnoView* v = [[AnnoView alloc] initWithFrame:CGRectMake(0, 0, AnnoWidth, AnnoHeight)];
        NSInteger w0 = self.container.frame.size.width;
        NSInteger h0 = self.container.frame.size.height;
        NSInteger x = arc4random()%w0;
        NSInteger y = arc4random()%h0;
        v.center = CGPointMake(x, y);
        [self.container addSubview:v];
        v.hidden = NO;
        CAAnimation* anim = [KFAnim animOfView:v WithType:KFAnimTypeIn1];
        [v.layer addAnimation:anim forKey:@"comeout"];
    }
}

-(void)onTapDown:(id)sender{
    for (AnnoView* v in self.container.subviews) {
        if ([v isKindOfClass:[AnnoView class]]){
            v.hidden = NO;
            CAAnimation* anim = [KFAnim animOfView:v WithType:KFAnimTypeOut1];
            [v.layer addAnimation:anim forKey:@"buryin"];
        }
    }
}

-(void)clearContainer{
    for (AnnoView* v in self.container.subviews) {
        [v removeFromSuperview];
    }
}

@end
