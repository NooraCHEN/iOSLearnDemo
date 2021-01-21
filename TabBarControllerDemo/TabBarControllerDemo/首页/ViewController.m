//
//  ViewController.m
//  tableViewDemo
//
//  Created by xlcw on 2021/1/11.
//  Copyright © 2021 xlcw. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSMutableArray *list;

@end

@implementation ViewController

NSMutableArray* FirstList;
NSMutableArray* LetterList;
NSMutableArray* ANameList;
NSMutableArray* BNameList;
NSMutableArray* CNameList;
NSMutableArray* DNameList;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    FirstList = [NSMutableArray arrayWithObjects:@"新的朋友",@"群聊",@"标签",@"公众号", nil];
    LetterList = [NSMutableArray arrayWithObjects:@"",@"A",@"B",@"C",@"D", nil];
    ANameList = [NSMutableArray arrayWithObjects:@"a1",@"a2",@"a3",@"a4",@"a5",@"a6", nil];
    BNameList = [NSMutableArray arrayWithObjects:@"b1",@"b2",@"b3",@"b4",@"b5", nil];
    CNameList = [NSMutableArray arrayWithObjects:@"c1",@"c2",@"c3",@"c4",@"c5", nil];
    DNameList = [NSMutableArray arrayWithObjects:@"d1",@"d2",@"d3",@"d4",@"d5", nil];
    self.list =  [NSMutableArray arrayWithObjects:FirstList,ANameList,BNameList,CNameList,DNameList, nil];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorColor = [UIColor blueColor];
    [self.view addSubview:tableView];
    
    //    tableView.tableHeaderView=[UIButton buttonWithType:UIButtonTypeContactAdd];
    //    tableView.tableFooterView=[UIButton buttonWithType:UIButtonTypeContactAdd];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.list.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //    switch (section) {
    //            case 0:
    //            return FirstList.count;
    //            break;
    //            case 1:
    //            return ANameList.count;
    //            break;
    //            case 2:
    //            return BNameList.count;
    //            break;
    //            case 3:
    //            return CNameList.count;
    //            break;
    //            case 4:
    //            return DNameList.count;
    //            break;
    //        default:
    //            break;
    //    }
    //
    //    return 0;
    return  [[self.list objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
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
    cell.textLabel.text = [[self.list objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    return cell;
    
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return LetterList[section];
}
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return LetterList;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailViewController *vc = [[DetailViewController alloc] init];
    vc.name = [[self.list objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];;
//    self.tabBarController.hidesBottomBarWhenPushed = YES;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}




-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    //    先删除数据
    [[self.list objectAtIndex:indexPath.section]removeObjectAtIndex:indexPath.row];
    [tableView reloadData];
    //    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    //    删除指定行
    //    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:indexPath.row   inSection:indexPath.section], nil]
    //                     withRowAnimation:UITableViewRowAnimationFade];
}
//- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
//    return @"底部描述";
//}
@end
