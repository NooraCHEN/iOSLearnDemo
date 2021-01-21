//
//  pickMode.h
//  TabBarControllerDemo
//
//  Created by noora chen on 2021/1/20.
//  Copyright © 2021 xlcw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface pickMode : NSObject

@property(nonatomic,copy)NSString *province;


-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)provincesWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
