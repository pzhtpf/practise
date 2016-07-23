//
//  AccessoryViewController.m
//  AccessoryView
//
//  Created by tianpengfei on 16/7/23.
//  Copyright © 2016年 tianpengfei. All rights reserved.
//

#import "AccessoryViewController.h"

@interface AccessoryViewController ()

@property(nonatomic,strong)UIButton *closeButton;

@end

@implementation AccessoryViewController

-(void)dealloc{

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(id)init{

    self = [super init];
    if(self){
    
        [self.view addSubview:self.textField];
        [self.view addSubview:self.closeButton];
        self.view.backgroundColor = [UIColor greenColor];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillShow:)
                                                     name:UIKeyboardWillShowNotification
                                                   object:self.view.window];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillHide:)
                                                     name:UIKeyboardWillHideNotification
                                                   object:self.view.window];
    }
    return self;
}

- (void)keyboardWillShow:(NSNotification *)n
{
    NSDictionary* userInfo = [n userInfo];
    
    // get the size of the keyboard
    CGSize keyboardSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    float top = [UIScreen mainScreen].bounds.size.height-keyboardSize.height-self.view.frame.size.height;
    
    [UIView animateWithDuration:0.3f animations:^{
        
        self.view.frame = CGRectMake(0, top, self.view.frame.size.width, self.view.frame.size.height);

        
    } completion:^(BOOL finished) {
        
    }];
}
- (void)keyboardWillHide:(NSNotification *)n
{
    [UIView animateWithDuration:0.3f animations:^{
        
        self.view.frame = CGRectMake(0,[UIScreen mainScreen].bounds.size.height, self.view.frame.size.width, self.view.frame.size.height);
        
        
    } completion:^(BOOL finished) {
        
        [self.view removeFromSuperview];
    }];

}

#pragma mark Action

-(void)closeAction:(UIButton *)button{

    [self.textField resignFirstResponder];
    
}

#pragma mark getter

-(UITextField *)textField{

    if(!_textField){
    
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 20, self.view.frame.size.width-20, 44)];
    }
    return _textField;
}
-(UIButton *)closeButton{

    if(!_closeButton){
    
        _closeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 20)];
        [_closeButton setTitle:@"关闭" forState:UIControlStateNormal];
        [_closeButton addTarget:self action:@selector(closeAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeButton;
}
@end
