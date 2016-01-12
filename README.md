# customDatePicker   
简单的一个日历选择   
dateView = [[DatePickView alloc]initWithFrame:self.view.bounds];   
    __weak typeof(self)weakself = self;   
    //点击确定后的block回调   
    [dateView setBlockDate:^(NSString *dateString) {   
        [weakself.btn setTitle:dateString forState:UIControlStateNormal];   
    }];   
    [self.view addSubview:dateView];   
    想用的可以直接拿来用
