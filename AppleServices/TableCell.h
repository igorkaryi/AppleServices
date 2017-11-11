//
//  TableCell.h
//  AppleServices
//
//  Created by Igor Karyi on 11.06.17.
//  Copyright © 2017 Igor Karyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *thumbImages;
@property (strong, nonatomic) IBOutlet UIImageView *priceImages;

@end
