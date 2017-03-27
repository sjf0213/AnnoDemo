//
//  AnnoViewController.m
//  AnnoDemo
//
//  Created by 宋炬峰 on 2017/3/27.
//  Copyright © 2017年 宋炬峰. All rights reserved.
//

#import "AnnoViewController.h"
#import "AnnoView.h"

const CGFloat AnnoWidth = 46;
const CGFloat AnnoHeight = 46;


@interface AnnoViewController ()
@property(nonatomic, strong)AnnoView* myAnno;
@end

@implementation AnnoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.myAnno = [[AnnoView alloc] initWithFrame:CGRectMake(0.5 * (self.view.bounds.size.width - AnnoWidth), 0.5 * (self.view.bounds.size.height - AnnoHeight), AnnoWidth, AnnoHeight)];
    
    [self.view addSubview:self.myAnno];
    self.myAnno.hidden = YES;
    
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
    
    [self.myAnno comeout];
}

-(void)onTapDown:(id)sender{
    
    [self.myAnno buryin];
}

@end
