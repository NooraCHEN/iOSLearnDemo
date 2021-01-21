//
//  PickViewController.m
//  TabBarControllerDemo
//
//  Created by noora chen on 2021/1/19.
//  Copyright © 2021 xlcw. All rights reserved.
//
#import "PickViewController.h"
#import "provinceMode.h"
#import "citiesMode.h"
#import "NSMutableArray+Json.h"

#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height
@interface PickViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@end

@implementation PickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self pickView];
    [self provincesArray];
    // Do any additional setup after loading the view.
}
#pragma mark --UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return  3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component == 0){
        return self.provincesArray.count;
    }else if(component == 1){
        NSInteger rowProvince = [_pickView selectedRowInComponent:0];
        provinceMode *pm = self.provincesArray[rowProvince];
        return pm.cities.count;
    }else
    {
        NSInteger rowProvince = [_pickView selectedRowInComponent:0];
        NSInteger rowCity = [_pickView selectedRowInComponent:1];
        provinceMode *pm = self.provincesArray[rowProvince];
        citiesMode *cm = pm.cities[rowCity];
        return cm.areas.count;
    }
}
#pragma mark --UIPickerViewDelegate
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
   //获取某一列的行数
    if(component == 0){
        provinceMode *pm = self.provincesArray[row];
        return  pm.state;
    }else if(component == 1){
        NSInteger rowProvince = [_pickView selectedRowInComponent:0];
        provinceMode *pm = self.provincesArray[rowProvince];
        citiesMode *cm = pm.cities[row];
        return  cm.city;
    }else{
        NSInteger rowProvince = [_pickView selectedRowInComponent:0];
        NSInteger rowCity = [_pickView selectedRowInComponent:1];
        provinceMode *pm = self.provincesArray[rowProvince];
        citiesMode *cm = pm.cities[rowCity];
        return cm.areas[row];
    }
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
        if(component == 0)
           {
               [pickerView reloadComponent:1];
               [pickerView reloadComponent:2];
               
           } if(component == 1)
           {
               [pickerView reloadComponent:2];
           }
    
}
#pragma mark --- getter
-(UIPickerView *)pickView{
    if(_pickView == nil){
        _pickView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, HEIGHT/2, WIDTH, 250)];
        _pickView.delegate = self;
        _pickView.dataSource = self;
        [self.view addSubview:_pickView];
    }
    return _pickView;
}
-(NSArray *)provincesArray{
    if(_provincesArray == nil){
        NSString *path = [[NSBundle mainBundle]pathForResource:@"area" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *areaArray = [NSMutableArray array];
//        NSMutableArray *muArray = [[NSMutableArray alloc] addSomeProvinces];
        for(NSDictionary *dict in array){
            provinceMode *pm = [provinceMode provincesWithDict:dict];
            [areaArray addObject:pm];
        }
        _provincesArray =areaArray;
    }
    return _provincesArray;
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
