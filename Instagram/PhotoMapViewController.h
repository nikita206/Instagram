//
//  PhotoMapViewController.h
//  Instagram
//
//  Created by Nikita Agarwal on 6/27/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotoMapViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
- (IBAction)cancelButton:(id)sender;
- (IBAction)shareButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

NS_ASSUME_NONNULL_END
