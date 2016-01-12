//
//  ViewController.m
//  customDatePicker
//
//  Created by dongjiangpeng on 16/1/12.
//  Copyright © 2016年 dongjiangpeng. All rights reserved.
//

#import "ViewController.h"
#import "DatePickView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController
{
    DatePickView *dateView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)click:(UIButton *)sender {
    dateView = [[DatePickView alloc]initWithFrame:self.view.bounds];
    __weak typeof(self)weakself = self;
    //点击确定后的block回调
    [dateView setBlockDate:^(NSString *dateString) {
        [weakself.btn setTitle:dateString forState:UIControlStateNormal];
    }];
    [self.view addSubview:dateView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
