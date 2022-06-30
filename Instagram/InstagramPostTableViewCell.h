//
//  InstagramPostTableViewCell.h
//  Instagram
//
//  Created by Nikita Agarwal on 6/28/22.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "Parse/Parse.h"
#import "Parse/PFImageView.h"


NS_ASSUME_NONNULL_BEGIN

@interface InstagramPostTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet PFImageView *photoImageView;

@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *caption;
@property (weak, nonatomic) IBOutlet UILabel *likeCount;
@property (weak, nonatomic) IBOutlet UILabel *commentCount;
- (IBAction)tapLike:(id)sender;
- (IBAction)tapFavorite:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *timeAgo;
@property (weak, nonatomic) IBOutlet PFImageView *pfp;



@property (strong, nonatomic) Post *post;
@end

NS_ASSUME_NONNULL_END
