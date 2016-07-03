//
//  YTSSDiscountTABCell.m
//  XLForm
//
//  Created by tianpengfei on 16/7/3.
//  Copyright © 2016年 Xmartlabs. All rights reserved.
//

#import "YTSSDiscountTABCell.h"

NSString * const YTSSFormRowDescriptorTypeTAB = @"YTSSFormRowDescriptorTypeTAB";

@implementation YTSSDiscountTABCell
@synthesize rowDescriptor;

+(void)load
{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:NSStringFromClass([YTSSDiscountTABCell class]) forKey:YTSSFormRowDescriptorTypeTAB];
}

- (void)configure
{
    [super configure];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
//    [self.contentView addSubview:self.tabView];
}

- (void)update
{
    [super update];
    
    self.titleLabel.text = self.rowDescriptor.title;
    self.titleLabel.text = self.rowDescriptor.value;
//    self.rateTitle.text = self.rowDescriptor.title;
    
}

//// height of the cell
//+(CGFloat)formDescriptorCellHeightForRowDescriptor:(XLFormRowDescriptor *)rowDescriptor{
//
//    return 188;
//}
//// called to check if cell can became first responder
//-(BOOL)formDescriptorCellCanBecomeFirstResponder{
//
//    return YES;
//}
//// called to ask cell to assign first responder to relevant UIView.
//-(BOOL)formDescriptorCellBecomeFirstResponder{
//
//    return YES;
//}


#pragma mark private method

-(UILabel *)getText:(NSString *)text{
    
    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 40,self.frame.size.width-20, 20)];
    testLabel.text = text;
    testLabel.textAlignment = NSTextAlignmentCenter;
    
    return testLabel;
}

#pragma mark getter

-(YTSSCustomTABView *)tabView{

    if(!_tabView){
    
        _tabView = [[YTSSCustomTABView alloc] initWithFrame:CGRectMake(10, 64, self.frame.size.width-20, 144)];
        
        _tabView.horizontalSpacing = 5;
        _tabView.selectButtonHeight = 35;
        _tabView.selectColor = [UIColor greenColor];
        _tabView.unSelectColor = [UIColor redColor];
        _tabView.textFont = [UIFont systemFontOfSize:14.0f];
        _tabView.textColor = [UIColor yellowColor];
        
        _tabView.items = @[@"TEST1",@"TEST2",@"TEST3",@"TEST4"];
        _tabView.itemsSubView = @[[self getText:@"TEST1"],[self getText:@"TEST2"],[self getText:@"TEST3"],[self getText:@"TEST4"]];
        
        _tabView.selectIndex = 3;
        
    }
    return _tabView;
}
-(UILabel *)titleLabel{


    if(!_titleLabel){
    
    
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 80, 44)];
        _titleLabel.text = @"我的报价";
    }
    return _titleLabel;
}

@end
