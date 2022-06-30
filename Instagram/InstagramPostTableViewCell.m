//
//  InstagramPostTableViewCell.m
//  Instagram
//
//  Created by Nikita Agarwal on 6/28/22.
//

#import "InstagramPostTableViewCell.h"

@implementation InstagramPostTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    UITapGestureRecognizer *profileTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapPic)];
    [self.pfp addGestureRecognizer:profileTap];
    [self.pfp setUserInteractionEnabled:YES];
}

-(void) didTapPic{
    NSLog(@"tippy tippy tap");

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)setPost:(Post *)post {
    _post = post;
//    PFImageView *imageView = self.photoImageView;
//    imageView.file = post[@"image"];
// self.photoImageView.file = post[@"image"];
//    [imageView loadInBackground];
}


- (IBAction)tapFavorite:(id)sender {
}

- (IBAction)tapLike:(id)sender {
}
@end
