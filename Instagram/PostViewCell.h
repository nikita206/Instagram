//
//  PostViewCell.h
//  Instagram
//
//  Created by Nikita Agarwal on 6/29/22.
//

#import <UIKit/UIKit.h>

#import "Parse/Parse.h"
#import "Parse/PFImageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet PFImageView *postImage;

@end

NS_ASSUME_NONNULL_END
