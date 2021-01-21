//
//  PickViewController.h
//  TabBarControllerDemo
//
//  Created by noora chen on 2021/1/19.
//  Copyright © 2021 xlcw. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PickViewController : UIViewController

@property(nonatomic,strong)UIPickerView * pickView;
@property (nonatomic,strong) NSMutableArray *provincesArray;


@end

NS_ASSUME_NONNULL_END
