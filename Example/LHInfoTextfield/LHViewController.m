//
//  LHViewController.m
//  LHInfoTextfield
//
//  Created by leoMobileDeveloper on 01/15/2016.
//  Copyright (c) 2016 leoMobileDeveloper. All rights reserved.
//

#import "LHViewController.h"

#import "UITextField+LHInfo.h"

@interface LHViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textfield;

@end

@implementation LHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.textfield lh_addObserverWithCondition:^BOOL(UITextField *textfield) {
        return textfield.text.length > 8;
    } Config:^(LHAnchorView *anchorView) {
        anchorView.borderColor = [UIColor redColor];
        anchorView.textColor = [UIColor redColor];
    } Infomation:@"HaHa length is greater that 8"];
    
    [self.textfield lh_addObserverWithCondition:^BOOL(UITextField *textfield) {
        return textfield.text.length > 6;
    } Config:^(LHAnchorView *anchorView) {
        anchorView.borderColor = [UIColor darkGrayColor];
        anchorView.textColor = [UIColor blueColor];
    } Infomation:@"💀👻🎅"];

	// Do any additional setup after loading the view, typically from a nib.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.textfield becomeFirstResponder];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
