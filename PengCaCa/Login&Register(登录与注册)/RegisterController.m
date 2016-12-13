//
//  RegisterController.m
//  PengCaCa
//
//  Created by 龙少 on 2016/12/12.
//  Copyright © 2016年 chance. All rights reserved.
//

#import "RegisterController.h"

@interface RegisterController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneInputField;
@property (weak, nonatomic) IBOutlet UITextField *codeInputField;
@property (weak, nonatomic) IBOutlet UITextField *passwordInputField;

@end

@implementation RegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupView];
}

- (void)setupView {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    UIImageView *phoneInputField = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 44, 35)];
    phoneInputField.backgroundColor = [UIColor whiteColor];
    self.phoneInputField.leftViewMode = UITextFieldViewModeAlways;
    self.phoneInputField.leftView = phoneInputField;
    
    UIImageView *authCodeLeftView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 44, 35)];
    authCodeLeftView.backgroundColor = [UIColor whiteColor];
    self.codeInputField.leftViewMode = UITextFieldViewModeAlways;
    self.codeInputField.leftView = authCodeLeftView;
    
    UIImageView *pswLeftView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 44, 35)];
    pswLeftView.backgroundColor = [UIColor whiteColor];
    self.passwordInputField.leftViewMode = UITextFieldViewModeAlways;
    self.passwordInputField.leftView = pswLeftView;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
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
- (IBAction)onGetAuthCode:(UIButton *)sender {
}

- (IBAction)onRegister:(UIButton *)sender {
    
}


- (IBAction)onBackLogin:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
