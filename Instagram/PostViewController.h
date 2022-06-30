//
//  PostViewController.h
//  Instagram
//
//  Created by Nikita Agarwal on 6/29/22.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "Parse/Parse.h"
#import "Parse/PFImageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet PFImageView *postImage;
@property Post *post;
@property (weak, nonatomic) IBOutlet UILabel *caption;
@property (weak, nonatomic) IBOutlet UILabel *likeCount;
@property (weak, nonatomic) IBOutlet UILabel *commentCount;
@property (weak, nonatomic) IBOutlet UILabel *timeStamp;

@end

NS_ASSUME_NONNULL_END
