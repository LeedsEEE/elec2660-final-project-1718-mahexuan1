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

// update cost in each bill
- (void)updateCost:(Cost *)addCost withName:(NSString *)billName{
    NSInteger index = -1;
    NSMutableArray *temArr = nil;
    for (NSDictionary *dic in _billArrays) {
        if ([[dic objectForKey:@"name"] isEqualToString:billName]) {
            temArr = [NSMutableArray arrayWithArray:[dic objectForKey:@"data"]];
            [temArr addObject:addCost];
            index = [_billArrays indexOfObject:dic];
            break;
        }
    }
    if (index > -1) {
        NSDictionary *temDic = [[NSDictionary alloc] initWithObjectsAndKeys:billName,@"name",temArr,@"data", nil];
        [_billArrays replaceObjectAtIndex:index withObject:temDic];
    }
    [self seperateIncomeAndExpense];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
