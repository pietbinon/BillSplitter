//
//  ViewController.m
//  BillSplitter
//
//  Created by Pierre Binon on 2017-01-20.
//  Copyright © 2017 Pierre Binon. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UISlider *numberOfGuestsSlider;
@property (weak, nonatomic) IBOutlet UILabel *dividedAmountOfBillLabel;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;

@end





@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)sliderChanged:(UISlider *)sender {
    int progress = (int) lroundf(sender.value);
    self.sliderLabel.text = [NSString stringWithFormat: @"%d", progress];
}


- (void) calculateIndividualAmountAndUpdateLabel {
    //Configure variables to do math
    double billAmount = self.billAmountTextField.text.doubleValue;
    int numberOfEaters = (int) self.numberOfGuestsSlider.value;
    
    //Do the math
    double totalAmount = billAmount / numberOfEaters;
    
    NSString *s = [NSNumberFormatter localizedStringFromNumber: @(totalAmount) numberStyle: NSNumberFormatterCurrencyAccountingStyle];
    
    //Update the labels in the view
    self.dividedAmountOfBillLabel.text = [NSString stringWithFormat: @"%@", s];
   
    
    
    
//    NSString *s = [NSNumberFormatter localizedStringFromNumber:@(12.5079) numberStyle:NSNumberFormatterCurrencyAccountingStyle];
//    
//    
//    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
//    f.numberStyle = NSNumberFormatterCurrencyAccountingStyle;
//    NSString *s1 = [f stringFromNumber:@(12.00989)];
//    
//    NSLog(@"%@, %@", s, s1);
}


- (IBAction)calculateSplitAmount:(UIButton *)sender {
    [self calculateIndividualAmountAndUpdateLabel];
}


@end
