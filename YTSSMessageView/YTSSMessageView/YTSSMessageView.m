//
//  YTSSMessageView.m
//  YTSSMessageView
//
//  Created by tianpengfei on 16/7/17.
//  Copyright © 2016年 tianpengfei. All rights reserved.
//

#import "YTSSMessageView.h"

@interface YTSSMessageView()

@property(nonatomic)float width;
@property(nonatomic)float height;

@property(strong,nonatomic)NSArray *buttonItems;
@property(strong,nonatomic)NSString *message;

@property(strong,nonatomic)UIView *backView;
@property(strong,nonatomic)UIView *mainView;

@property(strong,nonatomic)UIImageView *titleImageView;
@property(strong,nonatomic)UITextView *messageTextView;

@property(strong,nonatomic) ItemClick itemClick;

@property(nonatomic) float buttonHeight;
@property(nonatomic) float mainViewLeft;

@end

@implementation YTSSMessageView

-(id)initWithMessage:(NSString *)message buttonItems:(NSArray *)buttonItems itemClick:(ItemClick)itemClick{

    _width = [UIScreen mainScreen].bounds.size.width;
    _height = [UIScreen mainScreen].bounds.size.height;
    
    self = [super initWithFrame:CGRectMake(0, 0, _width, _height)];
    if(self){
    
        _buttonHeight = 44;
        _mainViewLeft = 50;
        
        _message = message;
        _itemClick = itemClick;
        
        if(buttonItems && buttonItems.count>0)
            _buttonItems = buttonItems;
        else
            _buttonItems = @[@"关闭"];
        
        [self initView];
    
    }
    return self;
}
-(void)initView{

    [self addSubview:self.backView];
    [self addSubview:self.mainView];
    [self.mainView addSubview:self.titleImageView];
    [self.mainView addSubview:self.messageTextView];
    
    [self initButton];
}
-(void)initButton{

    int width =  CGRectGetWidth(self.mainView.frame);
    int y = CGRectGetMaxY(self.messageTextView.frame);
    
    for (int i=0; i<_buttonItems.count; i++) {
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, y, width, _buttonHeight)];
        [button setTitle:_buttonItems[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(itemClickAction:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        button.tag = i;
        
        [self .mainView addSubview:button];
        
        y = CGRectGetMaxY(button.frame);
    }
    
    self.mainView.frame = CGRectMake(_mainViewLeft, -y,  _width-_mainViewLeft*2, y);
}

#pragma mark public API

-(void)show{
    
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    
    if (!window)
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    
    NSArray *subViews = [window subviews];
    
    [subViews[subViews.count-1] addSubview:self];
    

    [UIView animateWithDuration:0.3f animations:^{
        
        self.backView.alpha = 0.6f;
        self.mainView.frame =  CGRectMake(_mainViewLeft,100,  _width-_mainViewLeft*2,self.mainView.frame.size.height);
        
    } completion:^(BOOL finished) {
        
    }];
}
-(void)hide{

    [UIView animateWithDuration:0.3f animations:^{
        
        self.backView.alpha = 0.0f;
        self.mainView.frame =  CGRectMake(_mainViewLeft,-self.mainView.frame.size.height,  _width-_mainViewLeft*2,self.mainView.frame.size.height);
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}

#pragma mark Action

-(void)itemClickAction:(UIButton *)button{

    if(self.itemClick)
        self.itemClick((int)button.tag);
    
    [self hide];
}

#pragma mark getter

-(UIView *)backView{

    if(!_backView){
    
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _width, _height)];
        _backView.alpha = 0;
        _backView.backgroundColor = [UIColor blackColor];
    }
    return _backView;
}
-(UIView *)mainView{
    
    if(!_mainView){
        
        _mainView = [[UIView alloc] initWithFrame:CGRectMake(_mainViewLeft, 0, _width-_mainViewLeft*2, _height)];
        _mainView.backgroundColor = [UIColor whiteColor];
        _mainView.layer.cornerRadius = 10;
        _mainView.clipsToBounds = YES;
     }
    return _mainView;
}
-(UIImageView *)titleImageView{

    if(!_titleImageView){
    
        int width = CGRectGetWidth(self.mainView.frame);
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"11-banner.png" ofType:@""];
        UIImage *image = [UIImage imageWithContentsOfFile:filePath];
        
        int height = width*image.size.height/image.size.width;
        
        _titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,width ,height)];
        _titleImageView.image = image;
        
    }
    return _titleImageView;
}
-(UITextView *)messageTextView{

    if(!_messageTextView){
    
        int width = CGRectGetWidth(self.mainView.frame);
        
        _messageTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleImageView.frame)+10,width, 1)];
        
        _messageTextView.textAlignment = NSTextAlignmentCenter;
        _messageTextView.font = [UIFont systemFontOfSize:17.0f];
        
        _messageTextView.text = _message;
        
        [_messageTextView sizeToFit];
        [_messageTextView setNeedsLayout];
        
        int height = _messageTextView.frame.size.height;
        
        height = height<64?64:height;
        
        _messageTextView.frame = CGRectMake(0, CGRectGetMaxY(self.titleImageView.frame),width,height);
        
    }
    return _messageTextView;
}

@end
