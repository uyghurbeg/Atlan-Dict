//
//  BGDetail.m
//  FakeAtlan
//
//  Created by UyghurbegPro on 15/12/27.
//  Copyright © 2015年 BG. All rights reserved.
//

#import "BGDetail.h"
#import "BGSavedController.h"

#define kMargin 20
#define kBackGround [UIColor colorWithRed:0.85 green:0.85 blue:0.9 alpha:1]
#define kTextColor  [UIColor colorWithRed:0.4 green:0.26 blue:0.46 alpha:1]

//是因为系统自带的FONT已经存在了，所以用bounding的时候必须该字体属性
#define kFont       [UIFont fontWithName:@"UKIJ Tuz Tor" size:18.0f]

@interface BGDetail ()

@end

@implementation BGDetail

- (UIImageView *)background
{
    if (_background == nil) {
        _background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg4"]];
        _background.contentMode = UIViewContentModeScaleAspectFill;
        _background.frame = self.view.bounds;
        
        [self.view addSubview:_background];
    }
    return _background;
}

- (UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = kFont;
        [self.view addSubview:_nameLabel];
        
    }
    return _nameLabel;
}
- (UILabel *)articleLabel
{
    if (_articleLabel == nil) {
        
        _articleLabel = [[UILabel alloc] init];
        _articleLabel.font = kFont;
        [self.view addSubview:_articleLabel];
        
    }
    return _articleLabel;
}
- (UILabel *)soundLabel
{
    if (_soundLabel == nil) {
        
        _soundLabel = [[UILabel alloc] init];
        _soundLabel.font = kFont;
        [self.view addSubview:_soundLabel];
        
    }
    return _soundLabel;
}
- (UIButton *)cnLabel
{
    if (_cnLabel == nil) {
        
        _cnLabel = [[UIButton alloc] init];
        _cnLabel.titleLabel.font = kFont;
        [self.view addSubview:_cnLabel];

        
    }
    return _cnLabel;
}
- (UIButton *)ugLabel
{
    if (_ugLabel == nil) {
        
        _ugLabel = [[UIButton alloc] init];
        _ugLabel.titleLabel.font = kFont;
        [self.view addSubview:_ugLabel];

        
    }
    return _ugLabel;
}
- (UILabel *)explanLabel
{
    if (_explanLabel == nil) {
        
        _explanLabel = [[UILabel alloc] init];
        _explanLabel.font = kFont;
        [self.view addSubview:_explanLabel];
        
    }
    return _explanLabel;
}
- (UILabel *)exampleLabel
{
    if (_exampleLabel == nil) {
        
        _exampleLabel = [[UILabel alloc] init];
        _exampleLabel.font = kFont;
        [self.view addSubview:_exampleLabel];
        
    }
    return _exampleLabel;
}
- (UILabel *)sentenceLabel
{
    if (_sentenceLabel == nil) {
        
        _sentenceLabel = [[UILabel alloc] init];
        _sentenceLabel.font = kFont;
        [self.view addSubview:_sentenceLabel];
        
    }
    return _sentenceLabel;
}


/*
 @property (nonatomic, strong) UIButton *soundButton;
 @property (nonatomic, strong) UIButton *addButton;
 */

- (UIImageView *)soundButton
{
    if (_soundButton == nil) {
        
        _soundButton = [[UIImageView alloc] init];
        _soundButton.image = [UIImage imageNamed:@"sound"];
        [self.view addSubview:_soundButton];
        
    }
    return _soundButton;
}

#pragma sound Imageview

- (UIButton *)addButton
{
    if (_addButton == nil) {
        
        _addButton = [[UIButton alloc] init];
        
        [self.view addSubview:_addButton];
        
    }
    return _addButton;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
        [self background];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // all about navigation bar
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.85 green:0.85 blue:0.9 alpha:1]];
    self.navigationItem.title = @"ئىزاھات";
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"UKIJ Tuz Tor" size:20.0f], NSFontAttributeName, [UIColor colorWithRed:0.4 green:0.26 blue:0.46 alpha:1], NSForegroundColorAttributeName, nil]];
    
    //set right button to add to save
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"copy_word"] style:UIBarButtonItemStyleDone target:self action:@selector(addToSave)];
    self.navigationItem.rightBarButtonItem = rightButton;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithRed:0.4 green:0.26 blue:0.46 alpha:1];
