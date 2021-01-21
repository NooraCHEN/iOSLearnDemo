//
//  SandBoxViewController.m
//  TabBarControllerDemo
//
//  Created by noora chen on 2021/1/19.
//  Copyright © 2021 xlcw. All rights reserved.
//

#import "SandBoxViewController.h"

@interface SandBoxViewController ()

@end

@implementation SandBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:@"13525411424" forKey:@"phoneNumber"];
    [userDefault objectForKey:@"phoneNumber"];
    //沙盒根目录
    NSString *homePath = NSHomeDirectory();
    //document目录
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    //library目录
    NSString *libraryPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject;
    //caches目录
    NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    //application support目录
    NSString *applicationSupportPath = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES).firstObject;
    //preference目录
    NSString *preferencePath = NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES).firstObject;
    //tem目录
//    NSString *temPath = NSTemporaryDirectory();
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
