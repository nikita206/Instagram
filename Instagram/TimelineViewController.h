//
//  TimelineViewController.h
//  Instagram
//
//  Created by Nikita Agarwal on 6/27/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TimelineViewController : UIViewController
- (IBAction)didTapLogout:(id)sender;
- (IBAction)didTapPhoto:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
