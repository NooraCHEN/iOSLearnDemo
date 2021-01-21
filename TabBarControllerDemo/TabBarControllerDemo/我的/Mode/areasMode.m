//
//  areasMode.m
//  TabBarControllerDemo
//
//  Created by noora chen on 2021/1/20.
//  Copyright © 2021 xlcw. All rights reserved.
//

#import "areasMode.h"
#import "citiesMode.h"

@implementation areasMode
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        // 赋值标题
        self.city = dict[@"city"];

        // 取出原来的字典数组
        NSArray *dictArray = dict[@"areas"];
        NSMutableArray *arrareas = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            citiesMode *citiesmode = [citiesMode citiesWithDict:dict];

            [arrareas addObject:citiesmode];
        }
        self.areas = arrareas;

    }
    return self;
}
+(instancetype)areasWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end
