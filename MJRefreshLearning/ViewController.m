//
//  ViewController.m
//  MJRefreshLearning
//
//  Created by 杨帆 on 2018/3/26.
//  Copyright © 2018年 MJRefreshLearning. All rights reserved.
//

#import "ViewController.h"

#import <MJRefresh.h>

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*
     =======================   版本1.0.3   =======================
     引申问题:
     1.MJDeprecated 过期提醒的写法
     
     修改地方:
     1.UIView+MJExtension 中的mj_width; 改为mj_w;
     2.UIScrollView+MJExtension 中的mj_contentInsetTop 改为 mj_insetT
     3.新增派生类 Gif 跟 Legend 的 header跟 footer
     4.在UIScrollView+MJRefresh中添加 header属性, 之前是用方法实现的.
     5.基类不再负责刷新状态判断,控件位置计算, 都交给header跟footer去处理
     */
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 300, 600)];
//    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    
    [self.tableView addLegendHeader];
    [self.tableView addLegendFooter];
//    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
//    [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    
    
    [self.tableView.header setRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
    [self.tableView.footer setRefreshingTarget:self refreshingAction:@selector(footerRereshing)];

    
    [self.tableView reloadData];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)headerRereshing {
    
    NSLog(@"headerRereshing");
//    [self.tableView headerEndRefreshing];
    
    [self.tableView.header endRefreshing];
}

- (void)footerRereshing {
    NSLog(@"footerRereshing");
//    [self.tableView footerEndRefreshing];
    [self.tableView.footer endRefreshing];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = @"fasd";
    return cell;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.tableView.footer beginRefreshing];
}

/*
 =======================   版本0.0.1   =======================
 引申问题:
 1.给一个对象发送消息,查找顺序是怎样的?(比如给一个对象发送消息,父类的分类方法实现了)
 2.分类使用场景有哪些?
 3.分类添加属性吗?用到了哪些技术?
 4.getter=isSelected, 作用? (BOOL类型的,可读性好)
 5.willMoveToSuperview 方法调用时机?
 6.KVO手动实现键值观察?(重写setter方法的时候,重写willChangeValueForKey跟didChangeValueForKey方法)
 7.layoutSubviews/willMoveToSuperview/drawRect 调用时机?
 8.__weak UILabel *_statusLabel;需要注意什么?
 9.autoresizingMask
 */



@end
