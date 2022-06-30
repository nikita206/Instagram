//
//  ProfileViewController.h
//  Instagram
//
//  Created by Nikita Agarwal on 6/29/22.
//

#import <UIKit/UIKit.h>

#import "TimelineViewController.h"
#import "PostViewCell.h"
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet PFImageView *profilePic;
@property (weak, nonatomic) IBOutlet UILabel *username;

@end

NS_ASSUME_NONNULL_END
