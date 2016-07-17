//
//  YTSSMessageView.h
//  YTSSMessageView
//
//  Created by tianpengfei on 16/7/17.
//  Copyright © 2016年 tianpengfei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ItemClick)(int item);

@interface YTSSMessageView : UIView

-(id)initWithMessage:(NSString *)message buttonItems:(NSArray *)buttonItems itemClick:(ItemClick)itemClick;

-(void)show;
-(void)hide;

@end
