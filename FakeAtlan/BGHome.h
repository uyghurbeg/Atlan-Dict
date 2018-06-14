//
//  BGHome.h
//  FakeAtlan
//
//  Created by UyghurbegPro on 15/12/27.
//  Copyright © 2015年 BG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BGHome : NSObject

@property (nonatomic, copy) NSString *uyghur;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *pram;
@property (nonatomic, copy) NSString *pron;
@property (nonatomic, copy) NSString *han;
@property (nonatomic, copy) NSString *exam;
@property (nonatomic, copy) NSString *definition;

@property (nonatomic, strong) NSString *unit;
@property (nonatomic, strong) NSString *book;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)homeWithDict:(NSDictionary *)dict;
+ (NSArray *)home;

@end
