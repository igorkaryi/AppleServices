//
//  ViewController.h
//  AppleServices
//
//  Created by Igor Karyi on 22.05.17.
//  Copyright © 2017 Igor Karyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController {
    MKMapView *mapview;
    int selectedIndex;
    UIButton *mapButton;
}

@property (strong, nonatomic) UIButton *mapButton;
@property (nonatomic, retain) IBOutlet MKMapView *mapview;

@property (strong, nonatomic) NSArray *Title;
@property (strong, nonatomic) NSArray *Address;
@property (strong, nonatomic) NSArray *Phone;
@property (strong, nonatomic) NSArray *Schedule;
@property (strong, nonatomic) NSArray *Site;

@property (strong, nonatomic) IBOutlet UIImageView *logoHomeImages;

- (NSMutableArray *)parseJSONCities;

- (IBAction)SetMap:(id)sender;

- (IBAction)leftBarButton:(id)sender;

//- (IBAction)buttonAppleFix:(id)sender;


@end

