//
//  LineIntersects.m
//  cardwar
//
//  Created by darklinden on 14-9-11.
//  Copyright (c) 2014年 darklinden. All rights reserved.
//

#include "LineIntersects.h"

CGLine CGLineMake(CGFloat startX, CGFloat startY, CGFloat endX, CGFloat endY)
{
    CGLine l;
    l.startPoint = CGPointMake(startX, startY);
    l.endPoint = CGPointMake(endX, endY);
    return l;
}

CGLine CGLineMakePoint(CGPoint startPoint, CGPoint endPoint)
{
    CGLine l;
    l.startPoint = startPoint;
    l.endPoint = endPoint;
    return l;
}

bool CGLineEqualToLine(CGLine l1, CGLine l2)
{
    return (CGPointEqualToPoint(l1.startPoint, l2.startPoint)
            && CGPointEqualToPoint(l1.endPoint, l2.endPoint));
}

void CGLineIntersectsLine(CGLine first, CGLine second, CGPoint *point)
{
    int x1 = first.startPoint.x; int y1 = first.startPoint.y;
    int x2 = first.endPoint.x; int y2 = first.endPoint.y;
    
    int x3 = second.startPoint.x; int y3 = second.startPoint.y;
    int x4 = second.endPoint.x; int y4 = second.endPoint.y;
    
    int d = (x1 - x2) * (y3 - y4) - ((y1 - y2) * (x3 - x4));
    
    
    if (d == 0) {
        if (point) {
            *point = CGPointNotFound;
        }
        return;
    }
    
    int xi = ((x3 - x4) * ((x1 * y2) - (y1 * x2)) - ((x1 - x2) * ((x3 * y4) - (y3 * x4)))) / d;
    int yi = ((y3 - y4) * ((x1 * y2) - (y1 * x2)) - ((y1 - y2) * ((x3 * y4) - (y3 * x4)))) / d;
    
    CGPoint p = CGPointMake(xi, yi);
    
    CGFloat ober = 2;
    
    int l1minX = MIN(x1, x2) - ober;
    int l1maxX = MAX(x1, x2) + ober;
    int l1minY = MIN(y1, y2) - ober;
    int l1maxY = MAX(y1, y2) + ober;
    
    CGRect r1 = CGRectMake(l1minX, l1minY, l1maxX - l1minX, l1maxY - l1minY);

    int l2minX = MIN(x3, x4) - ober;
    int l2maxX = MAX(x3, x4) + ober;
    int l2minY = MIN(y3, y4) - ober;
    int l2maxY = MAX(y3, y4) + ober;
    
    CGRect r2 = CGRectMake(l2minX, l2minY, l2maxX - l2minX, l2maxY - l2minY);
    
    if (CGRectContainsPoint(r1, p)
        && CGRectContainsPoint(r2, p)) {
        if (point) {
            *point = p;
        }
    }
    else {
        if (point) {
            *point = CGPointNotFound;
        }
    }
}

void CGLineIntersectsRect(CGLine line, CGRect rect, CGPoint *points, int *cnt)
{
    CGLine l1 = CGLineMake(rect.origin.x, rect.origin.y,
                           rect.origin.x + rect.size.width, rect.origin.y);
    CGLine l2 = CGLineMake(rect.origin.x, rect.origin.y + rect.size.height,
                           rect.origin.x + rect.size.width, rect.origin.y + rect.size.height);
    CGLine l3 = CGLineMake(rect.origin.x, rect.origin.y,
                           rect.origin.x, rect.origin.y + rect.size.height);
    CGLine l4 = CGLineMake(rect.origin.x + rect.size.width, rect.origin.y,
                           rect.origin.x + rect.size.width, rect.origin.y + rect.size.height);
    
    CGPoint p1, p2, p3, p4;
    p1 = p2 = p3 = p4 = CGPointNotFound;
    
    CGLineIntersectsLine(l1, line, &p1);
    
    CGLineIntersectsLine(l2, line, &p2);
    
    CGLineIntersectsLine(l3, line, &p3);
    
    CGLineIntersectsLine(l4, line, &p4);
    
    int n = 0;
    if (!CGPointEqualToPoint(p1, CGPointNotFound)) {
        points[n] = p1;
        n++;
    }
    
    if (!CGPointEqualToPoint(p2, CGPointNotFound)) {
        points[n] = p2;
        n++;
    }
    
    if (!CGPointEqualToPoint(p3, CGPointNotFound)) {
        points[n] = p3;
        n++;
    }
    
    if (!CGPointEqualToPoint(p4, CGPointNotFound)) {
        points[n] = p4;
        n++;
    }
    
    if (cnt) {
        *cnt = n;
    }
}