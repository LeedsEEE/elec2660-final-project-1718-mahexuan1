//
//  DataDisplayTableViewController.m
//  Final Project
//
//  Created by wandou on 2017/12/3.
//  Copyright © 2017年 hexuan. All rights reserved.
//

#import "DataDisplayTableViewController.h"
#import "Cost.h"

@interface DataDisplayTableViewController ()
{
    NSMutableArray *incomeArr;
    NSMutableArray *expenseArr;
    NSMutableArray *dataArr;
}

@end

@implementation DataDisplayTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.costType setTitle:@"Expense" forState:UIControlStateNormal];
    [self.costType setTitle:@"Income" forState:UIControlStateSelected];
    [self processData];
}


//process data
- (void)processData{
    incomeArr = [NSMutableArray new];
    expenseArr = [NSMutableArray new];
    for (int i = 0; i < _billArr.count; i++) {
        Cost *temCost = _billArr[i];
        if ([temCost.type isEqualToString:@"Income"]) {
            [incomeArr addObject:temCost];
        }
        else if ([temCost.type isEqualToString:@"Expense"]){
            [expenseArr addObject:temCost];
        }
    }
    dataArr = [NSMutableArray arrayWithArray:expenseArr];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)intervalAction:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (IBAction)costTypeAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        dataArr = [NSMutableArray arrayWithArray:incomeArr];
    }
    else{
        dataArr = [NSMutableArray arrayWithArray:expenseArr];
    }
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    //Configure the cell...
    UILabel *label1 = [cell.contentView viewWithTag:1000];//item
    UILabel *label2 = [cell.contentView viewWithTag:1001];//value
    UILabel *label3 = [cell.contentView viewWithTag:1002];//date
    UILabel *label4 = [cell.contentView viewWithTag:1003];//address
    
    Cost *temCost = dataArr[indexPath.row];
    
    label1.text = [NSString stringWithFormat:@"Item:  %@",temCost.item];
    label2.text = [NSString stringWithFormat:@"Value:  %@",temCost.value];
    label3.text = [NSString stringWithFormat:@"Date:  %@",temCost.date];
    label4.text = [NSString stringWithFormat:@"Address:  %@",temCost.address];
    
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
