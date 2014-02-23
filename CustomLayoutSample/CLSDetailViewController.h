//
//  CLSDetailViewController.h
//  CustomLayoutSample
//
//  Created by mito on 2014/02/05.
//  Copyright (c) 2014年 mito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLSDetailViewController : UIViewController
@property (weak) IBOutlet UIView *innerView;
@property (copy) NSString *number;
- (CGRect)targetRect;
@end
