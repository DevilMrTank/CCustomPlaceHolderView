//
//  CCustomPlaceHolderView.h
//  crd
//
//  Created by 笔记本 on 2017/6/30.
//  Copyright © 2017年 crd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableView+CPlaceholder.h"

typedef void(^CCustomPlaceHolderViewBlock)(void);

@interface CCustomPlaceHolderView : UIView

@property (nonatomic, copy) CCustomPlaceHolderViewBlock block;

/**
 初始化列表
 */
- (instancetype)initWithFrame:(CGRect)frame;

- (instancetype)initWithFrame:(CGRect)frame
                      imgName:(NSString *)imgName;

- (instancetype)initWithFrame:(CGRect)frame
                         tips:(NSString *)tips;

- (instancetype)initWithFrame:(CGRect)frame block:(CCustomPlaceHolderViewBlock)block;

- (instancetype)initWithFrame:(CGRect)frame
                      imgName:(NSString *)imgName
                        block:(CCustomPlaceHolderViewBlock)block;

- (instancetype)initWithFrame:(CGRect)frame
                         tips:(NSString *)tips
                        block:(CCustomPlaceHolderViewBlock)block;

- (instancetype)initWithFrame:(CGRect)frame
                         tips:(NSString *)tips
                      imgName:(NSString *)imgName
                        block:(CCustomPlaceHolderViewBlock)block;

@end
