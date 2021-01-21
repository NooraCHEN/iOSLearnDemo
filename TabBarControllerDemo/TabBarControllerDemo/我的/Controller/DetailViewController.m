//
//  DetailViewController.m
//  tableViewDemo
//
//  Created by xlcw on 2021/1/11.
//  Copyright © 2021 xlcw. All rights reserved.
//

#import "DetailViewController.h"
#import "recommendViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = self.name;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];

    NSLog(@"%@",self.name);
    UIButton *button = [[UIButton alloc]init];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //    button.layer.borderWidth = 1;
    [button setTitle:@"button" forState:UIControlStateNormal];
    button.frame=CGRectMake(0, 0, 50, 50);
    button.center = self.view.center;
    button.tag = 111;
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchDown];
//    [button setBackgroundImage:[UIImage imageNamed:@"button.jpg"] forState:UIControlStateNormal];
    [self.view addSubview:button];
}

-(void)clickButton:(UIButton *)button{
    recommendViewController *rc = [[recommendViewController alloc]init];
    rc.shopname = @"Nike";
    [self.navigationController pushViewController:rc animated:YES];
    
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
