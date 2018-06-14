//
//  BGSave.m
//  FakeAtlan
//
//  Created by UyghurbegPro on 16/1/27.
//  Copyright © 2016年 BG. All rights reserved.
//

#import "BGSave.h"

@implementation BGSave

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super self];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)homeWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}


+ (NSArray *)save
{
    NSString *homeDir = NSHomeDirectory();
    NSString *docPath = [homeDir stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"data.plist"];
    
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:filePath];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self homeWithDict:dict]];
    }
    return [arrayM copy];
}


@end
