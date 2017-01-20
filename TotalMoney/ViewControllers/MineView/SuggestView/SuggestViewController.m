//
//  SuggestViewController.m
//  TotalMoney
//
//  Created by 叶慧伟 on 2017/1/20.
//  Copyright © 2017年 叶慧伟. All rights reserved.
//

#import "SuggestViewController.h"

static int textMaxCount = 500;

@interface SuggestViewController ()<UITextViewDelegate>

@property (nonatomic, strong)UITextView *textView;
@property (nonatomic, strong)UILabel *mostLabel;
@property (nonatomic, strong)UILabel *placeholderLabel;
@property (nonatomic, strong)UIButton *sendBtn;

@end

@implementation SuggestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"建议";
    [self setLeftNaviItemWithTitle:nil imageName:@"whiteLeftArrow"];
    [self setUI];
}

- (void)setUI{
    [self.view addSubview:self.textView];
    [self.textView addSubview:self.placeholderLabel];
    [self.textView addSubview:self.mostLabel];
    [self.view addSubview:self.sendBtn];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view).offset(12);
        make.right.equalTo(self.view).offset(-12);
        make.height.equalTo(@300);
    }];
    
    [self.placeholderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.textView).offset(6);
    }];
    
    [self.mostLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-12);
        make.top.equalTo(self.view).offset(295);
    }];
    
    [self.sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-30);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@(kScreenWidth - 60));
        make.height.equalTo(@40);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sendBtnClick{
    NSLog(@"发送");
}

#pragma mark --delegate--
- (void)textViewDidChange:(UITextView *)textView{
    [self.placeholderLabel setHidden:[self.textView hasText]];
    NSInteger len = textMaxCount - textView.text.length;
    self.mostLabel.text = [NSString stringWithFormat:@"%ld/500", (long)len];
    self.mostLabel.textColor = len > 0 ? [UIColor lightGrayColor] : [UIColor redColor];
    [self.mostLabel sizeToFit];
}

#pragma mark --lazyload--
- (UITextView *)textView{
    if (_textView == nil) {
        _textView = [[UITextView alloc]init];
        _textView.backgroundColor = RGB(241, 241, 241);
        _textView.delegate = self;
    }
    return _textView;
}

- (UILabel *)mostLabel{
    if (_mostLabel == nil) {
        _mostLabel = [UILabel labelWithFontSize:11 textColor:[UIColor darkGrayColor]];
        _mostLabel.text = @"500/500";
    }
    return _mostLabel;
}

- (UILabel *)placeholderLabel{
    if (_placeholderLabel == nil) {
        _placeholderLabel = [UILabel labelWithFontSize:13 textColor:[UIColor lightGrayColor]];
        _placeholderLabel.text = @"请输入您的建议，我们会好好改进的~";
    }
    return _placeholderLabel;
}

- (UIButton *)sendBtn{
    if (_sendBtn == nil) {
        _sendBtn = [UIButton buttonWithTitleColor:[UIColor whiteColor] titleFontSize:14 buttonColor:RGB(252, 60, 58) state:UIControlStateNormal];
        [_sendBtn setTitle:@"发送" forState:UIControlStateNormal];
        [_sendBtn addTarget:self action:@selector(sendBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendBtn;
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
