//
//  BGDetail.h
//  FakeAtlan
//
//  Created by UyghurbegPro on 15/12/27.
//  Copyright © 2015年 BG. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BGHome, BGDetail, BGSave;

@protocol BGDetaiDelegate <NSObject>

@optional

-(void)detail:(BGDetail *)detail addSaved:(BGSave *)save;

@end


@interface BGDetail : UIViewController


/* all about label string*/
@property (nonatomic, strong) NSString *nameText;
@property (nonatomic, strong) NSString *articleText;
@property (nonatomic, strong) NSString *soundText;
@property (nonatomic, strong) NSString *cnText;
@property (nonatomic, strong) NSString *ugText;
@property (nonatomic, strong) NSString *explainText;
@property (nonatomic, strong) NSString *exampleText;
@property (nonatomic, strong) NSString *sentenceText;

/* all about label self*/
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *articleLabel;
@property (nonatomic, strong) UILabel *soundLabel;
@property (nonatomic, strong) UILabel *explanLabel;
@property (nonatomic, strong) UILabel *exampleLabel;
@property (nonatomic, strong) UILabel *sentenceLabel;

/*button and image*/
@property (nonatomic, strong) UIButton *cnLabel;
@property (nonatomic, strong) UIButton *ugLabel;
@property (nonatomic, strong) UIImageView *background;
@property (nonatomic, strong) UIImageView *soundButton;
@property (nonatomic, strong) UIButton *addButton;


/*modal*/
@property (nonatomic, strong) BGSave *save;
@property (nonatomic, weak) id<BGDetaiDelegate>delegate;

@end
