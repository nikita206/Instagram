//
//  ProfileViewController.h
//  Instagram
//
//  Created by Nikita Agarwal on 6/29/22.
//

#import <UIKit/UIKit.h>

#import "EditProfileViewController.h"
#import "TimelineViewController.h"
#import "PostViewCell.h"
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProfileViewController : UIViewController
- (IBAction)editProfile:(id)sender;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet PFImageView *profilePic;

@end

NS_ASSUME_NONNULL_END
