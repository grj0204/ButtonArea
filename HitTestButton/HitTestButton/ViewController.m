//
//  ViewController.m
//  HitTestButton
//
//  Created by joynices on 2018/7/13.
//  Copyright © 2018年 com.joynices. All rights reserved.
//

#import "ViewController.h"
#import "SubButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SubButton *subButton = [[SubButton alloc] initWithFrame:CGRectMake(200, 400, 50, 50)];
    subButton.backgroundColor = [UIColor redColor];
    subButton.titleLabel.text = @"SubButton";
    subButton.imageView.image = [UIImage imageNamed:@"6"];
    [subButton addTarget:self action:@selector(subButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *backgroundView1 = [[UIView alloc] initWithFrame:CGRectMake(185, 385, 80, 80)];
    backgroundView1.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:backgroundView1];
    [self.view addSubview:subButton];
}

- (void)subButtonClick:(UIButton *)sender {
    NSLog(@"SubButton Click");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
