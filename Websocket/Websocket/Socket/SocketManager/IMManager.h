//
//  IMManager.h
//  Websocket
//
//  Created by asd on 2020/5/18.
//  Copyright © 2020 cxy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol IMManagerDelegate <NSObject>

- (void)reciveMessage:(NSString *)message;

@end

@interface IMManager : NSObject
@property (nonatomic , strong)id<IMManagerDelegate>delegate;

- (void)close;

- (void)sendMessage:(NSString *)message;

@end

NS_ASSUME_NONNULL_END
