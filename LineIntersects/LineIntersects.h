//
//  LineIntersects.h
//  cardwar
//
//  Created by darklinden on 14-9-11.
//  Copyright (c) 2014年 darklinden. All rights reserved.
//

/*
    http://stackoverflow.com/questions/12909008/how-to-find-the-closing-pathtwo-line-intersection-in-iphone-sdk
 */

#ifndef __cardwar__LineIntersects__
#define __cardwar__LineIntersects__

#import <CoreGraphics/CoreGraphics.h>

#define CGPointNotFound CGPointMake(__FLT_MAX__, __FLT_MAX__)
#define CGLineNotFound CGLineMakePoint(CGPointNotFound, CGPointNotFound)

struct CGLine {
    CGPoint startPoint;
    CGPoint endPoint;
};
typedef struct CGLine CGLine;

CGLine CGLineMake(CGFloat startX, CGFloat startY, CGFloat endX, CGFloat endY);
CGLine CGLineMakePoint(CGPoint startPoint, CGPoint endPoint);
bool CGLineEqualToLine(CGLine l1, CGLine l2);

void CGLineIntersectsLine(CGLine first, CGLine second, CGPoint *point);
void CGLineIntersectsRect(CGLine line, CGRect rect, CGPoint *points, int *cnt);

#endif /* defined(__cardwar__LineIntersects__) */
