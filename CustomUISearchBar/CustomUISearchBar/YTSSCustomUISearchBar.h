//
//  CustomUISearchBar.h
//  CustomUISearchBar
//
//  Created by tianpengfei on 16/7/2.
//  Copyright © 2016年 tianpengfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YTSSCustomUISearchBar : UISearchBar

@property(strong,nonatomic)UIFont *textFont;
@property(strong,nonatomic)UIColor *textColor;
@property(nonatomic)float height;
@property(nonatomic)float cornerRadius;
@property(nonatomic)UIColor *borderColor;
@property(nonatomic)float borderWidth;
@property(strong,nonatomic)UIColor *backgroundColor;

@property(strong,nonatomic)UITextField *textField;
@end
