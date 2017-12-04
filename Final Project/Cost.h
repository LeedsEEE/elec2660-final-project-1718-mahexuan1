//
//  Cost.h
//  Final Project
//
//  Created by wandou on 2017/12/3.
//  Copyright © 2017年 hexuan. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface Cost : NSData

@property (nonatomic, strong)NSString *item;
@property (nonatomic, strong)NSString *value;
@property (nonatomic, strong)NSString *date;
@property (nonatomic, strong)NSString *address;
@property (nonatomic, strong)NSString *billName;
@property (nonatomic, strong)NSString *type;//income or expense

@end
