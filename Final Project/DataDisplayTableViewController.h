//
//  DataDisplayTableViewController.h
//  Final Project
//
//  Created by wandou on 2017/12/3.
//  Copyright © 2017年 hexuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataDisplayTableViewController : UITableViewController

//connecting the element to the view controller
@property (weak, nonatomic) IBOutlet UIButton *costType;//income expense
@property (weak, nonatomic) IBOutlet UIBarButtonItem *intervalType;//month year
@property (weak, nonatomic) IBOutlet UIButton *intervalBtn;
@property (nonatomic, strong)NSMutableArray *billArr;
@property (nonatomic, strong)UIViewController *superVC;

@end
