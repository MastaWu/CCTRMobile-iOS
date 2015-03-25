//
//  SearchViewController.m
//  Masta
//
//  Created by Stephen Wu on 3/11/15.
//  Copyright (c) 2015 Wu. All rights reserved.
//

#import "SearchViewController.h"
@interface SearchViewController()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *phaseTextField;
@property (weak, nonatomic) IBOutlet UITextField *locationTextField;

@end

@implementation SearchViewController
- (void)viewDidLoad {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (IBAction)searchPressed:(id)sender {
   NSLog(@"Title - %@ \nPhase - %@ \nLocation - %@", self.titleTextField.text, self.phaseTextField.text ,self.locationTextField.text);
    
    //if found then display info somehow
}

- (void)dismissKeyboard {
    [self.view endEditing:YES];
}
@end
