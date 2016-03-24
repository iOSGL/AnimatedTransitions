//
//  ModelViewController.m
//  TestKVC_CoreData
//
//  Created by geng lei on 16/3/22.
//  Copyright © 2016年 genglei. All rights reserved.
//

#import <Masonry.h>

#import "ModelViewController.h"

@interface ModelViewController ()

@property (nonatomic, strong) UIButton *backBtn;

@end

@implementation ModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:163/255.f green:49/255.f blue:57/255.f alpha:1];
    self.title = @"transitions";
    [self.view addSubview:self.backBtn];
    self.backBtn.transform = CGAffineTransformMakeRotation(M_PI_4);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews {
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.view).with.offset(-20);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
}


#pragma mark - Button Event

- (void)touchBack:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - Setter  Getter

- (UIButton *)backBtn {
    if (_backBtn == nil) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setBackgroundColor:[UIColor whiteColor]];
        [_backBtn addTarget:self action:@selector(touchBack:) forControlEvents:UIControlEventTouchUpInside];
        [_backBtn setTitle:@"+" forState:UIControlStateNormal];
        [_backBtn setTitleColor:[UIColor colorWithRed:163/255.f green:49/255.f blue:57/255.f alpha:1] forState:UIControlStateNormal];
        _backBtn.titleLabel.font = [UIFont systemFontOfSize:30];
        _backBtn.layer.cornerRadius = 30;
        _backBtn.layer.masksToBounds = YES;
        
    }
    return _backBtn;
}


@end
