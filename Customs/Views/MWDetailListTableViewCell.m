//
//  MWDetailListTableViewCell.m
//  Customs
//
//  Created by Tiny on 15/7/2.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWDetailListTableViewCell.h"


@interface MWDetailListTableViewCell ()

@property (nonatomic,weak) IBOutlet UILabel *nameLabel;
@property (nonatomic,weak) IBOutlet UILabel *contentLabel;

@end

@implementation MWDetailListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)configCellWithTitle:(NSString *)title content:(NSString *)content{
    self.nameLabel.text = title;
    self.contentLabel.text = content;
}
- (CGRect)contentRect{
    return self.contentLabel.frame;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
