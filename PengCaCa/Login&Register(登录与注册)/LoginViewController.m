//
//  LoginViewController.m
//  PengCaCa
//
//  Created by likeSo on 2016/12/12.
//  Copyright © 2016年 chance. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneInputField;
@property (weak, nonatomic) IBOutlet UITextField *passwordInputField;

@end

@implementation LoginViewController

+ (UINavigationController *)navigator {
    LoginViewController *loginView = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:[NSBundle mainBundle]];
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:loginView];
    
    return navigationController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupView];
}

- (void)setupView {
    UIView *phoneLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 30)];
    phoneLeftView.backgroundColor = [UIColor whiteColor];
    self.phoneInputField.leftViewMode = UITextFieldViewModeAlways;
    self.phoneInputField.leftView = phoneLeftView;
    
    UIView *passwordLeftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 30)];
    passwordLeftView.backgroundColor = [UIColor whiteColor];
    self.passwordInputField.leftViewMode = UITextFieldViewModeAlways;
    self.passwordInputField.leftView = passwordLeftView;
    self.navigationItem.backBarButtonItem = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onLogin:(UIButton *)sender {
    
}
- (IBAction)onRegister:(UIButton *)sender {
    RegisterController *registerController = [[RegisterController alloc]initWithNibName:@"RegisterController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:registerController animated:YES];
}
- (IBAction)onResetPassword:(UIButton *)sender {
}
- (IBAction)onWxLogin:(UIButton *)sender {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
