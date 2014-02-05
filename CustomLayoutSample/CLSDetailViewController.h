//
//  CLSDetailViewController.h
//  CustomLayoutSample
//
//  Created by mito on 2014/02/05.
//  Copyright (c) 2014年 mito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLSDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
