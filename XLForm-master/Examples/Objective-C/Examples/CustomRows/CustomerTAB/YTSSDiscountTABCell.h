//
//  YTSSDiscountTABCell.h
//  XLForm
//
//  Created by tianpengfei on 16/7/3.
//  Copyright © 2016年 Xmartlabs. All rights reserved.
//

#import "XLFormBaseCell.h"
#import "YTSSCustomTABView.h"

extern NSString * const YTSSFormRowDescriptorTypeTAB;

@interface YTSSDiscountTABCell : XLFormBaseCell

@property(strong,nonatomic)YTSSCustomTABView *tabView;

@property(strong,nonatomic)UILabel *titleLabel;
@property(strong,nonatomic)UITextField *valueTextField;

@end
