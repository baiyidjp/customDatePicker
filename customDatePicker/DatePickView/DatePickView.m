//
//  DatePickView.m
//  customDatePicker
//
//  Created by dongjiangpeng on 16/1/12.
//  Copyright © 2016年 dongjiangpeng. All rights reserved.
//

#import "DatePickView.h"
#define KMARGIN 10
#define COLOR1 [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0]
#define COLOR2 [UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:1.0]
#define COLOR3 [UIColor colorWithRed:37/255.0 green:152/255.0 blue:249/255.0 alpha:1.0]
@implementation DatePickView
{
    UIDatePicker *datePicker;
    UIView *backView;
    UIView *toolView;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        [self creatDateView];
    }
    return self;
}
- (void)creatDateView{
    CGFloat viewW = self.frame.size.width-2*KMARGIN;
    backView = [[UIView alloc]initWithFrame:self.bounds];
    backView.backgroundColor = [UIColor blackColor];
    backView.alpha = 0.5;
    [self addSubview:backView];
    datePicker = [[UIDatePicker alloc] init];
    [datePicker setBackgroundColor:COLOR1];
    datePicker.layer.cornerRadius = 5;
    datePicker.layer.masksToBounds = YES;
    datePicker.alpha = 1.0;
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    [datePicker setDate:[NSDate date] animated:YES];
    [datePicker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    [datePicker setFrame:CGRectMake(KMARGIN, (self.frame.size.height)/2-(self.frame.size.width)/4, viewW, (self.frame.size.width)/2)];
    [self addSubview:datePicker];
    toolView = [[UIView alloc]initWithFrame:CGRectMake(KMARGIN, CGRectGetMinY(datePicker.frame)-44, viewW, 52)];
    toolView.backgroundColor = COLOR1;
    toolView.layer.cornerRadius = 5;
    toolView.layer.masksToBounds = YES;
    [self addSubview:toolView];
    UIButton *cancleBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, viewW/2, 44)];
    UIButton *doneBtn = [[UIButton alloc]initWithFrame:CGRectMake(viewW/2, 0, viewW/2, 44)];
    [cancleBtn addTarget:self action:@selector(datePickCanceled) forControlEvents:UIControlEventTouchUpInside];
    [doneBtn addTarget:self action:@selector(datePickDone) forControlEvents:UIControlEventTouchUpInside];
    [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    [doneBtn setTitle:@"确定" forState:UIControlStateNormal];
    [cancleBtn setBackgroundColor:COLOR1];
    [doneBtn setBackgroundColor:COLOR1];
    [cancleBtn setTitleColor:COLOR3 forState:UIControlStateNormal];
    [doneBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [toolView addSubview:cancleBtn];
    [toolView addSubview:doneBtn];
    UIView *lineViewH = [[UIView alloc]initWithFrame:CGRectMake(viewW/2, 3, 0.5, 38)];
    lineViewH.backgroundColor = COLOR2;
    [toolView addSubview:lineViewH];
    UIView *lineViewW = [[UIView alloc]initWithFrame:CGRectMake(0, 44, viewW, 0.5)];
    lineViewW.backgroundColor = COLOR2;
    [toolView addSubview:lineViewW];
}
//取消选择日期
-(void)datePickCanceled
{
    [self removeFromSuperview];
}
//确定选择日期
-(void)datePickDone
{
    [self removeFromSuperview];
    NSString *dateStr  = [NSString stringWithFormat:@"%@",datePicker.date];
    NSString *birthday = [[dateStr componentsSeparatedByString:@" "] firstObject];
    if (self.blockDate) {
        self.blockDate(birthday);
    }
}

@end
