//
//  PhotoMapViewController.h
//  Instagram
//
//  Created by Nikita Agarwal on 6/27/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotoMapViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
- (IBAction)cancelButton:(id)sender;
- (IBAction)shareButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *image;
- (IBAction)takePicture:(id)sender;
- (IBAction)cameraRoll:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *caption;


@end

NS_ASSUME_NONNULL_END
