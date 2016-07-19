//
//  ViewController.m
//  animate-line-draw
//
//  Created by tianpengfei on 16/7/19.
//  Copyright © 2016年 tianpengfei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)UILabel *line;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.line];
    
  

}
-(void)viewDidAppear:(BOOL)animated{

    float centerY = ( CGRectGetMaxY(self.line.frame) + CGRectGetMinY(self.line.frame))/2;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(CGRectGetMinX(self.line.frame)+1,CGRectGetMaxY(self.line.frame))];
    [path addLineToPoint:CGPointMake(CGRectGetMinX(self.line.frame)+1, centerY)];
    
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(CGRectGetMinX(self.line.frame)-4,CGRectGetMaxY(self.line.frame))];
    [path1 addLineToPoint:CGPointMake(CGRectGetMinX(self.line.frame)-4, centerY)];
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = self.view.bounds;
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = [[UIColor blackColor] CGColor];
    pathLayer.fillColor = nil;
    pathLayer.lineWidth = 2.0f;
    pathLayer.lineJoin = kCALineJoinBevel;
    
    [self.view.layer addSublayer:pathLayer];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 2.0;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    [pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
    
    
    CALayer *penLayer = [CALayer layer];
    penLayer.anchorPoint = CGPointZero;
    penLayer.frame = CGRectMake(CGRectGetMinX(self.line.frame)-4,centerY,10,10);
    penLayer.cornerRadius = 5;
    penLayer.backgroundColor = [UIColor blackColor].CGColor;
    
    [pathLayer addSublayer:penLayer];
    
    
    CAKeyframeAnimation *penAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    penAnimation.duration = 2.0;
    penAnimation.path = path1.CGPath;
    penAnimation.calculationMode = kCAAnimationPaced;
    penAnimation.delegate = self;
    [penLayer addAnimation:penAnimation forKey:@"position"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark getter

-(UILabel *)line{

    if(!_line){
    
        _line = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 2, 200)];
        _line.center = self.view.center;
        
        _line.backgroundColor = [UIColor grayColor];
    }
    
    return _line;
}

@end
