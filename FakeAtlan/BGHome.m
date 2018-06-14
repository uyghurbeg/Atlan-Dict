//
//  BGHome.m
//  FakeAtlan
//
//  Created by UyghurbegPro on 15/12/27.
//  Copyright © 2015年 BG. All rights reserved.
//

#import "BGHome.h"
#import "BGHomeController.h"

@implementation BGHome

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

//+ (NSArray *)home
//{
//
//    NSArray *arrayH = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1-1.plist" ofType:nil]];
//
//    NSMutableArray *arrayM = [NSMutableArray array];
//    for (NSDictionary *dict in arrayH) {
//        [arrayM addObject:[self homeWithDict:dict]];
//    }
//    return [arrayM copy];
//}

@end
