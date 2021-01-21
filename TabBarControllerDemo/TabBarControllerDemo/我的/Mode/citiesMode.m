//
//  citiesMode.m
//  TabBarControllerDemo
//
//  Created by noora chen on 2021/1/20.
//  Copyright © 2021 xlcw. All rights reserved.
//

#import "citiesMode.h"

@implementation citiesMode

+(instancetype)citiesWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
  
@end
