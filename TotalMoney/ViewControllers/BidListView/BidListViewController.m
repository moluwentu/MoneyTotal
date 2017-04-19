//
//  BidListViewController.m
//  TotalMoney
//
//  Created by 叶慧伟 on 2016/12/21.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "BidListViewController.h"
#import "SortCollectionViewCell.h"
#import "ListTableViewCell.h"
#import "AsyncRequestHandles.h"
#import "CompanyModel.h"
#import "CompanyDetailModel.h"

static NSString *const SortCollectionViewCellID = @"SortCollectionViewCell";
static NSString *const ListTableViewCellID = @"ListTableViewCellID";

@interface BidListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UICollectionView *sortView;
@property (nonatomic, strong)UITableView *listView;
@property (nonatomic, strong)UIButton *moreBtn;
@property (nonatomic, assign)NSInteger cellCount;
@property (nonatomic, assign)bool isOpen;
@property (nonatomic, strong)CompanyModel *company;

@end

@implementation BidListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.cellCount = 8;
    [self setUI];
    [self loadData];
}

- (void)loadData{
    [AsyncRequestHandles getCompanyWithParamters:nil groupId:nil identifier:@"comlist" callBlock:^(ResponseUtil *response) {
        self.company = response.responseResult;
        NSLog(@"%@",response.responseJson);
        [self.sortView reloadData];
    }];
}

- (void)setUI{
    [self.view addSubview:self.sortView];
    [self.view addSubview:self.moreBtn];
    [self.view addSubview:self.listView];
    
    [self.sortView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.equalTo(@(kScreenWidth / 2));
    }];
    
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-1);
        make.top.equalTo(self.sortView.mas_bottom);
        make.height.equalTo(@20);
        make.width.equalTo(@40);
    }];
    
    [self.listView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.moreBtn.mas_bottom);
        make.bottom.equalTo(self.view);
    }];
}

- (void)moreBtnClick{
    self.isOpen = !self.isOpen;
    
    [self.sortView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        self.isOpen ? make.height.equalTo(@(kScreenWidth / 4 * 3)) : make.height.equalTo(@(kScreenWidth / 4 * 2));
    }];
    
    [UIView animateWithDuration:0.5 animations:^{
         [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        if (!self.isOpen) {
            [self reloadSortView];
        }
    }];
    if (self.isOpen) {
        [self reloadSortView];
    }
   
}

- (void)reloadSortView{
    self.cellCount = self.isOpen ? 12 : 8;
    [self.sortView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --delegate--

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.cellCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SortCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SortCollectionViewCellID forIndexPath:indexPath];
    CompanyDetailModel *comDetail = self.company.result[indexPath.item];
    cell.iconStr = comDetail.icon;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ListTableViewCellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.backgroundColor = [UIColor cyanColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

#pragma mark --lazyload--
- (UICollectionView *)sortView{
    if (_sortView == nil) {
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc]init];
        flowlayout.itemSize = CGSizeMake(kScreenWidth / 4, kScreenWidth / 4);
        flowlayout.minimumLineSpacing = 0;
        flowlayout.minimumInteritemSpacing = 0;
        _sortView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowlayout];
        _sortView.delegate = self;
        _sortView.dataSource = self;
        [_sortView registerClass:[SortCollectionViewCell class] forCellWithReuseIdentifier:SortCollectionViewCellID];
    }
    return _sortView;
}

- (UIButton *)moreBtn{
    if (_moreBtn == nil) {
        _moreBtn = [[UIButton alloc]init];
        [_moreBtn setTitle:@"更多" forState:UIControlStateNormal];
        [_moreBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _moreBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _moreBtn.layer.borderWidth = 1;
        _moreBtn.layer.borderColor = [UIColor redColor].CGColor;
        [_moreBtn addTarget:self action:@selector(moreBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreBtn;
}

- (UITableView *)listView{
    if (_listView == nil) {
        _listView = [[UITableView alloc]init];
        _listView.delegate = self;
        _listView.dataSource = self;
//        _listView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _listView.backgroundColor = [UIColor whiteColor];
        [_listView registerClass:[ListTableViewCell class] forCellReuseIdentifier:ListTableViewCellID];
    }
    return _listView;
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
