//
//  BGHomeCell.m
//  FakeAtlan
//
//  Created by UyghurbegPro on 15/12/27.
//  Copyright © 2015年 BG. All rights reserved.
//

#import "BGHomeCell.h"
#import "BGHome.h"

@implementation BGHomeCell

- (void)setHome:(BGHome *)home
{
    _home = home;

}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
