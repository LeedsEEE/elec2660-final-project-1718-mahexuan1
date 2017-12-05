//
//  ViewController.m
//  Final Project
//
//  Created by wandou on 2017/11/22.
//  Copyright © 2017年 hexuan. All rights reserved.
//

#import "ViewController.h"
#import "BillsViewController.h"
#import "Cost.h"
#import "AddCostViewController.h"
#import "MyAccountViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _billArrays = [NSMutableArray new];
    _incomeArrays = [NSMutableArray new];
    _expenseArrays = [NSMutableArray new];
    NSDictionary *defaultDic = [[NSDictionary alloc] initWithObjectsAndKeys:@"Default",@"name", nil];
    [_billArrays addObject:defaultDic];
}
//update data
- (void)updateData:(NSArray *)arr withName:(NSString *)billName{
    self.billNameLabel.text = billName;
    if (arr) {
        _billArrays = [NSMutableArray arrayWithArray:arr];
    }
    [self seperateIncomeAndExpense];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
