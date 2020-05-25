//
//  IMManager+DB.h
//  Websocket
//
//  Created by asd on 2020/5/19.
//  Copyright © 2020 cxy. All rights reserved.
//

#import "IMManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface IMManager (DB)

//创建联系人DB
- (void)creatNewContect:(NSString *)contectID;

//移除联系人DB
- (void)removeContect:(NSString *)contectID;

//删除聊天记录里的内容
- (void)removeContectData:(NSString *)contectID withDataID:(NSString *)dataID;
@end

NS_ASSUME_NONNULL_END
