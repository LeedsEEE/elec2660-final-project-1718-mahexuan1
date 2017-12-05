//
//  AddressViewController.m
//  Final Project
//
//  Created by wandou on 2017/12/3.
//  Copyright © 2017年 hexuan. All rights reserved.
//

#import "AddressViewController.h"
#import "AddCostViewController.h"
@interface AddressViewController ()

@end

@implementation AddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//user could input the address in it and the address would be shown in the page of add cost
- (IBAction)confirm:(id)sender {
    if (self.postCodeTF.text.length < 1) {
        return;
    }
    AddCostViewController *addCostVC = (AddCostViewController *)self.superVC;
    [addCostVC updateAddress:self.postCodeTF.text];
    [self.navigationController popViewControllerAnimated:YES];
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
