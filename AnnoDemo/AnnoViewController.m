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
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.myAnno = [[AnnoView alloc] initWithFrame:CGRectMake(0.5 * (self.view.bounds.size.width - AnnoWidth), 150, AnnoWidth, AnnoHeight)];
    
    [self.view addSubview:self.myAnno];
    
    
}



@end
