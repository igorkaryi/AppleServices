//
//  LeftViewController.m
//  AppleServices
//
//  Created by Igor Karyi on 22.05.17.
//  Copyright © 2017 Igor Karyi. All rights reserved.
//

#import "LeftViewController.h"
#import "TableCell.h"
#import "DetViewController.h"

@interface LeftViewController ()

@property (strong, nonatomic) NSArray *imagesArray;
@property (strong, nonatomic) NSArray *titleArray;
@property (strong, nonatomic) NSArray *priceImagesArray;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _imagesArray = @[@"iphone7plus.png", @"iphone7.png", @"iphonese.png", @"iphone6splus.png", @"iphone6s.png", @"iphone6plus.png", @"iphone6.png", @"iphone5s.png", @"iphone5c.png", @"iphone5.png", @"iphone4s.png", @"iphone4.png", @"iphone3.png"];
    
    _titleArray = @[@"iPhone 7 Plus", @"iPhone 7", @"iPhone SE", @"iPhone 6s Plus", @"iPhone 6s", @"iPhone 6 Plus", @"iPhone 6", @"iPhone 5s", @"iPhone 5c", @"iPhone 5", @"iPhone 4s", @"iPhone 4", @"iPhone 3GS"];
    
    _priceImagesArray = @[@"price-iphone-7-plus.png", @"price-iphone-7.png", @"price-iphone-se.png", @"price-iphone-6-s-plus.png", @"price-iphone-6-s.png", @"price-iphone-6-plus.png", @"price-iphone-6.png", @"price-iphone-5s.png", @"price-iphone-5-c.png", @"price-iphone-5.png", @"price-iphone-4-s.png", @"price-iphone-4.png", @"price-iphone-3.png"];
    
    }

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    
    TableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSInteger row = [indexPath row];
    cell.titleLabel.text = _titleArray[row];
    cell.thumbImages.image = [UIImage imageNamed:_imagesArray[row]];
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"ShowDetails"]) {
        
        DetViewController *detailviewcontroller = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        NSInteger row = [myIndexPath row];
    detailviewcontroller.DetailModal = @[_titleArray[row], _imagesArray[row], _priceImagesArray[row]];
         
    }
    }



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
