//
//  DetailTableViewController.m
//  AppleServices
//
//  Created by Igor Karyi on 11.06.17.
//  Copyright © 2017 Igor Karyi. All rights reserved.
//

#import "DetViewController.h"

@interface DetViewController ()

@end

@implementation DetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titleLabel.text = _DetailModal[0];
    _imageView.image = [UIImage imageNamed:_DetailModal[1]];
    _priceImageView.image = [UIImage imageNamed:_DetailModal[2]];
    
    self.navigationItem.title = _DetailModal[0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
