//
//  BillsViewController.h
//  Final Project
//
//  Created by wandou on 2017/12/3.
//  Copyright © 2017年 hexuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cost.h"

@interface BillsViewController : UIViewController

@property (nonatomic, strong)UIViewController *superVC;
@property (nonatomic, strong)NSMutableArray *billArrays;
@property (weak, nonatomic) IBOutlet UITableView *billTableView;

- (void)updateData:(NSString *)billName;

@end
