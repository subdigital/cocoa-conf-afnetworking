//
//  Post.m
//  AppDotNetClient
//
//  Created by Ben Scheirman on 10/19/12.
//  Copyright (c) 2012 foo. All rights reserved.
//

#import "Post.h"
#import "AppDotNetAPIClient.h"


@implementation Post

+ (void)fetchTimeline:(PostsBlock)block {
    // endpoint is at /stream/0/posts/stream/global
    [[AppDotNetAPIClient sharedAPIClient] getPath:@"/stream/0/posts/stream/global"
                                       parameters:nil
                                          success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                              NSLog(@"Response: %@", responseObject);
                                              NSMutableArray *results = [NSMutableArray array];
                                              for (id postDictionary in responseObject[@"data"]) {
                                                  Post *post = [Post postWithDictionary:postDictionary];
                                                  [results addObject:post];
                                              }
                                              if (block)
                                                  block(results);
                                          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                              NSLog(@"HTTP Status %d", operation.response.statusCode);
                                              NSLog(@"ERROR: %@", error);
                                              
                                              if (block)
                                                  block(nil);
                                          }];
}

+ (id)postWithDictionary:(NSDictionary *)dictionary {
    Post *post = [[Post alloc] init];
    post.body = dictionary[@"text"];
    post.author = dictionary[@"user"][@"username"];
    post.avatarUrl = dictionary[@"user"][@"avatar_image"][@"url"];
    
    return post;
}

@end






















/*

    [[AppDotNetAPIClient sharedAPIClient] getPath:@"/stream/0/posts/stream/global"
                                       parameters:nil
                                          success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                              NSLog(@"Response: %@", responseObject);
                                              NSArray *postDictionaries = responseObject[@"data"];
                                              NSMutableArray *results = [NSMutableArray
                                                                         arrayWithCapacity:postDictionaries.count
                                                                         ];
                                              for (NSDictionary *postDict in postDictionaries) {
                                                  Post *post = [Post postWithDictionary:postDict];
                                                  [results addObject:post];
                                              }
                                              
                                              block(results);
                                          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                              NSLog(@"ERROR: %@", error);
                                              NSLog(@"STATUS CODE: %d", operation.response.statusCode);
                                              block(nil);
                                          }];
 */
