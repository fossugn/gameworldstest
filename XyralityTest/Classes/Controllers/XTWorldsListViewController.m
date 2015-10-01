//
//  XTWorldsListViewController.m
//  XyralityTest
//
//  Created by Eugene Kutia on 10/1/15.
//  Copyright © 2015 EugeneKutia. All rights reserved.
//

#import "XTWorldsListViewController.h"
#import "XTGameWorld.h"

static NSString *CellIdentifier = @"WorldCell";

@interface XTWorldsListViewController ()

@end

@implementation XTWorldsListViewController

#pragma mark - TableViewController Lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return self.gameWorlds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    XTGameWorld *gameWorld = (XTGameWorld *)self.gameWorlds[indexPath.row];
    cell.textLabel.text = [gameWorld name];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"Selected Game World: %@", [self.gameWorlds[indexPath.row] name]);
}

@end
