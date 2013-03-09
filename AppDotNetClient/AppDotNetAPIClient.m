//
//  AppDotNetAPIClient.m
//  AppDotNetClient
//
//  Created by Ben Scheirman on 10/19/12.
//  Copyright (c) 2012 foo. All rights reserved.
//

#import "AppDotNetAPIClient.h"


#define kAppDotNetBaseUrl @"https://alpha-api.app.net"

@implementation AppDotNetAPIClient

+ (id)sharedAPIClient {
    static AppDotNetAPIClient *__client = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [NSURL URLWithString:kAppDotNetBaseUrl];
        __client = [[AppDotNetAPIClient alloc] initWithBaseURL:baseURL];
    });
    return __client;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        /* customize here */

        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [self setDefaultHeader:@"Accept" value:@"application/json"];
    }
    
    return self;
}

@end


















/*
 [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
 [self setDefaultHeader:@"Accept" value:@"application/json"];
*/