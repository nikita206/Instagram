//
//  PostViewController.m
//  Instagram
//
//  Created by Nikita Agarwal on 6/29/22.
//

#import "PostViewController.h"
#import "TimelineViewController.h"


@interface PostViewController ()

@end

@implementation PostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.author.text = self.post.author[@"username"];
    self.postImage.file = self.post[@"image"];
    [self.postImage loadInBackground];
    self.caption.text = self.post[@"caption"];
    NSDate *createdAt = self.post.createdAt;
    self.timeStamp.text = [NSString stringWithFormat:@"%@", createdAt];
    self.likeCount.text = [NSString stringWithFormat:@"%@", self.post[@"likeCount"]];
    self.commentCount.text = [NSString stringWithFormat:@"%@", self.post[@"commentCount"]];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
