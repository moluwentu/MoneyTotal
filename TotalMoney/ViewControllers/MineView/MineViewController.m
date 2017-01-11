//
//  MineViewController.m
//  TotalMoney
//
//  Created by 叶慧伟 on 2016/12/21.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "MineViewController.h"
#import "MineHeaderView.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *mainTableView;
@property (nonatomic, strong)MineHeaderView *headerView;
@property (nonatomic, assign)CGFloat headerHeight;

@end

@implementation MineViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    [super preferredStatusBarStyle];
    return UIStatusBarStyleLightContent;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
     [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.headerHeight = isIphone6P ? 260 : 230;
    [self setUI];
}

- (void)setUI{
    [self.view addSubview:self.mainTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --delegate--
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hehe" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat offsetX = (offsetY + self.headerHeight) / 2;
    if (offsetY < -self.headerHeight) {
        CGRect rect = self.headerView.frame;
        rect.origin.y = offsetY;
        rect.size.height = -offsetY;
        rect.origin.x = offsetX;
        rect.size.width = kScreenWidth + fabs(offsetX) * 2;
        self.headerView.frame = rect;
    }
}

#pragma mark --lazyload--
- (UITableView *)mainTableView{
    if (_mainTableView == nil) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        _mainTableView.contentInset = UIEdgeInsetsMake(self.headerHeight, 0, 34, 0);
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.backgroundColor = [UIColor whiteColor];
        [_mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"hehe"];
        _mainTableView.tableFooterView = [[UIView alloc]init];
        [_mainTableView addSubview:self.headerView];
    }
    return _mainTableView;
}

- (MineHeaderView *)headerView{
    if (_headerView == nil) {
        _headerView = [[MineHeaderView alloc]init];
        _headerView.frame = CGRectMake(0, -self.headerHeight, kScreenWidth, self.headerHeight);
    }
    return _headerView;
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
