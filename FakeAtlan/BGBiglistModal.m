//
//  BGBiglistModal.m
//  FakeAtlan
//
//  Created by UyghurbegPro on 15/12/27.
//  Copyright © 2015年 BG. All rights reserved.
//

#import "BGBiglistModal.h"

@implementation BGBiglistModal

+ (instancetype)biglistWithIcon:(NSString *)icon title:(NSString *)title
{
    BGBiglistModal *modal = [[BGBiglistModal alloc] init];
    
    modal.icon = icon;
    modal.title = title;
    
    return modal;
}

@end
