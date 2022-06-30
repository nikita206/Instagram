//
//  TimelineViewController.m
//  Instagram
//
//  Created by Nikita Agarwal on 6/27/22.
//

#import "TimelineViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "Parse/Parse.h"
#import "InstagramPostTableViewCell.h"
#import "PostViewController.h"
#import "DateTools.h"

@interface TimelineViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSArray *arrayOfPosts;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.arrayOfPosts = [[NSMutableArray alloc] init];
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchPosts) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    [self fetchPosts];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier]  isEqualToString:@"detailPost"]) {
            UITableViewCell *cell = sender;
            NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
            Post *post = self.arrayOfPosts[indexPath.row];
            PostViewController *detailVC = [segue destinationViewController];
            detailVC.post = post;
        }
}


-(void) fetchPosts{
    PFQuery *postQuery = [PFQuery queryWithClassName:@"Post"];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    postQuery.limit = 20;

    [postQuery findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts) {
            self.arrayOfPosts = posts;
            [self.tableView reloadData];
        }
        else {
            NSLog(@"%@", error);
        }
        [self.refreshControl endRefreshing];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    InstagramPostTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"postCell" forIndexPath:indexPath];
    
    
    Post *post = self.arrayOfPosts[indexPath.row];
    cell.post = post;
    cell.author.text = post[@"author"][@"username"];
    cell.username.text = post[@"author"][@"username"];
    cell.caption.text = post[@"caption"];
    NSDate *createdAt = post.createdAt;
    cell.timeAgo.text = [NSString stringWithFormat:@"%@", createdAt.shortTimeAgoSinceNow];
    cell.likeCount.text = [NSString stringWithFormat:@"%@", post[@"likeCount"]];
    cell.commentCount.text = [NSString stringWithFormat:@"%@", post[@"commentCount"]];
    cell.photoImageView.file = post[@"image"];
    [cell.photoImageView loadInBackground];
    cell.pfp.file = post[@"author"][@"profileImage"];
    [cell.pfp loadInBackground];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayOfPosts.count;
}

- (IBAction)didTapPhoto:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITabBarController *tabController = [storyboard instantiateViewControllerWithIdentifier:@"image"];
    self.view.window.rootViewController = tabController;
}

- (IBAction)didTapLogout:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                self.view.window.rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"login"];
    }];
}

@end
