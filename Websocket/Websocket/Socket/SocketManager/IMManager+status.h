//
//  IMManager+status.h
//  Websocket
//
//  Created by asd on 2020/5/19.
//  Copyright © 2020 cxy. All rights reserved.
//

#import "IMManager.h"

NS_ASSUME_NONNULL_BEGIN
@protocol IMManagerStatusDelegate <NSObject>

- (void)socketStatus:(BOOL)isConnect;

@end

@interface IMManager (status)

@property (nonatomic , strong) id<IMManagerDelegate>IMStatisDelegate;

@end

NS_ASSUME_NONNULL_END
