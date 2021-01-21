//
//  ContactsTableViewCell.m
//  TabBarControllerDemo
//
//  Created by xlcw on 2021/1/14.
//  Copyright © 2021 xlcw. All rights reserved.
//

#import "ContactsTableViewCell.h"

@interface ContactsTableViewCell()

@end

@implementation ContactsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"]) {
        self.titleLabel.numberOfLines = 0;
    }
    return self;
}
-(void)customButton:(NSString *)buttonName{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:buttonName forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(CGRectGetMaxX(self.icon.frame), CGRectGetMaxY(self.titleLabel.frame)+10, 100, 40);
    [button addTarget:self action:@selector(cellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = [buttonName integerValue];
    [self.contentView addSubview:button];
}

-(void)cellButtonAction:(UIButton *)sender{
    if (self.myBlock) {
        self.myBlock(sender.tag);
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(cellClickButton)]) {
        [self.delegate cellClickButton];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
