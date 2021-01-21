//
//  provinceMode.m
//  TabBarControllerDemo
//
//  Created by noora chen on 2021/1/20.
//  Copyright © 2021 xlcw. All rights reserved.
//

#import "provinceMode.h"
#import "citiesMode.h"

@implementation provinceMode
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *arrcities = [NSMutableArray array];
        for (NSDictionary *dict in self.cities) {
            citiesMode *cm = [citiesMode citiesWithDict:dict];

            [arrcities addObject:cm];
        }
        self.cities = arrcities;

    }
    return self;
}

+(instancetype)provincesWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
