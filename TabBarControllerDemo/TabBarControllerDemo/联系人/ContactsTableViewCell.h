//
//  ContactsTableViewCell.h
//  TabBarControllerDemo
//
//  Created by xlcw on 2021/1/14.
//  Copyright © 2021 xlcw. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^MyBlock) (NSInteger);

@protocol CellDelegate <NSObject>

-(void)cellClickButton;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ContactsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, copy)MyBlock myBlock;
@property (nonatomic, weak)id<CellDelegate> delegate;
-(void)customButton:(NSString *)buttonName;

@end

NS_ASSUME_NONNULL_END
