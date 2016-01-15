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
        if (textfield.text.length > 8) {
            return true;
        }
        return false;
    } ConfigLabel:^(UILabel *label) {
        label.textColor = [UIColor redColor];
    } Infomation:@"HaHa it is greater that 8"];
    
    [self.textfield lh_addObserverWithCondition:^BOOL(UITextField *textfield) {
        if (textfield.text.length > 6) {
            return true;
        }else{
            return false;
        }
    }ConfigLabel:^(UILabel *label) {
        label.textColor = [UIColor blueColor];
    } Infomation:@"6"];
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
