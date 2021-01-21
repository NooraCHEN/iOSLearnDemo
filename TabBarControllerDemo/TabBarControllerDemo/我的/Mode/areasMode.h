//
//  areasMode.h
//  TabBarControllerDemo
//
//  Created by noora chen on 2021/1/20.
//  Copyright © 2021 xlcw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface areasMode : NSObject
@property(nonatomic,copy)NSArray *areas;
@property(nonatomic,copy)NSString *city;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)areasWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
