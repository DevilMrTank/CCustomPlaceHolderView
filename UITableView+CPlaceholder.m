//
//  UITableView+CPlaceholder.m
//  crd
//
//  Created by 笔记本 on 2017/6/6.
//  Copyright © 2017年 crd. All rights reserved.
//

#import "UITableView+CPlaceholder.h"
#import "NSObject+CRuntime.h"
#import <objc/message.h>

@implementation UITableView (CPlaceholder)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(reloadData) withMethod:@selector(c_reloadData)];
    });
}

- (void)setPlaceHolderView:(UIView *)placeHolderView {
    
    objc_setAssociatedObject(self, @selector(placeHolderView), placeHolderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)placeHolderView {
    
    return objc_getAssociatedObject(self, @selector(placeHolderView));
}


- (void)c_reloadData {
    
    [self c_checkEmpty];
    [self c_reloadData];
}

- (void)c_checkEmpty {
    
    BOOL isEmpty = YES;
    id<UITableViewDataSource> src = self.dataSource;
    NSInteger sections = 1;
    if ([src respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        sections = [src numberOfSectionsInTableView:self];
    }
    for (int i = 0; i < sections; i++) {
        NSInteger rows = [src tableView:self numberOfRowsInSection:i];
        if (rows) {
            isEmpty = NO;
        }
    }
    if (isEmpty) {
        [self.placeHolderView removeFromSuperview];
        [self addSubview:self.placeHolderView];
    }else{
        [self.placeHolderView removeFromSuperview];
    }
}

@end
