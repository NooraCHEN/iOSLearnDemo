//
//  recommendViewController.m
//  TabBarControllerDemo
//
//  Created by xlcw on 2021/1/12.
//  Copyright © 2021 xlcw. All rights reserved.
//

#import "recommendViewController.h"
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height

@interface recommendViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITextField *search;
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UIImageView *ImageView1;
@property (nonatomic,strong)UITableView *tableView;


@end

@implementation recommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    self.navigationItem.title = self.shopname;
    
//    UIBarButtonItem *recommend = [[UIBarButtonItem alloc]initWithTitle:@"推荐"
//                                                                 style:UIBarButtonItemStylePlain
//                                                                target:self
//                                                                action:@selector(recommendView)];
//
//    UIBarButtonItem *product= [[UIBarButtonItem alloc] initWithTitle:@"商品"
//                                                                   style:UIBarButtonItemStylePlain
//                                                                  target:self
//                                                                  action:@selector(productsView)];
//
//    UIBarButtonItem *newProduct = [[UIBarButtonItem alloc]initWithTitle:@"新品"
//                                                                 style:UIBarButtonItemStylePlain
//                                                                target:self
//                                                                action:@selector(newProductView)];
//    NSArray *buttonArray = [[NSArray alloc]initWithObjects:recommend,product,newProduct,nil];
//    self.navigationItem.rightBarButtonItems = buttonArray;
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 35)];
    self.search= [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 200, 35)];
    self.search.placeholder = @"请输入您要搜索的内容...";
    self.search.borderStyle = UITextBorderStyleRoundedRect;
    [view1 addSubview:self.search];
    self.navigationItem.titleView = view1;
    
    UIBarButtonItem *searchShop = [[UIBarButtonItem alloc]initWithTitle:@"搜本店" style:UIBarButtonItemStylePlain target:self action:@selector(shopView)];
    self.navigationItem.rightBarButtonItem = searchShop;
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, WIDTH, HEIGHT)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    UIImage *image1 = [UIImage imageNamed:@"1.jpg"];
    UIImage *image2 = [UIImage imageNamed:@"2.jpg"];
    UIImage *image3 = [UIImage imageNamed:@"3.jpg"];
    UIImage *image4 = [UIImage imageNamed:@"4.jpg"];
    UIImage *image5 = [UIImage imageNamed:@"5.jpg"];
    
    
    self.scrollView= [[UIScrollView alloc]initWithFrame:self.view.bounds];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(WIDTH*5, 300);
    CGRect imageViewRect = self.view.bounds;
    self.ImageView1 = [[UIImageView alloc]initWithImage:image1];
    //    ImageView1.frame =  imageViewRect;
    self.ImageView1.frame = CGRectMake(0, 50, WIDTH, 200);
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.ImageView1];
    
    
    imageViewRect.origin.x += self.ImageView1.frame.size.width;
    UIImageView *imageView2 = [[UIImageView alloc]initWithImage:image2];
    //    imageView2.frame = imageViewRect;
    imageView2.frame = CGRectMake(WIDTH, 50, WIDTH,200);
    [self.scrollView addSubview:imageView2];
    
    imageViewRect.origin.x += imageView2.frame.size.width;
    UIImageView *imageView3 = [[UIImageView alloc]initWithImage:image3];
    //    imageView3.frame =  imageViewRect;
    imageView3.frame = CGRectMake(WIDTH*2, 50, WIDTH,200);
    [self.scrollView addSubview:imageView3];
    
    imageViewRect.origin.x += imageView3.frame.size.width;
    UIImageView *imageView4 = [[UIImageView alloc]initWithImage:image4];
    //    imageView4.frame =  imageViewRect;
    imageView4.frame = CGRectMake(WIDTH*3, 50, WIDTH, 200);
    [self.scrollView addSubview:imageView4];
    
    imageViewRect.origin.x += imageView4.frame.size.width;
    UIImageView *imageView5 = [[UIImageView alloc]initWithImage:image5];
    //    imageView5.frame =  imageViewRect;
    imageView5.frame = CGRectMake(WIDTH*4, 50, WIDTH, 200);
    [self.scrollView addSubview:imageView5];
    [self.tableView addSubview:self.scrollView];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startCarousel:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
    //    tableView.tableHeaderView = self.scrollView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    //    switch (indexPath.section) {
    //            case 0:
    //            cell.textLabel.text = FirstList[indexPath.row];
    //            break;
    //            case 1:
    //            cell.textLabel.text = ANameList[indexPath.row];
    //            break;
    //            case 2:
    //            cell.textLabel.text = BNameList[indexPath.row];
    //            break;
    //            case 3:
    //            cell.textLabel.text = CNameList[indexPath.row];
    //            break;
    //            case 4:
    //            cell.textLabel.text = DNameList[indexPath.row];
    //            break;
    //        default:
    //            break;
    //    }
    if(indexPath.section == 0){
        cell.textLabel.text = nil;
    }else{
    cell.textLabel.text = @"nihao";
    }
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    //    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc]init];
    headerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UILabel *label = [[UILabel alloc]init];
    label.textColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize:13];
    label.frame = CGRectMake(15, 0, 100, 20);
    [headerView addSubview:label];
    if(section == 0){
        label.text = @"第0组";
    }else{
        label.text = @"第1组";
    }
    return headerView;
}
-(void)startCarousel:(NSTimer *)timer{
    
}
//- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//
//    return 0;
//}

/*
#pragma mark - Navigation
shop
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//- (void)recommendView{
//}
//- (void)productsView{
//}
//- (void)newProductView{
//}
- (void)shopView{
}
@end
