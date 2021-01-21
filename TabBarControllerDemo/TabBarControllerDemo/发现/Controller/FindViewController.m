//
//  FindViewController.m
//  TabBarControllerDemo
//
//  Created by xlcw on 2021/1/13.
//  Copyright © 2021 xlcw. All rights reserved.
//

#import "FindViewController.h"
#import "TittleView.h"
#import "BlockViewController.h"

@interface FindViewController ()<ButtonClickDelegate>

@end

@implementation FindViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TittleView *titleView = [[TittleView alloc]initWithFrame:CGRectMake(0, 0, 300, 50)];
    titleView.backgroundColor = [UIColor greenColor];
    self.navigationItem.titleView = titleView;
    self.view.backgroundColor = [UIColor whiteColor];
//    void(^BLock)(void) = ^{
//        NSLog(@"这是一个block");
//    };
//    BLock();
//    void(^BLock2)(NSInteger) = ^(NSInteger a){
//        NSLog(@"这是一个block = %ld",a);
//    };
//    BLock2(2);
//    NSInteger(^Block3)(NSInteger,NSInteger) = ^(NSInteger a, NSInteger b){
//        return a + b;
//    };
//    NSInteger sum = Block3(3,4);
//    NSLog(@"%ld",sum);
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    BlockViewController *vc = [[BlockViewController alloc] init];
    vc.name = @"陈盈盈";
//    __weak typeof(self)WeakSelf = self;
    
    vc.Block = ^(NSString * message) {
       NSLog(@"%@",message);

    };
    
//    vc.myBlock = ^(NSString * number) {
//
//    };
    vc.delegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}
-(void)buttonClickWithTag:(NSString *)tag{
    NSLog(@"%@",tag);
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
