//
//  TabbarViewController.m
//  TabBarControllerDemo
//
//  Created by xlcw on 2021/1/13.
//  Copyright © 2021 xlcw. All rights reserved.
//

#import "TabbarViewController.h"
#import "ViewController.h"
#import "ContactsViewController.h"
#import "FindViewController.h"
#import "MyViewController.h"
@interface TabbarViewController ()

@end

@implementation TabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setVC];
    
}
-(void)setVC{
    ViewController *vc1 = [[ViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc1];
    nav.tabBarItem.title = @"首页";
    //    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    //    UIImage *image = [UIImage imageNamed:@"shouye.jpg"];
    
    //    nav.tabBarItem.image = [[UIImage imageNamed:@"shouye.jpg"]imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    
    
    ContactsViewController *vc2 = [[ContactsViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    nav2.tabBarItem.title = @"联系人";
    
    FindViewController *vc3 = [[FindViewController alloc] init];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    nav3.tabBarItem.title = @"发现";
    
    MyViewController *vc4 = [[MyViewController alloc] init];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:vc4];
    nav4.tabBarItem.title = @"我的";
    
    self.viewControllers = @[nav,nav2,nav3,nav4];
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
