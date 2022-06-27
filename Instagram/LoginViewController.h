//
//  LoginViewController.h
//  Instagram
//
//  Created by Nikita Agarwal on 6/27/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)loginUser:(id)sender;
- (IBAction)registerUser:(id)sender;

@end

NS_ASSUME_NONNULL_END
