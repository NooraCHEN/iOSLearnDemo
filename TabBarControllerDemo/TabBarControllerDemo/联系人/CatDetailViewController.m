//
//  CatDetailViewController.m
//  TabBarControllerDemo
//
//  Created by xlcw on 2021/1/15.
//  Copyright © 2021 xlcw. All rights reserved.
//

#import "CatDetailViewController.h"
#import "PageViewController.h"

@interface CatDetailViewController ()
@property (nonatomic, strong)UIView *animationView;
@end

@implementation CatDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = self.name;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:self.name forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 100, 40);
    button.center = self.view.center;
    button.layer.borderColor = [UIColor grayColor].CGColor;
    button.layer.borderWidth = 0.5;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.animationView = [UIView new];
    self.animationView.backgroundColor = [UIColor redColor];
    
//    [UIView animateWithDuration:2 animations:^{
//        self.animationView.frame = CGRectMake(100, 200, 50, 50);
//        self.animationView.alpha = 0.2;
//    } completion:^(BOOL finished) {
//        self.animationView.frame = CGRectMake(100, 500, 50, 50);
//        self.animationView.alpha = 1;
//    }];
    [self.view addSubview:self.animationView];
    
}
-(void)buttonAction:(UIButton *)sender{
//    [UIView animateWithDuration:1 animations:^{
//        self.animationView.alpha = 1;
//        self.animationView.frame = CGRectMake(100, 500, 50, 50);
//    }];
//    [self.navigationController popViewControllerAnimated:YES];
    PageViewController *pageVC = [[PageViewController alloc] init];
    [self.navigationController pushViewController:pageVC animated:YES];
    
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
