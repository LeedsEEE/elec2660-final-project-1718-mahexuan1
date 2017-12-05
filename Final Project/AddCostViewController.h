//
//  AddCostViewController.h
//  Final Project
//
//  Created by wandou on 2017/12/3.
//  Copyright © 2017年 hexuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddCostViewController : UIViewController


//Connecting the elements to the view controller
@property (weak, nonatomic) IBOutlet UIButton *titleBtn;
@property (nonatomic, strong)UIViewController *superVC;
@property (weak, nonatomic) IBOutlet UIButton *dateBtn;
@property (weak, nonatomic) IBOutlet UIButton *addressBtn;
@property (weak, nonatomic) IBOutlet UITextField *itemTF;
@property (weak, nonatomic) IBOutlet UITextField *valueTF;
@property (nonatomic, strong)NSString *billName;

- (void)updateDate:(NSString *)date;

- (void)updateAddress:(NSString *)address;

@end
