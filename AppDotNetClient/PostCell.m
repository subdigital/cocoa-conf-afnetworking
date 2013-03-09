//
//  PostCell.m
//  AppDotNetClient
//
//  Created by Ben Scheirman on 10/20/12.
//  Copyright (c) 2012 foo. All rights reserved.
//

#import "PostCell.h"
#import "UIImageView+AFNetworking.h"

@implementation PostCell

- (void)setPost:(Post *)post {
    _post = post;
    
    self.authorLabel.text = post.author;
    self.bodyLabel.text = post.body;
    
    UIImage *placeholder = [UIImage imageNamed:@"default_avatar.png"];
    NSURL *imageUrl = [NSURL URLWithString:post.avatarUrl];
    [self.avatarImageView setImageWithURL:imageUrl
                         placeholderImage:placeholder];
}

+ (CGFloat)height {
    return 60;
}

@end





















/*

    self.bodyLabel.text = post.body;
    self.authorLabel.text = post.author;
    
    UIImage *defaultAvatarImage = [UIImage imageNamed:@"default_avatar.gif"];
    if (post.avatarUrl) {
        NSURL *url = [NSURL URLWithString:post.avatarUrl];
        [self.avatarImageView setImageWithURL:url
                             placeholderImage:defaultAvatarImage];
    } else {
        self.imageView.image = defaultAvatarImage;
    }
 */
