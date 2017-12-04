//
//  BillsViewController.m
//  Final Project
//
//  Created by wandou on 2017/12/3.
//  Copyright © 2017年 hexuan. All rights reserved.
//

#import "BillsViewController.h"
#import "CreateBillViewController.h"
#import "EditBillViewController.h"
#import "ViewController.h"
@interface BillsViewController ()

@property (nonatomic, strong)NSString *temBillName;
@property (nonatomic, assign)NSInteger lastIndex;

@end

@implementation BillsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _lastIndex = -2;
    _billTableView.delegate = self;
    _billTableView.dataSource = self;
    [_billTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuse"];
}
- (void)updateData:(NSString *)billName{
    if (!billName) {
        return;
    }
    if (_lastIndex < -1) {
        //do nothing
    }
    else if (_lastIndex == -1){
        //create new bill
        NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:billName,@"name", nil];
        [_billArrays addObject:dic];
    }
    else{
        //update old bill
        NSDictionary *dic = [_billArrays objectAtIndex:_lastIndex];
        if ([dic objectForKey:@"data"]) {
            NSDictionary *newDic = [[NSDictionary alloc] initWithObjectsAndKeys:billName,@"name",[dic objectForKey:@"data"],@"data", nil];
            [_billArrays replaceObjectAtIndex:_lastIndex withObject:newDic];
        }
        else{
            NSDictionary *newDic = [[NSDictionary alloc] initWithObjectsAndKeys:billName,@"name", nil];
            [_billArrays replaceObjectAtIndex:_lastIndex withObject:newDic];
        }
    }
    _lastIndex = -2;
    [_billTableView reloadData];
}

- (IBAction)addBills:(id)sender {
    _lastIndex = -1;
    [self performSegueWithIdentifier:@"CreateBillViewController" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"EditBillViewController"]) {
        EditBillViewController *editBillVC = (EditBillViewController *)segue.destinationViewController;
        editBillVC.superVC = self;
        editBillVC.oldBillName = _temBillName;
    }
    else if ([segue.identifier isEqualToString:@"CreateBillViewController"]) {
        CreateBillViewController *createBillVC = (CreateBillViewController *)segue.destinationViewController;
        createBillVC.superVC = self;
    }
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
