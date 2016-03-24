//
//  TransitionsViewController.m
//  TestKVC_CoreData
//
//  Created by geng lei on 16/3/22.
//  Copyright © 2016年 genglei. All rights reserved.
//

#import <Masonry/Masonry.h>

#import "TransitionsViewController.h"
#import "ModelViewController.h"
#import "TransitionModel.h"

@interface TransitionsViewController () <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) UIButton *modelBtn;

@property (nonatomic, strong) TransitionModel *transitionModel;

@end

@implementation TransitionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"transitions";
    [self.view addSubview:self.modelBtn];
}

- (void)viewWillLayoutSubviews {
    [self.modelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.view).with.offset(-20);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Event

- (void)touchBack:(UIButton *)sender {
    ModelViewController *control = [[ModelViewController alloc]init];
    control.transitioningDelegate = self;
    control.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:control animated:YES completion:^{
        
    }];
    
}

#pragma mark - UIViewControllerTransitioningDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    self.transitionModel.transitionMode = Present;
    self.transitionModel.startingPoint = self.modelBtn.center;
    self.transitionModel.bubbleColor = self.modelBtn.backgroundColor;
    self.transitionModel.duration = 0.5;
    return self.transitionModel;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.transitionModel.transitionMode = Dismiss;
    self.transitionModel.startingPoint = self.modelBtn.center;
    self.transitionModel.bubbleColor = self.modelBtn.backgroundColor;
    self.transitionModel.duration = 0.5;
    return self.transitionModel;
}



#pragma mark - Setter  Getter 

- (UIButton *)modelBtn {
    if (_modelBtn == nil) {
        _modelBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_modelBtn setBackgroundColor:[UIColor colorWithRed:163/255.f green:49/255.f blue:57/255.f alpha:1]];
        [_modelBtn addTarget:self action:@selector(touchBack:) forControlEvents:UIControlEventTouchUpInside];
        [_modelBtn setTitle:@"+" forState:UIControlStateNormal];
        [_modelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _modelBtn.titleLabel.font = [UIFont systemFontOfSize:30];
        _modelBtn.layer.cornerRadius = 30;
        
    }
    return _modelBtn;
}

- (TransitionModel *)transitionModel {
    if (_transitionModel == nil) {
        _transitionModel = [[TransitionModel alloc]init];
    }
    return _transitionModel;
}

@end
