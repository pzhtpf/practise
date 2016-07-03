//
//  YTSSCustomTABView.m
//  CustomTABView
//
//  Created by roctian on 16/7/1.
//  Copyright © 2016年 roctian. All rights reserved.
//

#import "YTSSCustomTABView.h"

@interface YTSSCustomTABView()

@property(nonatomic)float itemWidth;
@property(nonatomic,strong)NSMutableArray *allButtonArray;

@end

@implementation YTSSCustomTABView

-(id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if(self){
    
        _selectButtonHeight = 44;
        _horizontalSpacing = 2;
        
        _selectColor = [UIColor whiteColor];
        _unSelectColor = [UIColor grayColor];
        _borderColor = [UIColor blackColor];
        _textColor = [UIColor blackColor];
        _textFont = [UIFont systemFontOfSize:14.0f];
    }
    return self;
}

#pragma mark public API

-(void)show{

}

#pragma mark setter

-(void)setItems:(NSArray *)items{

    _items = items;
    
    if(!_items || _items.count==0)
        return;
    
    [self initView];
    
}
-(void)setSelectButtonHeight:(float)selectButtonHeight{

    _selectButtonHeight = selectButtonHeight;
}
-(void)setSelectIndex:(int)selectIndex{
    
    int lastSelectIndex = _selectIndex;

    _selectIndex = selectIndex;
    
    if(_selectIndex>_allButtonArray.count || lastSelectIndex >_allButtonArray.count)
        return;
    
    if(_selectIndex>_itemsSubView.count || lastSelectIndex >_itemsSubView.count)
        return;

    
    for (int i =0; i<_allButtonArray.count; i++) {
        
        UIButton *button = _allButtonArray[i];
        
        if(i !=_selectIndex && i!=lastSelectIndex){
        
             button.backgroundColor = _unSelectColor;
        }
    }
    
    
    UIButton *lastSelectButton = _allButtonArray[lastSelectIndex];
    UIButton *selectButton = _allButtonArray[_selectIndex];
    
    UIView *lastSelectSubView = _itemsSubView[lastSelectIndex];
    UIView *selectSubView = _itemsSubView[_selectIndex];
    
    [UIView animateWithDuration:0.5f animations:^{
        
        lastSelectButton.backgroundColor = _unSelectColor;
        selectButton.backgroundColor = _selectColor;
        
        lastSelectSubView.alpha = 0;
        selectSubView.alpha = 1;
        
        self.sliderMaskView.frame = CGRectMake(selectButton.frame.origin.x, selectButton.frame.origin.y, self.sliderMaskView.frame.size.width, self.sliderMaskView.frame.size.height);
        
    } completion:^(BOOL finished) {
        
    }];
}
-(void)setItemsSubView:(NSArray *)itemsSubView{

    _itemsSubView = itemsSubView;
    
    for (UIView *tempView in _itemsSubView) {
        [tempView removeFromSuperview];
    }
    
    for (int i =0; i<_itemsSubView.count; i++) {
        
        UIView *view = _itemsSubView[i];
        [self.mainConentView addSubview:view];
        
        if(_selectIndex == i)
            view.alpha = 1;
        
        else
            view.alpha = 0;
        
    }
}

#pragma mark private method

-(void)initView{
    
    for (UIButton *tempButton in _allButtonArray) {
        [tempButton removeFromSuperview];
    }
    
    _allButtonArray = [NSMutableArray new];

    _itemWidth = (self.frame.size.width-(_items.count-1)*_horizontalSpacing)/_items.count;
    
    for (int i =0; i<_items.count; i++) {
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i*(_itemWidth+_horizontalSpacing), 0, _itemWidth, _selectButtonHeight)];
        
        button.backgroundColor = _unSelectColor;
        [button setTitle:_items[i] forState:UIControlStateNormal];
        [button setTitleColor:_textColor forState:UIControlStateNormal];
        button.titleLabel.font = _textFont;
        
        button.tag = i;
        
        [button addTarget:self action:@selector(selectChange:) forControlEvents:UIControlEventTouchUpInside];
        
        [_allButtonArray addObject:button];
        [self.selectView addSubview:button];
    }
    
    UIButton *firstButton = _allButtonArray[0];
    firstButton.backgroundColor = _selectColor;
    
    [self addSubview:self.mainConentView];
    [self addSubview:self.selectView];
    
    [self.selectView addSubview:self.sliderMaskView];
}

#pragma mark Action

-(void)selectChange:(UIButton *)button{

    [self setSelectIndex:(int)button.tag];
}

#pragma mark getter

-(UIView *)selectView{

    if(!_selectView){
    
        _selectView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, _selectButtonHeight)];
    }
    return _selectView;
}
-(UIView *)sliderMaskView{

    if(!_sliderMaskView){
    
        _sliderMaskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _itemWidth, _selectButtonHeight+2)];
        
        CALayer *upperBorder = [CALayer layer];
        upperBorder.backgroundColor = [_borderColor CGColor];
        upperBorder.frame = CGRectMake(0, 0, _itemWidth, 1.0f);
        [_sliderMaskView.layer addSublayer:upperBorder];
        
        CALayer *leftBorder = [CALayer layer];
        leftBorder.backgroundColor = [_borderColor CGColor];
        leftBorder.frame = CGRectMake(-1, 0, 1,CGRectGetMaxY(_sliderMaskView.frame));
        [_sliderMaskView.layer addSublayer:leftBorder];
        
        CALayer *rightBorder = [CALayer layer];
        rightBorder.backgroundColor = [_borderColor CGColor];
        rightBorder.frame = CGRectMake(_itemWidth, 0, 1,CGRectGetMaxY(_sliderMaskView.frame));
        [_sliderMaskView.layer addSublayer:rightBorder];
        
        UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake(0, _selectButtonHeight-1, _itemWidth, 3)];
        maskView.backgroundColor = _selectColor;
        [_sliderMaskView addSubview:maskView];
    }
    return _sliderMaskView;
}
-(UIView *)mainConentView{
    
    if(!_mainConentView){
        
        _mainConentView = [[UIView alloc] initWithFrame:CGRectMake(-1,CGRectGetMaxY(self.selectView.frame)+1,self.frame.size.width+2,self.frame.size.height-CGRectGetMaxY(self.selectView.frame) )];
        _mainConentView.layer.borderColor = _borderColor.CGColor;
        _mainConentView.layer.borderWidth = 1;
        _mainConentView.backgroundColor = _selectColor;
    }
    return _mainConentView;
}
@end
