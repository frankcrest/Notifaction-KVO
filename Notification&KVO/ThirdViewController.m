//
//  ThirdViewController.m
//  Notification&KVO
//
//  Created by Frank Chen on 2019-05-12.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, readonly) CGFloat oldConstraint;
@property (nonatomic, strong)NSNotificationCenter* notificationCenter;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTapped:)];
    [self.view addGestureRecognizer:tapGesture];
    NSNotificationCenter* notificationCenter = [NSNotificationCenter defaultCenter];
    self.notificationCenter = notificationCenter;
    [notificationCenter addObserver:self selector:@selector(keyboardDidChange:) name:UIKeyboardDidChangeFrameNotification object:nil];
    _oldConstraint = self.bottomConstraint.constant;
}

-(void)keyboardDidChange:(NSNotification*)notification{
    NSValue* value = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect rect = value.CGRectValue;
    NSLog(@"rect origin y: %@", NSStringFromCGRect(rect));
    
    CGFloat yPos = rect.origin.y;
    CGFloat viewHeight = self.view.bounds.size.height;
    
    if (yPos == viewHeight){
        self.bottomConstraint.constant = self.oldConstraint;
    } else{
        self.bottomConstraint.constant = viewHeight - yPos;
    }
}

-(void)viewTapped:(UITapGestureRecognizer*)sender{
    [self.textField resignFirstResponder];
}

- (void)dealloc
{
    [self.notificationCenter removeObserver:self];
}



@end
