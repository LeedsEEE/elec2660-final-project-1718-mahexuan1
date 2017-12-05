//
//  DateViewController.h
//  Final Project
//
//  Created by wandou on 2017/12/3.
//  Copyright © 2017年 hexuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateViewController : UIViewController

//connecting the elements to the view controller
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, strong)UIViewController *superVC;

@end
