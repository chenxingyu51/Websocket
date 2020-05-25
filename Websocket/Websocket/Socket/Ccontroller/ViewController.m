//
//  ViewController.m
//  Websocket
//
//  Created by asd on 2020/5/15.
//  Copyright © 2020 cxy. All rights reserved.
//

#import "ViewController.h"
#import "IMManager.h"
#import "ContractModel.h"
#import "IMTextTableViewCell.h"
#import <Masonry.h>


#define MQSCREENWIDH   [UIApplication sharedApplication].windows.lastObject.bounds.size.width
#define MQSCREENHEIGHT [UIApplication sharedApplication].windows.lastObject.bounds.size.height
#define NAVIHEIGHT    self.naviView.frame.size.height

#define CURRENTDATE   [NSString stringWithFormat:@"%@",[NSDate date]]

#define WEATHERTYPE  0  //0外网 https 8080  1.外网8080
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,IMManagerDelegate>

@property (nonatomic , strong)IMManager *manager;
@property (nonatomic , strong)NSMutableArray *arrays;
@property (nonatomic , strong)UITableView *tableview;

@end

@implementation ViewController

- (IMManager *)manager {
    if (!_manager){
        _manager = [[IMManager alloc]init];
        _manager.delegate = self;
    }
    return _manager;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //开启场链接
    [self manager];
    [self addtableview];
    // Do any additional setup after loading the view.
}


- (void)addtableview {
    
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableview];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrays.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellid = @"cellid";
    IMTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[IMTextTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    if (self.arrays.count >0){
        cell.cmodel = self.arrays[indexPath.row];
    }
    return cell;

}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc]init];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc]init];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_manager close];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContractModel *model  = self.arrays[indexPath.row];
    CGFloat height = model.cellHeight;
    return height;
}

- (void)reciveMessage:(NSString *)message {
    ContractModel *model = [[ContractModel alloc]init];
    model.textStr = message;
    model.isMine  = NO;
    [self.arrays addObject:model];
//    [self.tableview reloadData];
}

- (NSMutableArray *)arrays {
    if (!_arrays){
        _arrays = [[NSMutableArray alloc]init];
    }
    return _arrays;
}

- (void)keyboardWillChangeFrame:(NSNotification *)notification{
    //取出键盘动画的时间(根据userInfo的key----UIKeyboardAnimationDurationUserInfoKey)
    
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    //取得键盘最后的frame(根据userInfo的key----UIKeyboardFrameEndUserInfoKey = "NSRect: {{0, 227}, {320, 253}}";)
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    //计算控制器的view需要平移的距离
    CGFloat transformY = keyboardFrame.origin.y - self.view.frame.size.height;
    
    //执行动画
//    [UIView animateWithDuration:duration animations:^{
    //        [self scrollTableToFoot:YES];
    CGFloat height = self.tableview.contentSize.height;
    

}

#pragma mark --键盘收回
- (void)keyboardDidHide:(NSNotification *)notification{
   CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
 

}
@end
