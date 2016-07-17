//
//  ViewController.m
//  YTSSMessageView
//
//  Created by tianpengfei on 16/7/17.
//  Copyright © 2016年 tianpengfei. All rights reserved.
//

#import "ViewController.h"
#import "YTSSMessageView.h"

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

- (IBAction)showAction:(id)sender {
    
    YTSSMessageView *messageView = [[YTSSMessageView alloc] initWithMessage:@"医生手术时突发胃痉挛 忍痛做完关键步骤后躺下,林医生事后回忆说，其实在手术开始时，邵医生的胃痉挛就已经发作了。得过这种病的人，才能体会那是一种怎样的疼痛。“我看他脸上直冒冷汗，脸色一下子变得苍白。" buttonItems:@[@"去认证",@"我知道了"] itemClick:^(int item) {
        
        NSLog(@"点击了：%d",item);
    }];
    
    [messageView show];
}
@end
