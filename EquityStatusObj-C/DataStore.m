//
//  DataStore.m
//  EquityStatusObj-C
//
//  Created by Paul Tangen on 5/1/17.
//  Copyright © 2017 Paul Tangen. All rights reserved.
//

#import "DataStore.h"

@implementation DataStore

+ (instancetype)sharedManager {
    static DataStore *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[DataStore alloc] init];
    });
    return _sharedManager;
}


-(instancetype)init {
    self = [super init];
    
    if (self) {
        _content = [[NSMutableArray alloc] init];  // initialize the array(s) in the datastore
    }
    return self;
}

@end
