//
//  IKFullScreenViewController.m
//  iBolit
//
//  Created by Igor Karyi on 15.06.17.
//  Copyright © 2017 Igor Karyi. All rights reserved.
//

#import "IKFullScreenViewController.h"
#import "IKMapPin.h"

@interface IKFullScreenViewController ()

@end

@implementation IKFullScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *annoations;
    annoations = [self parseJSONCities];
    [self.mapviewFull addAnnotations:annoations];
    
    MKCoordinateRegion mapRegion;
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 50.4438584;
    coordinate.longitude = 30.5447224;
    mapRegion.center = coordinate;
    mapRegion.span.latitudeDelta = 0.2;
    mapRegion.span.longitudeDelta = 0.2;
    
    [mapview setRegion:mapRegion animated: YES];
}



- (NSMutableArray *)parseJSONCities{
    
    NSMutableArray *retval = [[NSMutableArray alloc]init];
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"addresscompany"
                                                         ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    NSError *error = nil;
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data
                                                    options:kNilOptions
                                                      error:&error];
    
    for (IKMapPin *record in json) {
        
        IKMapPin *temp = [[IKMapPin alloc]init];
        [temp setTitle:[record valueForKey:@"Company"]];
        [temp setSubtitle:[record valueForKey:@"Address"]];
        [temp setCoordinate:CLLocationCoordinate2DMake([[record valueForKey:@"Latitude"]floatValue], [[record valueForKey:@"Longitude"]floatValue])];
        [retval addObject:temp];
        
    }
    
    return retval;
}

- (IBAction)mapSegmented:(UISegmentedControl *)sender {
        
        switch (((UISegmentedControl *) sender).selectedSegmentIndex) {
            case 0:
                mapview.mapType =  MKMapTypeStandard;
                break;
                
            case 1:
                mapview.mapType =  MKMapTypeSatellite;
                break;
                
            case 2:
                mapview.mapType =  MKMapTypeHybrid;
                break;
                
            default:
                break;
        }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
