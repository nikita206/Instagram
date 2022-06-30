//
//  ProfileViewController.m
//  Instagram
//
//  Created by Nikita Agarwal on 6/29/22.
//

#import "ProfileViewController.h"
@interface ProfileViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) NSArray *arrayOfPosts;
@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self fetchPosts];
}

-(void) fetchPosts{
    PFQuery *postQuery = [PFQuery queryWithClassName:@"Post"];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    [postQuery whereKey:@"author" equalTo:[PFUser currentUser]];
    postQuery.limit = 20;

    [postQuery findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts) {
            self.arrayOfPosts = posts;
            [self.collectionView reloadData];
        }
        else {
            NSLog(@"%@", error);
        }
    }];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PostViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PostViewCell" forIndexPath:indexPath];
    Post *post = self.arrayOfPosts[indexPath.row];
    cell.postImage.file = post[@"image"];
    [cell.postImage loadInBackground];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arrayOfPosts.count;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize screenSize = UIScreen.mainScreen.bounds.size;
    //screenSize.width
    
    return CGSizeMake(200, 200);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)editProfile:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UINavigationController *navVC = [storyboard instantiateViewControllerWithIdentifier:@"editProfileNavVC"];
    
    [self presentViewController:navVC animated:YES completion:nil];
//    UITabBarController *tabController = [storyboard instantiateViewControllerWithIdentifier:@"editProfile"];
//    self.view.window.rootViewController = tabController;
}
@end
