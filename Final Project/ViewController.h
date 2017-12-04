//
//  ViewController.h
//  Final Project
//
//  Created by wandou on 2017/11/22.
//  Copyright © 2017年 hexuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cost.h"

@interface ViewController : UIViewController

@property (nonatomic, strong)NSMutableArray *billArrays;
@property (nonatomic, strong)NSMutableArray *incomeArrays;
@property (nonatomic, strong)NSMutableArray *expenseArrays;
@property (weak, nonatomic) IBOutlet UILabel *billNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *expenseLabel;
@property (weak, nonatomic) IBOutlet UILabel *incomeLabel;

- (void)updateData:(NSArray *)arr withName:(NSString *)billName;

- (void)updateCost:(Cost *)addCost withName:(NSString *)billName;

@end
