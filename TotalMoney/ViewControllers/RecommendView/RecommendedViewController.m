//
//  RecommendedViewController.m
//  TotalMoney
//
//  Created by 叶慧伟 on 2016/11/30.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "RecommendedViewController.h"
#import "RecommendCell.h"
#import "HistogramCell.h"

static NSString *RecommendCellID = @"RecommendCellID";
static NSString *HistogramCellID = @"HistogramCellID";

@interface RecommendedViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *recordTabView;
@property (nonatomic, strong)NSArray *backMarginArray;
@property (nonatomic, strong)NSArray *profitArray;
@property (nonatomic, strong)NSMutableArray *resultArray;

@end

@implementation RecommendedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor cyanColor];
    self.backMarginArray = @[RGB(254, 242, 155),RGB(82, 189, 248),RGB(155, 232, 106)];
    [self setUI];
    [self initData];
    
}

- (void)initData{
    //已经排好顺序
    self.profitArray = @[@"10",@"8",@"6",@"5",@"3"];
    double sum = 0;
    for (NSString *percent in self.profitArray) {
        sum = [percent doubleValue] + sum;
    }
    NSLog(@"sum---%f",sum);
    for (int i = 0; i < self.profitArray.count; i++) {
        double width = [self.profitArray[i] doubleValue] / [self.profitArray[0] doubleValue] * (kScreenWidth - 50);
        [self.resultArray addObject:[NSString stringWithFormat:@"%f",width]];
    }
}

- (void)setUI{
    [self.view addSubview:self.recordTabView];
    [self.recordTabView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
}

#pragma mark --delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }else{
        return 5;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        RecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:RecommendCellID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backMarginColor = self.backMarginArray[indexPath.row];
        return cell;
    }else{
        HistogramCell *cell = [tableView dequeueReusableCellWithIdentifier:HistogramCellID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.profit = self.resultArray[indexPath.row];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 80;
    }else{
        return 50;
    }
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
        [_recordTabView registerClass:[HistogramCell class] forCellReuseIdentifier:HistogramCellID];
    }
    return _recordTabView;
}

- (NSMutableArray *)resultArray{
    if (_resultArray == nil) {
        _resultArray = [NSMutableArray array];
    }
    return _resultArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
