//
//  ViewController.m
//  CustomUISearchBar
//
//  Created by tianpengfei on 16/7/2.
//  Copyright © 2016年 tianpengfei. All rights reserved.
//

#import "ViewController.h"
#import "YTSSCustomUISearchBar.h"

@interface ViewController ()<UISearchBarDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    YTSSCustomUISearchBar *customUISearchBar = [[YTSSCustomUISearchBar alloc] initWithFrame:CGRectMake(10,7, self.view.frame.size.width-20,30)];
    customUISearchBar.placeholder = @"test";
    customUISearchBar.textFont = [UIFont systemFontOfSize:17.0f];
    customUISearchBar.textColor = [UIColor redColor];
    customUISearchBar.borderColor = [UIColor grayColor];
    customUISearchBar.cornerRadius = 10;
    customUISearchBar.delegate = self;
//    customUISearchBar.backgroundColor = [UIColor greenColor];
    
//    self.navigationItem.titleView = customUISearchBar;
    
    [self.navigationController.navigationBar addSubview:customUISearchBar];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UISearchBarDelegate

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{

    NSLog(@"searchText:%@",searchText);

}

@end
