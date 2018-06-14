//
//  BGBiglistModal.h
//  FakeAtlan
//
//  Created by UyghurbegPro on 15/12/27.
//  Copyright © 2015年 BG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BGBiglistModal : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;

+ (instancetype)biglistWithIcon:(NSString *)icon title:(NSString *)title;

@end
