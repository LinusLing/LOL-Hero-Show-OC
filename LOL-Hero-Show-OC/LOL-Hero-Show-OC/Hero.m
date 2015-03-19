//
//  Hero.m
//  LOL-Hero-Show-OC
//
//  Created by Linus on 15-3-19.
//  Copyright (c) 2015年 Linus. All rights reserved.
//

#import "Hero.h"

@implementation Hero

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
//        self.icon = [dict[@"icon"] copy];
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)heroWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
