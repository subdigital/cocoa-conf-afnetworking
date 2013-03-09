//
//  Post.h
//  AppDotNetClient
//
//  Created by Ben Scheirman on 10/19/12.
//  Copyright (c) 2012 foo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^PostsBlock)(NSArray *posts);

@interface Post : NSObject

@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *avatarUrl;

+ (void)fetchTimeline:(PostsBlock)block;

@end
