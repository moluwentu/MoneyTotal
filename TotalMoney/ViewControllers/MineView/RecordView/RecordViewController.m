//
//  RecordViewController.m
//  TotalMoney
//
//  Created by 叶慧伟 on 2017/1/22.
//  Copyright © 2017年 叶慧伟. All rights reserved.
//

#import "RecordViewController.h"
#import "XTCirView.h"
#import "RecordTableViewCell.h"

#define recordviewcellID @"recordviewcellID"

@interface RecordViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)NSArray *cirArray;
@property (nonatomic, strong)NSArray *colorArray;
@property (nonatomic, strong)UITableView *recordTableView;

@end

@implementation RecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.cirArray = @[@"3000",@"1200",@"300"];
    self.colorArray = @[RGB(53, 157, 235),RGB(254, 212, 76),RGB(57, 211, 193)];
    [self setUI];
}

- (void)setUI{
    self.title = @"投资记录";
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setLeftNaviItemWithTitle:nil imageName:@"whiteLeftArrow"];
    
    XTCirView *cirView = [[XTCirView alloc]initWithCenter:CGPointMake(kScreenWidth * 1 / 3, 100) radius:50 colorArray:self.colorArray AngleArray:self.cirArray cirStyle:XTCirEmptyStyle isAnimation:YES];
    [self.view addSubview:cirView];
    [self.view addSubview:self.recordTableView];
    
    CGFloat margin = 18;
    CGFloat imageheight = 15;
    CGFloat imageWidth = 13;
    NSArray *imageArray = @[@"icon_锁定资产",@"icon_在投资产",@"icon.可用余额"];
    NSArray *titleArray = @[@"累计投资:3000元",@"预计收益:1200元",@"目前收益:300元"];
    
    for (int i = 0; i < 3; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth * 2 / 3 - 20, 60 + i * (imageheight + margin), imageWidth, imageheight)];
        [imageView setImage:[UIImage imageNamed:imageArray[i]]];
        [self.view addSubview:imageView];
        
        UILabel *label = [UILabel labelWithFontSize:10 textColor:[UIColor darkGrayColor]];
        label.text = titleArray[i];
        [label setFrame:CGRectMake(kScreenWidth * 2 / 3 + 2, 60 + i * (imageheight + margin), kScreenWidth, imageheight)];
        [self.view addSubview:label];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:recordviewcellID forIndexPath:indexPath];
    return cell;
}

#pragma mark --lazyload--
- (UITableView *)recordTableView{
    if (_recordTableView == nil) {
        _recordTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kScreenWidth * 1 / 3 + 100, kScreenWidth, kScreenHeight - (kScreenWidth * 1 / 3 + 100)) style:UITableViewStylePlain];
        _recordTableView.dataSource = self;
        _recordTableView.delegate = self;
        [_recordTableView registerClass:[RecordTableViewCell class] forCellReuseIdentifier:recordviewcellID];
    }
    return _recordTableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
