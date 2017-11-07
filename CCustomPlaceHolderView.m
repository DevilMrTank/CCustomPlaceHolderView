//
//  CCustomPlaceHolderView.m
//  crd
//
//  Created by 笔记本 on 2017/6/30.
//  Copyright © 2017年 crd. All rights reserved.
//

#import "CCustomPlaceHolderView.h"
#import "UIView+CTap.h"

@interface CCustomPlaceHolderView ()

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) UIImageView *img;

@property (nonatomic, copy) NSString *tips;

@property (nonatomic, copy) NSString *imgName;

@end

@implementation CCustomPlaceHolderView

- (instancetype)initWithFrame:(CGRect)frame {
    
    return [self initWithFrame:frame tips:@"没有相关数据" imgName:@"placeholder_img" block:nil];
}

- (instancetype)initWithFrame:(CGRect)frame
                      imgName:(NSString *)imgName{
    
    return [self initWithFrame:frame tips:@"没有相关数据" imgName:imgName block:nil];
}

- (instancetype)initWithFrame:(CGRect)frame
                         tips:(NSString *)tips {
    
    return [self initWithFrame:frame tips:tips imgName:@"" block:nil];
}

- (instancetype)initWithFrame:(CGRect)frame
                        block:(CCustomPlaceHolderViewBlock)block {
    
    return [self initWithFrame:frame tips:@"" imgName:@"" block:block];
}

- (instancetype)initWithFrame:(CGRect)frame
                      imgName:(NSString *)imgName
                        block:(CCustomPlaceHolderViewBlock)block {
    
    return [self initWithFrame:frame tips:@"" imgName:imgName block:block];
}

- (instancetype)initWithFrame:(CGRect)frame
                         tips:(NSString *)tips
                        block:(CCustomPlaceHolderViewBlock)block {
    
    return [self initWithFrame:frame tips:tips imgName:@"" block:block];
}

- (instancetype)initWithFrame:(CGRect)frame
                         tips:(NSString *)tips
                      imgName:(NSString *)imgName
                        block:(CCustomPlaceHolderViewBlock)block {
    if (self = [super initWithFrame:frame]) {
        self.tips = tips;
        self.imgName = imgName;
        self.block = block;
        [self customView];
    }
    
    return self;
}

- (void)customView {
    
    self.label.text = (self.tips.length > 0) ? self.tips : @"没有相关数据";
    
    self.img.image = (self.imgName.length > 0) ? ImageNamed(self.imgName) : ImageNamed(@"");
}


- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.height / 2, self.width, 23)];
        _label.text = @"没有相关数据";
        _label.textColor = RGB_333;
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = FONT(20);
        [self addSubview:_label];
    }
    
    return _label;
}

- (UIImageView *)img {
    if (!_img) {
        CGFloat imgSize = self.width / 3;
        _img = [[UIImageView alloc] initWithFrame:CGRectMake(imgSize, self.label.top - 20 - imgSize, imgSize, imgSize)];
        _img.image = ImageNamed(@"placeholder_img");
        [self addSubview:_img];
        WeakSelf
        [self addTapWithBlock:^{
            if (weakSelf.block) {
                weakSelf.block();
            }
        }];
    }
    
    return _img;
}

@end
