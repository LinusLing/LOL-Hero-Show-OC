//
//  Hero.h
//  LOL-Hero-Show-OC
//
//  Created by Linus on 15-3-19.
//  Copyright (c) 2015年 Linus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hero : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)heroWithDict:(NSDictionary *)dict;

@end
