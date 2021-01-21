//
//  BlockViewController.m
//  TabBarControllerDemo
//
//  Created by xlcw on 2021/1/14.
//  Copyright © 2021 xlcw. All rights reserved.
//

#import "BlockViewController.h"

@interface BlockViewController ()

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:self.name forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 100, 40);
    button.center = self.view.center;
    button.layer.borderColor = [UIColor grayColor].CGColor;
    button.layer.borderWidth = 0.5;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(void)buttonAction:(UIButton *)sender{
    if (self.Block) {
        self.Block(@"这是一个传递数据");
    }
//
//    if (self.myBlock) {
//        self.Block(@"1");
//    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(buttonClickWithTag:)]) {
        [self.delegate buttonClickWithTag:@"陈盈盈"];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
