//
//  CodeTableViewCell.m
//  MvvmDemo
//
//  Created by fan on 17/1/6.
//  Copyright © 2017年 changhog. All rights reserved.
//

#import "CodeTableViewCell.h"

@interface CodeTableViewCell()
@property (nonatomic,strong) UIImageView *iconImage;
@property (nonatomic,strong) UILabel *contentLb;
@property (nonatomic,strong) UIView *lineView;

@property (nonatomic, strong) UIButton *sharedButton;

@property (nonatomic, strong) UIButton *lockButton;

@property (nonatomic, strong) UIButton *deleteButton;
@property (nonatomic,strong) UIButton *selectBt;





@end

@implementation CodeTableViewCell

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

    self.iconImage = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:self.iconImage];
    
    self.contentLb = [[UILabel alloc] initWithFrame:CGRectZero];
    self.contentLb.numberOfLines =0;
    self.contentLb.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:self.contentLb];
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectZero];
    self.lineView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.lineView];
    
    self.sharedButton = [self creatButtonWithimage:@"zhuanfa"];
    [self.sharedButton addTarget:self action:@selector(shared) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.sharedButton];
    
    self.lockButton = [self creatButtonWithimage:@"suo_guan"];
    [self.lockButton addTarget:self action:@selector(lock) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.lockButton];
    
    self.deleteButton = [self creatButtonWithimage:@"shanchu"];
    [self.deleteButton addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.deleteButton];
    

    
    
    self.selectBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.selectBt addTarget:self action:@selector(btClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.selectBt setTitle:@"展开" forState:UIControlStateNormal];
    [self.selectBt setBackgroundColor:[UIColor redColor]];
    [self.contentView addSubview:self.selectBt];
}
- (UIButton *) creatButtonWithimage:(NSString *)img{
    UIButton *  button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    [button setContentMode:UIViewContentModeCenter];
    return button;
}
- (void)updataWithTableView:(UITableView *)tableview andModel:(MyCodelModel *)model{
    self.model = model;
    self.iconImage.image = [UIImage imageNamed:model.imageName];
    self.contentLb.text = model.content;
    
    
    self.iconImage.frame = model.imageRect;
    self.contentLb.frame = model.contentRect;
    self.lineView.frame = model.lineRect;
    self.selectBt.frame = model.BottomRect;
   
}

-(void)btClicked:(UIButton*)sender{

//    if (self.delegate && [self.delegate respondsToSelector:@selector(CodeTableViewCellBtClicked:andWithCodeModel:)]) {
//        
//        [self.delegate CodeTableViewCellBtClicked:sender andWithCodeModel:self.model];
//    }`
    
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//分享
- (void) shared{
  
    if (self.delegate && [self.delegate respondsToSelector:@selector(CodeTableViewCellBtClicked:andWithCodeModel:andClickedType:)]) {
        [self.delegate CodeTableViewCellBtClicked:nil andWithCodeModel:self.model andClickedType:0];
    }
    
}

//锁
- (void) lock {
    if (self.delegate && [self.delegate respondsToSelector:@selector(CodeTableViewCellBtClicked:andWithCodeModel:andClickedType:)]) {
        [self.delegate CodeTableViewCellBtClicked:nil andWithCodeModel:self.model andClickedType:1];
    }
}

//删除
- (void) delete {
    if (self.delegate && [self.delegate respondsToSelector:@selector(CodeTableViewCellBtClicked:andWithCodeModel:andClickedType:)]) {
        [self.delegate CodeTableViewCellBtClicked:nil andWithCodeModel:self.model andClickedType:2];
    }
}
@end
