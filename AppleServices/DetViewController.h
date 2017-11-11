//
//  DetailTableViewController.h
//  AppleServices
//
//  Created by Igor Karyi on 11.06.17.
//  Copyright © 2017 Igor Karyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIImageView *priceImageView;

@property (strong, nonatomic) NSArray *DetailModal;

@end
