//
//  PageViewController.m
//  TabBarControllerDemo
//
//  Created by noora chen on 2021/1/19.
//  Copyright © 2021 xlcw. All rights reserved.
//

#import "PageViewController.h"
#import "TestViewController.h"
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height

@interface TitleCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation TitleCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];

    if (self) {
        [self createView];
    }

    return self;
}

- (void)createView{

    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height)];

    [self.contentView addSubview:self.titleLabel];

    self.titleLabel.font = [UIFont systemFontOfSize:14];
}
@end

@interface PageViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
{
    //记录当前页 当前标题位置
    NSInteger ld_currentIndex;
}
@property (nonatomic, strong) UIPageViewController *pageViewController;

@property (nonatomic, strong) NSMutableArray *controllersArr;/// 控制器数组

@property (nonatomic, strong) NSMutableArray *titleArray; /// 标题数组

@property (nonatomic, strong) UICollectionView *titleCollectionView; /// 标题collectionview
@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.navigationBar.translucent = NO;
    self.controllersArr = [NSMutableArray array];
    self.titleArray = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        TestViewController *con = [[TestViewController alloc]init];
        con.view.backgroundColor = [UIColor colorWithRed:(random()%100)/255.0 green:(random()%100)/255.0 blue:(random()%100)/255.0 alpha:1];
        [self.controllersArr addObject:con];
        NSString *str = [NSString stringWithFormat:@"第 %d 页", i+1];
        
        con.titleString = str;

        [self.titleArray addObject:str];

    }

    [self createCollectionView];

    [self createPageViewController];

    [self setTheFirstPage];
}
- (void)createCollectionView{

    UICollectionViewFlowLayout *lay = [[UICollectionViewFlowLayout alloc] init];

    lay.itemSize = CGSizeMake(60, 30);

    lay.minimumLineSpacing = 0;

    lay.minimumInteritemSpacing = 0;

    lay.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    self.titleCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 34, WIDTH, 50) collectionViewLayout:lay];

    self.titleCollectionView.showsHorizontalScrollIndicator = NO;

    self.titleCollectionView.backgroundColor = [UIColor whiteColor];

    self.titleCollectionView.delegate = self;

    self.titleCollectionView.dataSource = self;

    [self.titleCollectionView registerClass:[TitleCollectionViewCell class] forCellWithReuseIdentifier:@"titleReuse"];

    [self.navigationController.view addSubview:self.titleCollectionView];

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.titleArray.count;

}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    TitleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"titleReuse" forIndexPath:indexPath];

    cell.titleLabel.text = self.titleArray[indexPath.row];

    if (indexPath.row == ld_currentIndex) {

        cell.titleLabel.textColor = [UIColor orangeColor];

    }else{

        cell.titleLabel.textColor = [UIColor blackColor];

    }

    return cell;

}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    UIViewController *vc = [self.controllersArr objectAtIndex:indexPath.row];

    if (indexPath.row > ld_currentIndex) {

        [self.pageViewController setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {

        }];

    } else {

        [self.pageViewController setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:^(BOOL finished) {

        }];

    }

    ld_currentIndex = indexPath.row;

    NSIndexPath *path = [NSIndexPath indexPathForRow:ld_currentIndex inSection:0];

    [self.titleCollectionView scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];

    [self.titleCollectionView reloadData];

}

/// 创建pageViewController

- (void)createPageViewController {

    NSDictionary *option = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:0] forKey:UIPageViewControllerOptionInterPageSpacingKey];

    _pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:option];

    _pageViewController.delegate = self;

    _pageViewController.dataSource = self;

    [self addChildViewController:_pageViewController];

    [self.view addSubview:_pageViewController.view];

}

#pragma mark - UIPageViewControllerDataSource
/// 展示上一页

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {

    NSInteger index = [self.controllersArr indexOfObject:viewController];

    if (index == 0 || (index == NSNotFound)) {

        return nil;

    }

    index--;

    return [self.controllersArr objectAtIndex:index];

}
/// 展示下一页

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {

    NSInteger index = [self.controllersArr indexOfObject:viewController];

    if (index == self.controllersArr.count - 1 || (index == NSNotFound)) {

        return nil;

    }

    index++;

    return [self.controllersArr objectAtIndex:index];

}

#pragma mark - UIPageViewControllerDelegate

/// 将要滑动切换的时候

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {

    UIViewController *nextVC = [pendingViewControllers firstObject];

    NSInteger index = [self.controllersArr indexOfObject:nextVC];

    ld_currentIndex = index;

}
/// 滑动结束后

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {

    if (completed) {

        NSIndexPath *path = [NSIndexPath indexPathForRow:ld_currentIndex inSection:0];

        [self.titleCollectionView scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];

        [self.titleCollectionView reloadData];

        NSLog(@">>>>>>>>> %ld", (long)ld_currentIndex);

    }

}

/// 设置默认显示的是哪个页面（controller）

- (void)setTheFirstPage{

    UIViewController *vc = [self.controllersArr objectAtIndex:ld_currentIndex];

    [self.pageViewController setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];

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
