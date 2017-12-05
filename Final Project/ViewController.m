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
    [self separateIncomeAndExpense];
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
    [self separateIncomeAndExpense];
}

//separate income and expense
- (void)separateIncomeAndExpense{
    CGFloat expense = 0;
    CGFloat income = 0;
    for (int i = 0; i < _billArrays.count; i++) {
        NSDictionary *dic = [_billArrays objectAtIndex:i];
        NSArray *costArr = (NSArray *)[dic objectForKey:@"data"];
        for (int j = 0; j < costArr.count; j ++) {
            Cost *cost = (Cost *)[costArr objectAtIndex:j];
            if ([cost.type isEqualToString:@"Expense"] && [cost.billName isEqualToString:self.billNameLabel.text]) {
                [_expenseArrays addObject:cost];
                expense = expense + [cost.value floatValue];
            }
            else if ([cost.type isEqualToString:@"Income"] && [cost.billName isEqualToString:self.billNameLabel.text]){
                [_incomeArrays addObject:cost];
                income = income + [cost.value floatValue];
            }
        }
    }
    self.expenseLabel.text = [NSString stringWithFormat:@"%.2f",expense];
    self.incomeLabel.text = [NSString stringWithFormat:@"%.2f",income];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
