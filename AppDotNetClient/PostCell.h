//
//  PostCell.h
//  AppDotNetClient
//
//  Created by Ben Scheirman on 10/20/12.
//  Copyright (c) 2012 foo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@interface PostCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;

@property (strong, nonatomic) Post *post;

+ (CGFloat)height;

@end
