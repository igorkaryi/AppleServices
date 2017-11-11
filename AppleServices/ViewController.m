//
//  ViewController.m
//  AppleServices
//
//  Created by Igor Karyi on 22.05.17.
//  Copyright © 2017 Igor Karyi. All rights reserved.
//

#import "ViewController.h"
#import "MMDrawerController.h"
#import "AppDelegate.h"
#import "IKMapPin.h"
#import "CompanysCell.h"
#import "IKCompanyDetailViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *servicesArray;
@property (strong, nonatomic) NSArray *addressesCompanys;
@property (strong, nonatomic) NSArray *phonesNumbers;
@property (strong, nonatomic) NSArray *domainCompany;

@property (strong, nonatomic) NSArray *logoHomeImagesArray;

@end

@implementation ViewController

@synthesize mapview, mapButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *annoations;
    annoations = [self parseJSONCities];
    [self.mapview addAnnotations:annoations];
    
    MKCoordinateRegion mapRegion;
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 50.4438584;
    coordinate.longitude = 30.5447224;
    mapRegion.center = coordinate;
    mapRegion.span.latitudeDelta = 0.07;
    mapRegion.span.longitudeDelta = 0.07;
    
    [mapview setRegion:mapRegion animated: YES];
    
    _Title = @[@"iFix",                                 //1 -
               @"FIX4U",                                //2 -
               @"Service - iPhone",                     //3 -
               @"UiPservice",                           //4 -
               @"UiPservice",                           //5 -
               @"iRepService",                          //6 -
               @"Quickfix",                             //7 +
               @"iFix",                                 //8 -
               @"Royal-Service",                        //9 -
               @"GadgetService",                        //10 -
               @"AppleFix",                             //11 -
               @"Re:Store",                             //12 -
               @"Taxophone",                            //13 -
               @"А-сервис",                             //14 -
               @"YouMix",                               //15 -
               @"iMobi",                                //16 -
               @"iFix",                                 //17 -
               @"AppleKiev",                            //18 -
               @"Guten Service",                        //19 -
               @"Iservice",                             //20 -
               @"iPhonechik",                           //21 -
               @"iFix",                                 //22 -
               @"AppleDoc",                             //23 -
               @"Applefix"                              //24 -
               ];
    
    _Address = @[@"улица Богдана Хмельницкого, 27/1",   //1 -
                 @"улица Крещатик, 14",                 //2 -
                 @"улица Большая Васильковская, 74",    //3 -
                 @"улица Ивана Мазепы, 12",             //4 -
                 @"улица Михайловская, 14",             //5 -
                 @"бульвар Марии Приймаченко, 3",       //6 -
                 @"Выездной ремонт",                    //7 +
                 @"проспект Петра Григоренка, 28",      //8 -
                 @"улица Пирогова, 5",                  //9 -
                 @"улица Кутузова, 4",                  //10 -
                 @"улица Ивана Мазепы, 3",              //11 -
                 @"улица Прорезная, 8",                 //12 -
                 @"улица Тарасовская, 38",              //13 -
                 @"улица Киквидзе, 3",                  //14 -
                 @"улица Козацкая, 122",                //15 -
                 @"улица Политехническая, 31Б",         //16 -
                 @"улица Маршала Тимошенка, 21",        //17 -
                 @"улица Бассейная 21Б",                //18 -
                 @"бульвар Леси Украинки, 30",          //19 -
                 @"улица Басейна, 3А",                  //20 -
                 @"улица Нижний Вал, 23В",              //21 -
                 @"улица Большая Васильковская, 66",    //22 -
                 @"улица Григория Сковороды, 5А",       //23 -
                 @"улица Никольсько-Слободская, 2В"     //24 -
                 ];
    
    _Phone = @[@"044-222-53-88",                        //1 -
               @"063-888-88-08",                        //2 -
               @"067-776-86-10",                        //3 -
               @"044-222-88-12",                        //4 -
               @"044-222-77-12",                        //5 -
               @"044-353-35-55",                        //6 -
               @"095-056-94-82",                        //7 +
               @"044-337-03-66",                        //8 -
               @"067-684-73-37",                        //9 -
               @"044-360-93-18",                        //10 -
               @"063-723-77-23",                        //11 -
               @"093-170-05-04",                        //12 -
               @"044-361-32-29",                        //13 -
               @"044-585-77-01",                        //14 -
               @"099-199-91-88",                        //15 -
               @"063-027-55-27",                        //16 -
               @"044-223-30-66",                        //17 -
               @"096-955-01-01",                        //18 -
               @"044-360-85-36",                        //19 -
               @"044-353-67-75",                        //20 -
               @"096-056-86-03",                        //21 -
               @"044-227-26-77",                        //22 -
               @"044-332-33-63",                        //23 -
               @"044-384-33-04"                         //24 -
               ];
    
    _Site = @[@"i-fix.ua",                              //1 -
              @"fix4u.com.ua",                          //2 -
              @"service-iphone.com.ua",                 //3 -
              @"uipservice.com",                        //4 -
              @"uipservice.com",                        //5 -
              @"irepservice.com",                       //6 -
              @"quickfix.com.ua",                       //7 +
              @"ifix.com.ua",                           //8 -
              @"royal-service.com.ua",                  //9 -
              @"iloveservice.com.ua",                   //10 -
              @"applefix.ua",                           //11 -
              @"restore.com.ua",                        //12 -
              @"taxophone.ua",                          //13 -
              @"a-service.ua",                          //14 -
              @"youmix.com.ua",                         //15 -
              @"imobi.com.ua",                          //16 -
              @"i-fix.ua",                              //17 -
              @"applekiev.com.ua",                      //18 -
              @"gutenservice.ua",                       //19 -
              @"iservice.org.ua",                       //20 -
              @"iphonechik.kiev.ua",                    //21 -
              @"i-fix.ua",                              //22 -
              @"appledoc.com.ua",                       //23 -
              @"applefix.ua"                            //24 -
              ];

    
    _Schedule = @[@"ПН - Пт 09–20, СБ 10–17, ВС 11–17", //1 +
                  @"ПН - ВС 10-21",                     //2 +
                  @"ПН - Пт 10–19, СБ 11–17, ВС Закрыто",//3 +
                  @"ПН - ПТ 10-20, СБ-ВС 12-17",        //4 +
                  @"ПН - ПТ 10-20, СБ-ВС 12-17",        //5 +
                  @"ПН - Пт 09–20, СБ 11–15, ВС Закрыто",//6 +
                  @"ПН - Пт 09–22, СБ 11–22, ВС 11–17", //7 +
                  @"ПН - Пт 10–20, СБ 11–18, ВС Закрыто",//8 +
                  @"ПН - ВС 09-21",                      //9 +
                  @"ПН - Пт 10–19, СБ 11–17, ВС Закрыто",//10 +
                  @"ПН - Пт 10–20, СБ 11–18, ВС Закрыто",//11 +
                  @"ПН - ПТ 10-20, СБ-ВС 11-18",        //12 +
                  @"ПН - ПТ 09-20, СБ-ВС 11-18",        //13 +
                  @"ПН - Пт 09–19, СБ 10–17, ВС 12–16", //14 +
                  @"ПН - Пт 10–19, СБ - ВС Закрыто",    //15 +
                  @"ПН - Пт 10–19, СБ 11–18, ВС 11–17", //16 +
                  @"ПН - Пт 10–20, СБ 11-18, ВС Закрыто",//17 +
                  @"ПН - Пт 10–19, СБ 10-15, ВС Закрыто",//18 +
                  @"ПН - Пт 10–19, СБ 10–17, ВС Закрыто",//19 +
                  @"ПН - Пт 09–19, СБ 11–16, ВС Закрыто",//20 +
                  @"ПН - ПТ 11-19, СБ-ВС Закрыто",       //21 +
                  @"ПН - Пт 09–20, СБ 10–17, ВС 11–17",  //22 +
                  @"ПН - Пт 11–20, СБ 11–19, ВС Закрыто",//23 +
                  @"ПН - ПТ 09-19, СБ-ВС 10-15"          //24 +
                  ];
    
    _logoHomeImagesArray = @[@"i-fix.png",                  //1 +
                         @"fix4u.png",                  //2 +
                         @"service-iphone.png",         //3 +
                         @"uipservice.png",             //4 +
                         @"uipservice.png",             //5 +
                         @"irepservice.png",            //6 +
                         @"quickfix.png",               //7 +
                         @"ifix.png",                   //8 +
                         @"royal-service.png",          //9 +
                         @"iloveservice.png",           //10 +
                         @"applefix.png",               //11 +
                         @"restore.png",                //12 +
                         @"taxophone.png",              //13 +
                         @"a-service.png",              //14 +
                         @"youmix.png",                 //15 +
                         @"imobi.png",                  //16 +
                         @"i-fix.png",                  //17 +
                         @"applekiev.png",              //18 +
                         @"gutenservice.png",           //19 +
                         @"iservice.png",               //20 +
                         @"iphonechik.png",             //21 +
                         @"i-fix.png",                  //22 +
                         @"appledoc.png",               //23 +
                         @"applefix.png"                //24 +
                         ];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _Title.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CompanysCell";
    CompanysCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSInteger row = [indexPath row];
    
    cell.TitleLabel.text = _Title[row];
    cell.addressLabel.text = _Address[row];
    cell.phoneLabel.text = _Phone[row];
    
    cell.logoImages.image = [UIImage imageNamed:_logoHomeImagesArray[row]];
    
    cell.logoImages.layer.cornerRadius = cell.logoImages.frame.size.height /2;
    cell.logoImages.layer.masksToBounds = YES;
    cell.logoImages.layer.borderWidth = 0;
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"ShowHomeCompanyDetails"]) {
        
        IKCompanyDetailViewController *detailcompanyviewcontroller = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        NSInteger row = [myIndexPath row];
        detailcompanyviewcontroller.DetailModal =
        @[_Title[row], _Address[row], _Phone[row], _Schedule[row], _Site[row], _logoHomeImagesArray[row]];
        
    }
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SetMap:(id)sender {
    
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

- (IBAction)leftBarButton:(id)sender {
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [app.drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    
}

@end
