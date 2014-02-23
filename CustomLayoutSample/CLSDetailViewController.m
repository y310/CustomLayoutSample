//
//  CLSDetailViewController.m
//  CustomLayoutSample
//
//  Created by mito on 2014/02/05.
//  Copyright (c) 2014年 mito. All rights reserved.
//

#import "CLSDetailViewController.h"

@interface CLSDetailViewController ()
@property (weak) IBOutlet UILabel *numberLabel;
@end

@implementation CLSDetailViewController

#pragma mark - Managing the detail item

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.numberLabel.text = self.number;
}

- (CGRect)targetRect
{
    return CGRectMake(10, 20, 300, 300);
}

@end
