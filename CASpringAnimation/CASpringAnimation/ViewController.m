//
//  ViewController.m
//  CASpringAnimation
//
//  Created by tianpengfei on 16/7/24.
//  Copyright © 2016年 tianpengfei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addCASpringAnimation{

    id springAnimation = [self.testLabel.layer animationForKey:@"springAnimation"];
    
    if(!springAnimation){
    
        CASpringAnimation *springAnimation = [CASpringAnimation animationWithKeyPath:@"position.y"];
        
        springAnimation.damping = 15;
        springAnimation.stiffness = 300;
        springAnimation.mass = 1;
        springAnimation.initialVelocity = 0;
        springAnimation.fromValue = @(self.testLabel.layer.position.y);
        springAnimation.toValue = @(self.testLabel.layer.position.y - 50);
        springAnimation.duration = springAnimation.settlingDuration;
        springAnimation.autoreverses = NO;
//        springAnimation.isRemovedOnCompletion = @NO;
        
        [self.testLabel.layer addAnimation:springAnimation forKey:@"springAnimation"];
    }

}

- (IBAction)buttonAction:(id)sender {
    
    [self addCASpringAnimation];
}
@end
