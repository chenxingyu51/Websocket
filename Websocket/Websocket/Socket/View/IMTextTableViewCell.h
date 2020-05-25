//
//  IMTextTableViewCell.h
//  Websocket
//
//  Created by asd on 2020/5/19.
//  Copyright © 2020 cxy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContractModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface IMTextTableViewCell : UITableViewCell

@property (nonatomic , strong)UILabel *imTextlabel;

@property (nonatomic , strong)ContractModel *cmodel;

@end

NS_ASSUME_NONNULL_END
