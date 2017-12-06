//
//  AddCostViewController.m
//  Final Project
//
//  Created by wandou on 2017/12/3.
//  Copyright © 2017年 hexuan. All rights reserved.
//

#import "AddCostViewController.h"
#import "DateViewController.h"
#import "AddressViewController.h"
#import "ViewController.h"
#import "Cost.h"

@interface AddCostViewController ()

@end

@implementation AddCostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.titleBtn setTitle:@"Expense" forState:UIControlStateNormal];
    [self.titleBtn setTitle:@"Income" forState:UIControlStateSelected];
}

//update date
- (void)updateDate:(NSString *)date{
    [self.dateBtn setTitle:date forState:UIControlStateNormal];
}


//update address
- (void)updateAddress:(NSString *)address{
    [self.addressBtn setTitle:address forState:UIControlStateNormal];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.itemTF resignFirstResponder];
    [self.valueTF resignFirstResponder];
}

- (IBAction)titleBtnAction:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (IBAction)confirm:(id)sender {
    Cost *temCost = [Cost new];
    temCost.item = self.itemTF.text;
    temCost.value = self.valueTF.text;
    temCost.date = self.dateBtn.titleLabel.text;
    temCost.address = self.addressBtn.titleLabel.text;
    temCost.type = self.titleBtn.titleLabel.text;
    temCost.billName = self.billName;
    if (!temCost.item||!temCost.value||!temCost.date||!temCost.address||!temCost.type) {
        return;
    }
    ViewController *VC = (ViewController *)self.superVC;
    [VC updateCost:temCost withName:_billName];
    [self.navigationController popViewControllerAnimated:YES];
}

//prepare for segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"DateViewController"]) {
        DateViewController *dateVC = (DateViewController *)segue.destinationViewController;
        dateVC.superVC = self;
    }
    else if ([segue.identifier isEqualToString:@"AddressViewController"]) {
        AddressViewController *addressVC = (AddressViewController *)segue.destinationViewController;
        addressVC.superVC = self;
    }
}

//connecting to the page of choose date
- (IBAction)selectDate:(id)sender {
    [self performSegueWithIdentifier:@"DateViewController" sender:nil];
}

//connecting to the page of input the address
- (IBAction)selectAddress:(id)sender {
    [self performSegueWithIdentifier:@"AddressViewController" sender:nil];
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