//    self.navigationItem.rightBarButtonItem.tintColor = 
    
    
    //set back navigation button item
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_icon"] style:UIBarButtonItemStyleDone target:self action:@selector(backToHome)];
    self.navigationItem.leftBarButtonItem = backItem;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithRed:0.4 green:0.26 blue:0.46 alpha:1];
    
    
    //set subviews frame
    //1.nameLabel frame
    
    NSDictionary *dict = @{ NSFontAttributeName : kFont};
    
    CGRect nameLabelFrame = [self.nameText boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesFontLeading attributes:dict context:nil];
    nameLabelFrame.origin.x = 20;
    nameLabelFrame.origin.y = 80;
    self.nameLabel.frame = nameLabelFrame;
    self.nameLabel.text = self.nameText;
    self.nameLabel.textColor = kTextColor;
    NSLog(@"%@", self.nameLabel.text);
    
    //2.article frame
    CGRect articleFrame = [self.articleText boundingRectWithSize:CGSizeMake(120, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    articleFrame.origin.x = CGRectGetMaxX(self.nameLabel.frame) + kMargin;
    articleFrame.origin.y = 80;
    self.articleLabel.frame = articleFrame;
    self.articleLabel.backgroundColor = kBackGround;
    self.articleLabel.textColor = kTextColor;
    self.articleLabel.textAlignment = NSTextAlignmentCenter;
    self.articleLabel.text = self.articleText;
    
    //3.sound image frame
    CGFloat soungY = CGRectGetMaxY(self.articleLabel.frame) + kMargin;
    self.soundButton.frame = CGRectMake(kMargin, soungY, kMargin, kMargin);
    
    
//    4.pronounciation frame
    CGRect soundFrame = [self.soundText boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    soundFrame.origin.x = CGRectGetMaxX(self.soundButton.frame) + 10;
    soundFrame.origin.y = soungY;
    self.soundLabel.frame = soundFrame;
    self.soundLabel.textAlignment = NSTextAlignmentCenter;
    self.soundLabel.text = self.soundText;
    self.soundLabel.textColor = kTextColor;
    
    
    
    //5.chinese label frame
    
    CGFloat cnlabelY = CGRectGetMaxY(self.soundLabel.frame) + kMargin;
    CGFloat cnW = self.view.bounds.size.width * 0.5;
    
    CGRect cnlabelFrame = [self.cnText boundingRectWithSize:CGSizeMake(cnW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    CGRect uglabelFrame = [self.ugText boundingRectWithSize:CGSizeMake(cnW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    CGFloat lineH;
    
    if (cnlabelFrame.size.height > uglabelFrame.size.height) {
         lineH = cnlabelFrame.size.height + 10;
    }
    else
    {
        lineH = uglabelFrame.size.height + 10;
    }
    [self.cnLabel setFrame:CGRectMake(0, cnlabelY, cnW, lineH)];
    [self.cnLabel setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.94 alpha:1]];
    NSString *string1 = [NSString stringWithFormat:@"     %@", self.cnText];
    [self.cnLabel setTitle:string1 forState:UIControlStateNormal];
    [self.cnLabel setTitleColor:kTextColor forState:UIControlStateNormal];
    [self.cnLabel setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    
    //

    
    //6.uyghur label frame
    CGFloat ugX = CGRectGetMaxX(self.cnLabel.frame);
    [self.ugLabel setFrame:CGRectMake(ugX, cnlabelY, cnW, lineH)];
    [self.ugLabel setBackgroundColor:kBackGround];
    NSString *string2 = [NSString stringWithFormat:@"     %@", self.ugText];
    [self.ugLabel setTitle:string2 forState:UIControlStateNormal];
    [self.ugLabel setTitleColor:kTextColor forState:UIControlStateNormal];
    [self.ugLabel setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];

    self.ugLabel.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    
    //7.definition Frame
    CGRect definitionFrame = [self.explainText boundingRectWithSize:CGSizeMake(self.view.bounds.size.width - kMargin * 2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    definitionFrame.origin.x = kMargin;
    definitionFrame.origin.y = CGRectGetMaxY(self.ugLabel.frame) + 10;

    self.explanLabel.frame = definitionFrame;
    self.explanLabel.numberOfLines = 0;
    self.explanLabel.text = self.explainText;
    self.explanLabel.textColor = kTextColor;
    
    //8.example Label Frame
    CGFloat exmY = CGRectGetMaxY(self.explanLabel.frame) + 10;
    self.exampleLabel.frame = CGRectMake(kMargin, exmY, 75, 20);
    self.exampleLabel.backgroundColor = kBackGround;
    self.exampleLabel.textColor = kTextColor;
    NSString *exampleTXT = [NSString stringWithFormat:@" %@", self.exampleText];
    self.exampleLabel.text = exampleTXT;
    
    //9.sentence Frame
       CGRect sentenceFrame = [self.sentenceText boundingRectWithSize:CGSizeMake(self.view.bounds.size.width - kMargin * 2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    sentenceFrame.origin.x = kMargin;
    sentenceFrame.origin.y = CGRectGetMaxY(self.exampleLabel.frame) + 10;
    self.sentenceLabel.frame =sentenceFrame;
    self.sentenceLabel.numberOfLines = 0;
    self.sentenceLabel.text = self.sentenceText;
    self.sentenceLabel.textColor = kTextColor;

}

// back to home
- (void)backToHome
{
    [self.navigationController popViewControllerAnimated:YES];
}

//收藏
- (void)addToSave
{
    NSLog(@"已点击收藏 -- %s", __FUNCTION__);
    
    /*
    @property (nonatomic, strong) NSString *nameText;
    @property (nonatomic, strong) NSString *articleText;
    @property (nonatomic, strong) NSString *soundText;
    @property (nonatomic, strong) NSString *cnText;
    @property (nonatomic, strong) NSString *ugText;
    @property (nonatomic, strong) NSString *explainText;
    @property (nonatomic, strong) NSString *exampleText;
    @property (nonatomic, strong) NSString *sentenceText;
     */
    BGSavedController *save = [[BGSavedController alloc] init];

    save.dataDict = [NSMutableDictionary dictionary];

        save.dataDict[@"name"] = self.nameText;
        save.dataDict[@"uyghur"] = self.ugText;
        save.dataDict[@"han"] = self.cnText;
        save.dataDict[@"pron"] = self.soundText;
        save.dataDict[@"pram"] = self.articleText;
        save.dataDict[@"exam"] = self.sentenceText;
        save.dataDict[@"definition"] = self.explainText;
    
    NSMutableArray *array = [NSMutableArray array];
    
    [array addObject:save.dataDict];
    
    NSString *homeDir = NSHomeDirectory();
    NSString *docPath = [homeDir stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"data.plist"];

    [array writeToFile:filePath atomically:YES];
    
    self.addButton.enabled = NO;
    
    [save.tableView reloadData];
    
    NSLog(@"词典内容：%@", save.dataDict);
    

}
@end
