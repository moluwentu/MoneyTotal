//
//  MoreViewController.m
//  TotalMoney
//
//  Created by 叶慧伟 on 2017/1/22.
//  Copyright © 2017年 叶慧伟. All rights reserved.
//

#import "MoreViewController.h"
#import "MoreTableViewCell.h"

static NSString *const MoreTableViewCellID = @"MoreTableViewCellID";

@interface MoreViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *mainTableView;
@property (nonatomic, strong)NSArray *titleArray;
@property (nonatomic, strong)NSArray *imageArray;

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUI];
    self.titleArray = @[@"推荐给朋友",@"给我们评分"];
    self.imageArray = @[@"flower",@"gear"];
}

- (void)setUI{
    self.title = @"更多";
    self.view.backgroundColor = RGB(244, 244, 244);
    [self setLeftNaviItemWithTitle:nil imageName:@"whiteLeftArrow"];
    [self.view addSubview:self.mainTableView];
    
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(8);
        make.left.right.bottom.equalTo(self.view);
    }];
}

#pragma mark --delegate--
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MoreTableViewCellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.titleStr = self.titleArray[indexPath.row];
    cell.iconStr = self.imageArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

#pragma mark --lazyload--
- (UITableView *)mainTableView{
    if (_mainTableView == nil) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        //        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.backgroundColor = [UIColor whiteColor];
        [_mainTableView registerClass:[MoreTableViewCell class] forCellReuseIdentifier:MoreTableViewCellID];
        _mainTableView.tableFooterView = [[UIView alloc]init];
    }
    return _mainTableView;
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
