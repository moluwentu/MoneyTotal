//
//  RecommendedViewController.m
//  TotalMoney
//
//  Created by 叶慧伟 on 2016/11/30.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "RecommendedViewController.h"
#import "RecommendCell.h"

static NSString *RecommendCellID = @"RecommendCellID";

@interface RecommendedViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *recordTabView;
@property (nonatomic, strong)NSArray *backMarginArray;

@end

@implementation RecommendedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor cyanColor];
    self.backMarginArray = @[[UIColor yellowColor],[UIColor cyanColor],[UIColor greenColor]];
    [self setUI];
}

- (void)setUI{
    [self.view addSubview:self.recordTabView];
    [self.recordTabView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
}

#pragma mark --delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:RecommendCellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backMarginColor = self.backMarginArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

#pragma mark --lazyload
- (UITableView *)recordTabView{
    if (_recordTabView == nil) {
        _recordTabView = [[UITableView alloc]init];
        _recordTabView.delegate = self;
        _recordTabView.dataSource = self;
        _recordTabView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _recordTabView.backgroundColor = [UIColor whiteColor];
        [_recordTabView registerClass:[RecommendCell class] forCellReuseIdentifier:RecommendCellID];
    }
    return _recordTabView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
