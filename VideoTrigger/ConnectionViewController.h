//
//  ConnectionViewController.h
//  VideoTrigger
//
//  Created by charles on 4/8/16.
//  Copyright © 2016 charles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface ConnectionViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, MCBrowserViewControllerDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISwitch *visSwitch;
@property (weak, nonatomic) IBOutlet UIButton *disconnectBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) AppDelegate *appDelegate;

- (IBAction)browseForDevices:(id)sender;
- (IBAction)toggleVisibility:(id)sender;
- (IBAction)disconnect:(id)sender;

@end
