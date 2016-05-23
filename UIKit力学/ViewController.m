//
//  ViewController.m
//  UIKit力学
//
//  Created by 霍文轩 on 16/1/29.
//  Copyright © 2016年 霍文轩. All rights reserved.
//

#import "ViewController.h"

/**
 *  盒子停在界面中，当触摸屏幕，盒子会先加速后减速到触摸点
 */
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *box; // 盒子

@property (nonatomic, retain) UIDynamicAnimator * animator;
@property (nonatomic, retain) UISnapBehavior * snap; // 甩
@end

@implementation ViewController

- (void)viewDidLoad {
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}
- (IBAction)handleSnapGesture:(UITapGestureRecognizer *)sender {
    // 移除甩行为
    [_animator removeBehavior:_snap];
    
    // 添加甩行为
    CGPoint point = [sender locationInView:self.view]; // 得到触摸的点
    self.snap = [[UISnapBehavior alloc] initWithItem:_box snapToPoint:point];
    [_animator addBehavior:_snap];
}

@end
