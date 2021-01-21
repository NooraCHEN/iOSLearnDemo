//
//  MyViewController.m
//  TabBarControllerDemo
//
//  Created by xlcw on 2021/1/13.
//  Copyright © 2021 xlcw. All rights reserved.
//

#import "MyViewController.h"
#import "ScrollViewController.h"
#import "CollectionViewController.h"
#import "PickViewController.h"
#import "SandBoxViewController.h"
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSArray *array = @[@"ScrollView",@"CollectionView",@"PickView",@"SandBox"];
    for (NSInteger i = 0; i < array.count; i++) {
        UIButton *button = [[UIButton alloc]init];
        [button setTitle:array[i] forState:UIControlStateNormal];
        button.tag = i;
        button.backgroundColor = [UIColor cyanColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.frame = CGRectMake((i%2)*(150+30)+20, (i/2)*(40+10)+200, 150, 40);
        [button addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}
-(void)buttonClickAction:(UIButton *)sender{
    if (sender.tag == 0) {
        ScrollViewController *scrollVC = [[ScrollViewController alloc]init];
        scrollVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:scrollVC animated:YES];
    } else if(sender.tag == 1){
        CollectionViewController *collecVC = [[CollectionViewController alloc]init];
        collecVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:collecVC animated:YES];
    }else if(sender.tag == 2){
        PickViewController *pickVC = [[PickViewController alloc]init];
        pickVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:pickVC animated:YES];
    }else if(sender.tag == 3){
        SandBoxViewController *sandboxVC = [[SandBoxViewController alloc]init];
        sandboxVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:sandboxVC animated:YES];
    }
}
//-(CGFloat)getStringHeightWithText:(NSString *)text font:(UIFont *)font viewWidth:(CGFloat)width {
//   // 设置文字属性 要和label的一致
//   NSDictionary *attrs = @{NSFontAttributeName :font};
//   CGSize maxSize = CGSizeMake(width, MAXFLOAT);
//
//   NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
//
//   // 计算文字占据的宽高
//   CGSize size = [text boundingRectWithSize:maxSize options:options attributes:attrs context:nil].size;
//
//   // 当你是把获得的高度来布局控件的View的高度的时候.size转化为ceilf(size.height)。
//   return  ceilf(size.height);
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
