//
//  FindTableViewCell.m
//  MvvmDemo
//
//  Created by fan on 16/12/23.
//  Copyright © 2016年 changhog. All rights reserved.
//

#import "FindTableViewCell.h"
#import "UILabel+CDLabel.h"
#import "NSString+CKLStrLenght.h"
#import "NSString+CDStringSize.h"

@interface FindTableViewCell()


@property (nonatomic,strong)UILabel *distanceLb;

@property (nonatomic,strong)UILabel *timeLb;
@property (nonatomic,strong)UILabel *contentLb;
@property (nonatomic,strong)UILabel *byLb;
@property (nonatomic,strong)UILabel *userNameLb;
@property (nonatomic,strong)UIImageView *iconImageView;

@end

@implementation FindTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
        
        
    }
    return self;
    
}
- (void)setUI{

    self.distanceLb = [UILabel creatLabelWithFont:16 textColor:@"333333" frame:CGRectZero textAlign:NSTextAlignmentCenter];
    
    self.timeLb = [UILabel creatLabelWithFont:16 textColor:@"333333" frame:CGRectZero textAlign:NSTextAlignmentCenter];
    
    self.contentLb = [UILabel creatLabelWithFont:16 textColor:@"333333" frame:CGRectZero textAlign:NSTextAlignmentCenter];
    self.contentLb.numberOfLines=0;
    
    self.byLb = [UILabel creatLabelWithFont:16 textColor:@"333333" frame:CGRectZero textAlign:NSTextAlignmentCenter];
    
    self.userNameLb = [UILabel creatLabelWithFont:16 textColor:@"333333" frame:CGRectZero textAlign:NSTextAlignmentCenter];
    
    self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];

    [self.contentView addSubview:self.distanceLb];
    [self.contentView addSubview:self.timeLb];
    [self.contentView addSubview:self.byLb];
    [self.contentView addSubview:self.userNameLb];
    [self.contentView addSubview:self.contentLb];
    [self.contentView addSubview:self.iconImageView];
}

-(void)cellWithModel:(ContetModel *)model{

    self.distanceLb.text = model.distance;
    self.timeLb.text = model.time;
    self.byLb.text = model.by;
    self.contentLb.text =model.content;
    self.userNameLb.text = model.userName;
    self.iconImageView.image = [UIImage imageNamed:model.iconImage];
    
    
    self.distanceLb.frame = model.distanceFrame;
    self.timeLb.frame = model.timeFrame;
    self.contentLb.frame = model.contentFrame;
    self.byLb.frame =model.byFrame;
    self.userNameLb.frame = model.userNameFrame;
    self.iconImageView.frame = model.iconImageFrame;
    
//
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
