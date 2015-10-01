//
//  XTLoginViewController.m
//  XyralityTest
//
//  Created by Eugene Kutia on 10/1/15.
//  Copyright © 2015 EugeneKutia. All rights reserved.
//

#import "XTLoginViewController.h"
#import "REValidation.h"
#import "XTProgressOverlayView.h"
#import "XTGameWorldsList.h"
#import "XTWorldsListViewController.h"

static NSString *const kGameWorldsListSegue = @"gameWorldsListSegueIdentifier";

@interface XTLoginViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (nonatomic, strong) NSArray *gameWorldsRecieved;

- (IBAction)loginButtonAction:(id)sender;

@end

@implementation XTLoginViewController

#pragma mark - Controller Lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.emailTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    [REValidation registerDefaultValidators];
    [REValidation registerDefaultErrorMessages];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];

    self.passwordTextField.text = @"";
    [self activateLoginButton:NO];
}

#pragma mark - Button Actions

- (IBAction)loginButtonAction:(id)sender {
    
    [self hideKeyboard];
    
    [XTProgressOverlayView showProgressOverlayView];
    
    @weakify(self)
    [XTGameWorldsList getGameWorldsWithUserWithEmail:self.emailTextField.text
                                            password:self.passwordTextField.text].then(^(NSArray * gameWorlds){
        @strongify(self)
        self.gameWorldsRecieved = gameWorlds;
        
        [XTProgressOverlayView hideProgressOverlayView:NO completion:^{
            if (gameWorlds) {
                [self performSegueWithIdentifier:kGameWorldsListSegue sender:self];
            } else {

                [self showAlertWithServerError];
            }
        }];
    }).catch(^(NSError *error){
        NSLog(@"Error: %@", error);
        [XTProgressOverlayView hideProgressOverlayView];
    });
}

#pragma mark - UI related methods

- (void) hideKeyboard {
    
    [self.emailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

- (void)activateLoginButton:(BOOL)activate {
    
    self.loginButton.enabled = activate;
    
    if (activate) {
        self.loginButton.backgroundColor = XT_COLOR_SOLID_BUTTON_ACTIVE;
    } else {
        self.loginButton.backgroundColor = XT_COLOR_SOLID_BUTTON_INACTIVE;
    }
}

- (void) showAlertWithServerError {
    //Need to wrap in delay to avoid keyboard flickering
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", @"Error")
                                                        message:NSLocalizedString(@"Server Error. Please check your credentials and try again.", nil)
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"OK", @"OK")
                                              otherButtonTitles:nil];
        [alert show];
    });
}

#pragma mark - Validation

- (BOOL)isLoginFormValid {
    
    NSString *emailString = self.emailTextField.text;
    NSArray *errorsEmail = [REValidation validateObject:emailString name:@"Email" validators:@[ [REPresenceValidator validator], [RELengthValidator validatorWithParameters:@{ @"min": @5, @"max": @30}], [REEmailValidator validator] ]];
    
    NSString *passwordString = self.passwordTextField.text;
    NSArray *errorsPassword = [REValidation validateObject:passwordString name:@"Password" validators:@[ [REPresenceValidator validator] ]];

    return errorsEmail.count <= 0 && errorsPassword.count <= 0;
}

- (BOOL)isEmailStringValid:(NSString *)email {
    
    NSArray *errorsEmail = [REValidation validateObject:email name:@"Email" validators:@[ [REPresenceValidator validator], [RELengthValidator validatorWithParameters:@{ @"min": @5, @"max": @30}], [REEmailValidator validator] ]];
    
    return errorsEmail.count <= 0;
}

- (BOOL)isPasswordStringValid:(NSString *)password {
    
    NSArray *errorsPassword = [REValidation validateObject:password name:@"Password" validators:@[ [REPresenceValidator validator]]];
    
    return errorsPassword.count <= 0;
}



#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *updatedString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if ([textField isEqual:self.emailTextField]) {
        if ([self isEmailStringValid:updatedString]) {
             [self activateLoginButton:[self isPasswordStringValid:self.passwordTextField.text]];
        } else {
            [self activateLoginButton:NO];
        }
    } else if ([textField isEqual:self.passwordTextField]) {
        if ([self isPasswordStringValid:updatedString]) {
            [self activateLoginButton:[self isEmailStringValid:self.emailTextField.text]];
        } else {
            [self activateLoginButton:NO];
        }
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if ([textField isEqual:self.emailTextField]) {
        [self.passwordTextField becomeFirstResponder];
    } else if ([textField isEqual:self.passwordTextField]) {
        if ([self isLoginFormValid]) {
            [self loginButtonAction:nil];
        } else {
            [self.passwordTextField resignFirstResponder];
        }
        
    }
    
    return YES;
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:kGameWorldsListSegue]) {
        if ((self.gameWorldsRecieved) && (self.gameWorldsRecieved.count > 0)) {
            XTWorldsListViewController *vc = ((XTWorldsListViewController *)segue.destinationViewController);
            vc.gameWorlds = self.gameWorldsRecieved;

        }
    }
}

@end
