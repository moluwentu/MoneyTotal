//
//  BidListViewController.m
//  TotalMoney
//
//  Created by 叶慧伟 on 2016/12/21.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "BidListViewController.h"
#import "SortCollectionViewCell.h"

static NSString *SortCollectionViewCellID = @"SortCollectionViewCell";

@interface BidListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong)UICollectionView *sortView;
@property (nonatomic, strong)UIButton *moreBtn;
@property (nonatomic, assign)NSInteger cellCount;
@property (nonatomic, assign)bool isOpen;

@end

@implementation BidListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.cellCount = 8;
    [self setUI];
}

- (void)setUI{
    [self.view addSubview:self.sortView];
    [self.view addSubview:self.moreBtn];
    
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
    return cell;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
