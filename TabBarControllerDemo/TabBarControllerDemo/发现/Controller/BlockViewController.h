//
//  BlockViewController.h
//  TabBarControllerDemo
//
//  Created by xlcw on 2021/1/14.
//  Copyright © 2021 xlcw. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^MyBlock) (NSString *_Nonnull);

@protocol ButtonClickDelegate <NSObject>

-(void)buttonClickWithTag:(NSString *_Nullable)tag;

@end

NS_ASSUME_NONNULL_BEGIN

@interface BlockViewController : UIViewController
@property(nonatomic, copy)NSString *name;
@property(nonatomic, copy)void (^Block)(NSString *);
@property(nonatomic, copy)MyBlock myBlock;
@property(nonatomic, weak)id<ButtonClickDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
