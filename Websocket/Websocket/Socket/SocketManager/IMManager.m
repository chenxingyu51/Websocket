//
//  IMManager.m
//  Websocket
//
//  Created by asd on 2020/5/18.
//  Copyright © 2020 cxy. All rights reserved.
//

#import "IMManager.h"
#import <SocketRocket/SocketRocket.h>

@interface IMManager()<SRWebSocketDelegate>
{
    NSTimer *heartBeat;
}
@property (nonatomic , strong)SRWebSocket *socket;


@end
@implementation IMManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.socket =[[SRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: @"ws://localhost:8080/CXWebSocket/websocket"]]];

        self.socket.delegate = self;
        [self initHeart];
        [self.socket open];
    }
    return self;
}

- (void)sendMessage:(NSString *)message {
    if (self.socket != nil){
        if (self.socket.readyState == SR_OPEN) {
            NSData *data = [message dataUsingEncoding:NSUTF8StringEncoding];
            [self.socket send:data];    // 发送数据
        } else if (self.socket.readyState == SR_CONNECTING) {
            [self reConnect];
        } else if (self.socket.readyState == SR_CLOSING || self.socket.readyState == SR_CLOSED) {
            // websocket 断开了，调用 reConnect 方法重连
//            [self reConnect];
        }
    }
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message {
    NSLog(@"%@",message);
    if ([self.delegate respondsToSelector:@selector(reciveMessage:)]){
        [self.delegate reciveMessage:message];
    }
}

- (void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload  {
    NSLog(@"%@",pongPayload);
}
//连接成功
- (void)webSocketDidOpen:(SRWebSocket *)webSocket {
    NSLog(@"连接成功");

}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error {
    if (webSocket == self.socket) {
      NSLog(@"************************** socket 连接失败************************** ");
      _socket = nil;
     //连接失败就重连
      [self reConnect];
    }
}

- (void)initHeart {
    
    heartBeat = [NSTimer timerWithTimeInterval:10 target:self selector:@selector(ping)  userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:heartBeat forMode:NSRunLoopCommonModes];
}

- (void)ping {
    
    if (self.socket.readyState == SR_OPEN)
    {
        [self.socket sendPing:nil];
    }

}

- (void)reConnect {
    [self.socket open];
}

- (void)close {
    
    [heartBeat invalidate];
    [self.socket close];
}
@end
