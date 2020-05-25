//
//  IMTextTableViewCell.m
//  Websocket
//
//  Created by asd on 2020/5/19.
//  Copyright © 2020 cxy. All rights reserved.
//

#import "IMTextTableViewCell.h"
#import <Masonry.h>
@implementation IMTextTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.imTextlabel = [[UILabel alloc]init];
        [self addSubview:self.imTextlabel];
    }
    return self;
}

- (void)setCmodel:(ContractModel *)cmodel {
    _cmodel = cmodel;
    if (!cmodel.isMine)
    {
        [self.imTextlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-30);
            make.left.offset(20);
            make.top.equalTo(self.mas_top).offset(10);
        }];
    }else{
        [self.imTextlabel mas_makeConstraints:^(MASConstraintMaker *make) {
             make.right.offset(-20);
             make.top.equalTo(self.mas_top).offset(10);
//             make.left.offset(30);
        }];
    }
    self.imTextlabel.textColor = [UIColor blackColor];
    self.imTextlabel.font = [UIFont systemFontOfSize:14];
    self.imTextlabel.backgroundColor = [UIColor greenColor];
    self.imTextlabel.text = cmodel.textStr;
    self.imTextlabel.numberOfLines = 0;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
