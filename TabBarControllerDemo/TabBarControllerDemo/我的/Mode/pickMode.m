//
//  pickMode.m
//  TabBarControllerDemo
//
//  Created by noora chen on 2021/1/20.
//  Copyright © 2021 xlcw. All rights reserved.
//

#import "pickMode.h"

@implementation pickMode

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)provincesWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

@end
