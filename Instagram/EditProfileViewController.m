//
//  EditProfileViewController.m
//  Instagram
//
//  Created by Nikita Agarwal on 6/29/22.
//

#import "EditProfileViewController.h"
#import "Parse/Parse.h"

@interface EditProfileViewController ()

@end

@implementation EditProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    PFUser *user = [PFUser currentUser];
//    user[@"profileImage"] = []
    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)didCancel:(id)sender {
}
@end
