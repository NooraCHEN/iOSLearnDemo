//
//  ScrollViewController.m
//  TabBarControllerDemo
//
//  Created by noora chen on 2021/1/19.
//  Copyright © 2021 xlcw. All rights reserved.
//

#import "ScrollViewController.h"
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height
@interface ScrollViewController ()<UIScrollViewDelegate>

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, HEIGHT/4, WIDTH, HEIGHT/2)];
    scrollView.backgroundColor = [UIColor cyanColor];
    UIImage *image = [UIImage imageNamed:@"cat.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
    NSLog(@"%f",[UIImage imageNamed:@"cat.jpg"].size.height);
    NSLog(@"%f",[UIImage imageNamed:@"cat.jpg"].size.width);
    imageView.frame = CGRectMake(0, 0, image.size.height, image.size.width);

    scrollView.contentSize = CGSizeMake(WIDTH*2, HEIGHT);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
//    scrollView.bounces = NO;
//    scrollView.pagingEnabled = YES;
//    scrollView.contentOffset = CGPointMake(140, 140);
    scrollView.delegate = self;
    [scrollView addSubview:imageView];
    [self.view addSubview:scrollView];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    NSLog(@"scrollViewDidScroll");
    CGPoint point=scrollView.contentOffset;
    NSLog(@"%f,%f",point.x,point.y);
    // 从中可以读取contentOffset属性以确定其滚动到的位置。
    // 注意：当ContentSize属性小于Frame时，将不会出发滚动
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDecelerating");
    // 该方法在scrollViewDidEndDragging方法之后。
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    NSLog(@"scrollViewDidEndDecelerating");

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
