//
//  EditBillViewController.m
//  Final Project
//
//  Created by wandou on 2017/12/3.
//  Copyright © 2017年 hexuan. All rights reserved.
//

#import "EditBillViewController.h"


@interface EditBillViewController ()

@end

@implementation EditBillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _billNameTF.text = _oldBillName;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
