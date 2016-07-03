//
//  CustomUISearchBar.m
//  CustomUISearchBar
//
//  Created by tianpengfei on 16/7/2.
//  Copyright © 2016年 tianpengfei. All rights reserved.
//

#import "YTSSCustomUISearchBar.h"


@implementation YTSSCustomUISearchBar

-(id)initWithFrame:(CGRect)frame{

    _height = frame.size.height;
    self = [super initWithFrame:frame];
    if(self){
    
        _borderWidth = 1.0f;
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    int y = (self.frame.size.height-_height)/2;
    
    self.textField.frame = CGRectMake (0,y, self.frame.size.width,_height);

}

#pragma mark setter

-(void)setTextFont:(UIFont *)textFont{

    _textFont = textFont;
    
    self.textField.font = _textFont;
    
}

-(void)setTextColor:(UIColor *)textColor{

    _textColor = textColor;
    
    self.textField.textColor = _textColor;
}
-(void)setCornerRadius:(float)cornerRadius{

    _cornerRadius = cornerRadius;
    
    self.textField.layer.cornerRadius = _cornerRadius;
}
-(void)setBorderColor:(UIColor *)borderColor{

    _borderColor = borderColor;
    
    self.textField.layer.borderColor = _borderColor.CGColor;
    [self setBorderWidth:_borderWidth];
}
-(void)setBorderWidth:(float)borderWidth{

    _borderWidth = borderWidth;
    
    self.textField.layer.borderWidth = _borderWidth;

}
-(void)setBackgroundColor:(UIColor *)backgroundColor{

    _backgroundColor = backgroundColor;
    
    self.textField.backgroundColor = _backgroundColor;
}

#pragma mark getter

-(UITextField *)textField{

    if(!_textField){
    
        NSArray *subViews = self.subviews;
        
        if(subViews.count ==1)
            subViews = [(UIView *)subViews[0] subviews];
        
        
        for (UIView *view in subViews) {
            if ([view isKindOfClass: [UITextField class]]){
                _textField = (UITextField *)view;
            }
            else
                [view removeFromSuperview];
        }
        
    }
    return _textField;
}
@end
