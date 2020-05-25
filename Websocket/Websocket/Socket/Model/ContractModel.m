//
//  ContractModel.m
//  Websocket
//
//  Created by asd on 2020/5/19.
//  Copyright © 2020 cxy. All rights reserved.
//

#import "ContractModel.h"

@implementation ContractModel
static CGFloat cellTopmargin    = 10;
static CGFloat cellBottommargin = 10;
static NSInteger  font          = 14;
static CGFloat cellXMargin      = 50;

- (CGFloat)cellHeight {
    CGFloat width = [UIApplication sharedApplication].windows.lastObject.frame.size.width;
    CGRect fontRect = [self.textStr boundingRectWithSize:CGSizeMake(width - cellXMargin, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:font] forKey:NSFontAttributeName] context:nil];
    return fontRect.size.height + cellBottommargin + cellTopmargin;
}
@end
