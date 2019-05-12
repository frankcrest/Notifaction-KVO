//
//  SecondViewController.m
//  Notification&KVO
//
//  Created by Frank Chen on 2019-05-12.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic, strong) NSNotificationCenter* notificationCenter;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.notificationCenter = [NSNotificationCenter defaultCenter];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.notificationCenter addObserver:self selector:@selector(stepperChanged:) name:@"StepperNotification" object:nil];
}
-(void)stepperChanged:(NSNotification*)notification{
    NSLog(@"before view loads"); 
    NSDictionary* dictionary = notification.userInfo;
    NSLog(@"%@", dictionary);
    NSNumber* number = dictionary[@"stepperValue"];
    NSString* numberString = [number stringValue];
    self.label.text = numberString;
}

- (void)dealloc
{
    [self.notificationCenter removeObserver:self];
}

@end
