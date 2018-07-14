//
//  ViewController.m
//  HitTestButton
//
//  Created by joynices on 2018/7/13.
//  Copyright © 2018年 com.joynices. All rights reserved.
//

#import "ViewController.h"
#import "SubButton.h"
#import "TargetButton.h"
#import "DelegateButton.h"
#import "BlockButton.h"

@interface ViewController ()<DelelegateButtonDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //扩大点击范围
    SubButton *subButton = [[SubButton alloc] initWithFrame:CGRectMake(200, 400, 50, 50)];
    subButton.backgroundColor = [UIColor redColor];
    subButton.titleLabel.text = @"SubButton";
    subButton.imageView.image = [UIImage imageNamed:@"6"];
    [subButton addTarget:self action:@selector(subButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *backgroundView1 = [[UIView alloc] initWithFrame:CGRectMake(185, 385, 80, 80)];
    backgroundView1.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:backgroundView1];
    [self.view addSubview:subButton];
    
    //target 回调实现点击
    TargetButton *targetButton = [[TargetButton alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    targetButton.backgroundColor = [UIColor blueColor];
    [targetButton addTarget:self action:@selector(subButtonClick:)];
    
    [self.view addSubview:targetButton];
    
    //delegate 回调实现点击
    DelegateButton *delegateButton = [[DelegateButton alloc] initWithFrame:CGRectMake(50, 150, 50, 50)];
    delegateButton.delegate = self;
    delegateButton.backgroundColor = [UIColor purpleColor];
    
    [self.view addSubview:delegateButton];
    
    //block 回调实现点击
    BlockButton *blockButton = [[BlockButton alloc] initWithFrame:CGRectMake(50, 250, 50, 50)];
    blockButton.backgroundColor = [UIColor yellowColor];
    [blockButton setButtonShouldBlock:^BOOL(BlockButton *sender) {
        NSLog(@"should Block");
        return YES;
    }];
    [blockButton setButtonWillBlock:^(BlockButton *sender) {
        NSLog(@"will Block");
    }];
    [blockButton setButtonDidBlock:^(BlockButton *sender) {
        NSLog(@"Block Click");
    }];
    
    [self.view addSubview:blockButton];
    
}

- (void)subButtonClick:(UIButton *)sender {
    NSLog(@"SubButton Click");
}

- (BOOL)delegateButtonShouldTap:(DelegateButton *)sender {
    NSLog(@"%s",__FUNCTION__);
    return YES;
}

- (void)delegateButtonWillTap:(DelegateButton *)sender {
    NSLog(@"%s",__FUNCTION__);
}

- (void)delegateButtonDidTap:(DelegateButton *)sender {
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"Delegate Click");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
