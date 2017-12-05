//
//  AddressViewController.h
//  Final Project
//
//  Created by wandou on 2017/12/3.
//  Copyright © 2017年 hexuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressViewController : UIViewController

// connecting the elements to the view controller
@property (nonatomic, strong)UIViewController *superVC;
@property (weak, nonatomic) IBOutlet UITextField *postCodeTF;

@end
