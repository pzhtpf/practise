//  FloatLabeledTextFieldCell.m
//  XLForm ( https://github.com/xmartlabs/XLForm )
//
//  Copyright (c) 2015 Xmartlabs ( http://xmartlabs.com )
//
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "YTSSTABCell.h"

NSString * const XLFormRowDescriptorTypeYTSSTABCell = @"XLFormRowDescriptorTypeYTSSTABCell";



@interface YTSSTABCell () <UITextFieldDelegate>

@property(nonatomic)NSDecimalNumber *officePrice;

@end

@implementation YTSSTABCell

+(void)load
{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:[YTSSTABCell class] forKey:XLFormRowDescriptorTypeYTSSTABCell];
}

#pragma mark - XLFormDescriptorCell

-(void)configure
{
    [super configure];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    [self.contentView addSubview:self.tabView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.valueTextField];
}

-(void)update
{
    [super update];
    
    self.titleLabel.text = self.rowDescriptor.title;
    
    _officePrice = [self.rowDescriptor.cellConfig valueForKey:@"officePrice"];
    
    self.valueTextField.text = [NSString stringWithFormat:@"%@万",_officePrice];
    
}

-(BOOL)formDescriptorCellCanBecomeFirstResponder
{
    return !self.rowDescriptor.isDisabled;
}

-(BOOL)formDescriptorCellBecomeFirstResponder
{
    return YES;
}


+(CGFloat)formDescriptorCellHeightForRowDescriptor:(XLFormRowDescriptor *)rowDescriptor {
    return 188;
}


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
        
        _tabView = [[YTSSCustomTABView alloc] initWithFrame:CGRectMake(10,44, self.frame.size.width-20, 144)];
        
        _tabView.horizontalSpacing = 1;
        _tabView.selectButtonHeight = 30;
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
        
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 44)];
        _titleLabel.text = @"我的报价";
    }
    return _titleLabel;
}
-(UITextField *)valueTextField{
    
    
    if(!_valueTextField){
        
        float x = CGRectGetMaxX(self.titleLabel.frame)+10;
        
        _valueTextField = [[UITextField alloc] initWithFrame:CGRectMake(x, 0,self.frame.size.width-x-10, 44)];
        _valueTextField.placeholder = @"我的报价";
        _valueTextField.textAlignment = NSTextAlignmentRight;
    }
    return _valueTextField;
}
@end
