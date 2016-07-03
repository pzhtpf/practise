//
//  YTSSCustomTABView.h
//  CustomTABView
//
//  Created by roctian on 16/7/1.
//  Copyright © 2016年 roctian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YTSSCustomTABView : UIView

@property(nonatomic,strong) NSArray * items;
@property(nonatomic,strong) NSArray * itemsSubView;

@property(nonatomic,strong) UIView *mainConentView;
@property(nonatomic,strong) UIView * selectView;
@property(nonatomic,strong) UIView * sliderMaskView;

@property(nonatomic) float selectButtonHeight;
@property(nonatomic) float horizontalSpacing;

@property(nonatomic,strong) UIColor * selectColor;
@property(nonatomic,strong) UIColor * unSelectColor;
@property(nonatomic,strong) UIColor * borderColor;
@property(nonatomic,strong) UIColor * textColor;
@property(nonatomic,strong) UIFont * textFont;

@property(nonatomic)int selectIndex;

-(void)show;
@end
