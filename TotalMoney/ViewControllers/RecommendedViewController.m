//
//  RecommendedViewController.m
//  TotalMoney
//
//  Created by 叶慧伟 on 2016/11/30.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "RecommendedViewController.h"

@interface RecommendedViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *recordTabView;

@end

@implementation RecommendedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    [self setUI];
}

- (void)setUI{
    [self.view addSubview:self.recordTabView];
    [self.recordTabView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.equalTo(@300);
    }];
}

#pragma mark --delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hehe" forIndexPath:indexPath];
    return cell;
}

#pragma mark --lazyload
- (UITableView *)recordTabView{
    if (_recordTabView == nil) {
        _recordTabView = [[UITableView alloc]init];
        _recordTabView.delegate = self;
        _recordTabView.dataSource = self;
        _recordTabView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _recordTabView.backgroundColor = [UIColor whiteColor];
        [_recordTabView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"hehe"];
    }
    return _recordTabView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
