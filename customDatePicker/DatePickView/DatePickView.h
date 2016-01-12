//
//  DatePickView.h
//  customDatePicker
//
//  Created by dongjiangpeng on 16/1/12.
//  Copyright © 2016年 dongjiangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickView : UIView
@property (nonatomic,copy)void(^blockDate)(NSString *dateString);
@end
