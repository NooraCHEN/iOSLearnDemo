//
//  ContactsViewController.m
//  TabBarControllerDemo
//
//  Created by xlcw on 2021/1/13.
//  Copyright © 2021 xlcw. All rights reserved.
//

#import "ContactsViewController.h"
#import "ContactsTableViewCell.h"
#import "CatDetailViewController.h"
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height

@interface ContactsViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource,CellDelegate,UIScrollViewDelegate>
@property (nonatomic,strong)NSMutableArray *list;
@property (nonatomic,strong)NSMutableArray *buttonNameArray;
@end

@implementation ContactsViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    //自定义leftBarButtonItemsß
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 50);
    [button setTitle:@"< 返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = buttonItem;
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"source" ofType:@"plist"];
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:path];
    self.list = [NSMutableArray arrayWithArray:array];
    self.buttonNameArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6", nil];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorColor = [UIColor blueColor];
    [self.view addSubview:tableView];
    
    NSString *namePath = [[NSBundle mainBundle] pathForResource:@"buttonName" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:namePath];
    for (NSInteger i = 1; i < 4; i++) {
        NSLog(@"%@",dic[[NSString stringWithFormat:@"%@%ld",@"item",i]]);
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.list.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CatDetailViewController *catVC = [[CatDetailViewController alloc] init];
    catVC.hidesBottomBarWhenPushed = YES;
    catVC.name = self.list[indexPath.row];
    [self.navigationController pushViewController:catVC animated:YES];
}
- (ContactsTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ContactsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
//        cell = [[ContactsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ContactsTableViewCell" owner:nil options:nil] lastObject];
    }
    cell.titleLabel.text = self.list[indexPath.row];
    cell.icon.image = [UIImage imageNamed:@"cat.jpg"];
    cell.myBlock = ^(NSInteger tag) {
        NSLog(@"这个button的tag是：%ld",tag);
    };
    cell.delegate = self;
    [cell customButton:self.buttonNameArray[indexPath.row]];
    return cell;
}

-(void)cellClickButton{
//    NSLog(@"已点击");
}

//-(void)tapButtonAction{
//
//}
//-(void)setTextView{
//    self.view.backgroundColor = [UIColor whiteColor];
//    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 240, 50)];
//    //    textField.layer.borderColor = [UIColor grayColor].CGColor;
//    //    textField.layer.borderWidth = 0.5;
//    //    textField.layer.cornerRadius = 10;
//    textField.borderStyle = UITextBorderStyleBezel;
//    textField.center = self.view.center;
//    textField.delegate = self;
//    [self.view addSubview:textField];
//}
//
//-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
//    NSLog(@"textFieldShouldBeginEditing");
//    return YES;
//}
//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    NSLog(@"%@",string);
//    return YES;
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
