//
//  DateViewController.m
//  Final Project
//
//  Created by wandou on 2017/12/3.
//  Copyright © 2017年 hexuan. All rights reserved.
//

#import "DateViewController.h"
#import "AddCostViewController.h"


@interface DateViewController ()

@end

@implementation DateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
// connecting the picker view and the date that the user choosed could be shown in the page of add cost
- (IBAction)confirm:(id)sender {
    AddCostViewController *addCostVC = (AddCostViewController *)self.superVC;
    NSDateFormatter *fomatter = [[NSDateFormatter alloc] init];
    NSTimeZone *localTimeZone = [NSTimeZone localTimeZone];
    [fomatter setTimeZone:localTimeZone];
    [fomatter setDateFormat:@"yyyy-MM-dd"];
    NSString *currentDateString = [fomatter stringFromDate:self.datePicker.date];
    [addCostVC updateDate:currentDateString];
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
