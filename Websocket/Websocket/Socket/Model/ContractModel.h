//
//  ContractModel.h
//  Websocket
//
//  Created by asd on 2020/5/19.
//  Copyright © 2020 cxy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface ContractModel : NSObject

@property (nonatomic , assign) BOOL isMine;

@property (nonatomic , copy) NSString * textStr;

@property (nonatomic, assign) CGFloat cellHeight;

@end

NS_ASSUME_NONNULL_END
