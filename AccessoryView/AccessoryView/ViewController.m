//
//  ViewController.m
//  AccessoryView
//
//  Created by tianpengfei on 16/7/23.
//  Copyright © 2016年 tianpengfei. All rights reserved.
//

#import "ViewController.h"
#import "AccessoryViewController.h"

@interface ViewController ()

@property(strong,nonatomic)AccessoryViewController *accessoryViewController;

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

-(AccessoryViewController *)accessoryViewController{

    if(!_accessoryViewController){
    
        _accessoryViewController = [[AccessoryViewController alloc] init];
        _accessoryViewController.view.frame = CGRectMake(0,self.view.frame.size.height, self.view.frame.size.width, 88);
    }
    return _accessoryViewController;
}

- (IBAction)buttonAction:(id)sender {
    
    [self.view addSubview:self.accessoryViewController.view];
    [self.accessoryViewController.textField becomeFirstResponder];
}
@end
