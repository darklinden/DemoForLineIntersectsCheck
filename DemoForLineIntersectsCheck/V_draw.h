//
//  V_draw.h
//  DemoForLineIntersectsCheck
//
//  Created by darklinden on 14-9-12.
//  Copyright (c) 2014年 darklinden. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LineIntersects.h"

@interface V_draw : UIView
@property (nonatomic, assign) CGLine lmove;
@property (nonatomic, assign) CGLine lcheck;
@property (nonatomic, assign) CGRect rcheck;

@end
