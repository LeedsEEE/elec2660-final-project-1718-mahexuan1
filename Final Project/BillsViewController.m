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

@interface BillsViewController ()<UITableViewDelegate, UITableViewDataSource>

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
//connecting the addBill button to the next page
- (IBAction)addBills:(id)sender {
    _lastIndex = -1;
    [self performSegueWithIdentifier:@"CreateBillViewController" sender:nil];
}

//prepare for segue
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

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ViewController *VC = (ViewController *)self.superVC;
    NSDictionary *dic = [_billArrays objectAtIndex:indexPath.row];
    NSString *billName = [dic objectForKey:@"name"];
    [VC updateData:_billArrays withName:billName];
    [self.navigationController popViewControllerAnimated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


//edit or delete the bill name
- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *action0 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Edit" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSDictionary *dic = [_billArrays objectAtIndex:indexPath.row];
        _temBillName = [dic objectForKey:@"name"];
        _lastIndex = indexPath.row;
        [self performSegueWithIdentifier:@"EditBillViewController" sender:nil];
        tableView.editing = NO;
    }];
    UITableViewRowAction *action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"Delete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        [_billArrays removeObjectAtIndex:indexPath.row];
        [_billTableView setEditing:NO animated:NO];
        [_billTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }];
    
    return @[action1, action0];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_billArrays removeObjectAtIndex:indexPath.row];
        [_billTableView setEditing:NO animated:NO];
        [_billTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _billArrays.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse" forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary *dic = [_billArrays objectAtIndex:indexPath.row];
    NSString *billName = [dic objectForKey:@"name"];
    cell.textLabel.text = billName;
    
    return cell;
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
