//
//  TimelineViewController.m
//  AppDotNetClient
//
//  Created by Ben Scheirman on 10/19/12.
//  Copyright (c) 2012 foo. All rights reserved.
//

#import "TimelineViewController.h"
#import "Post.h"
#import "UIImageView+AFNetworking.h"
#import "PostCell.h"

@interface TimelineViewController ()

@property (nonatomic, strong) NSArray *posts;

@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"PostCell" bundle:nil] forCellReuseIdentifier:@"postCell"];

    /* Fetch timeline */
    [Post fetchTimeline:^(NSArray *posts) {
        self.posts = posts;
        [self.tableView reloadData];
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [PostCell height];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"postCell";
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Post *post = self.posts[indexPath.row];
    cell.post = post;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

@end
