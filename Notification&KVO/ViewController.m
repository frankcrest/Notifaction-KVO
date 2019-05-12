//
//  ViewController.m
//  Notification&KVO
//
//  Created by Frank Chen on 2019-05-12.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (nonatomic, readonly) NSNotificationCenter* notificationCenter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self stepperTapped:self.stepper];
}

- (NSNotificationCenter *)notificationCenter{
   return [NSNotificationCenter defaultCenter];
}

- (IBAction)stepperTapped:(UIStepper *)sender {
    NSNumber* stepperValue = [[NSNumber alloc]initWithFloat:sender.value];
    NSNotification* notification = [[NSNotification alloc]initWithName:@"StepperNotification" object:self userInfo:@{@"stepperValue": stepperValue}];
    NSLog(@"%@", notification.userInfo);
    [self.notificationCenter postNotification:notification];
    NSLog(@"notification posted");
}

@end
