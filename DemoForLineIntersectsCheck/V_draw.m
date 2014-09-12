//
//  V_draw.m
//  DemoForLineIntersectsCheck
//
//  Created by darklinden on 14-9-12.
//  Copyright (c) 2014年 darklinden. All rights reserved.
//

#import "V_draw.h"

@implementation V_draw

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _lmove = CGLineNotFound;
        _lcheck = CGLineNotFound;
        _rcheck = CGRectZero;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef contxt = UIGraphicsGetCurrentContext();

    // Drawing code
    if (!CGLineEqualToLine(_lmove, CGLineNotFound)) {
        CGContextSetFillColorWithColor(contxt, [UIColor redColor].CGColor);
        CGContextSetStrokeColorWithColor(contxt, [UIColor redColor].CGColor);
        CGContextSetLineWidth(contxt, 3);
        CGContextMoveToPoint(contxt, _lmove.startPoint.x, _lmove.startPoint.y);
        CGContextAddLineToPoint(contxt, _lmove.endPoint.x, _lmove.endPoint.y);
        CGContextStrokePath(contxt);
    }
    
    if (!CGLineEqualToLine(_lcheck, CGLineNotFound)) {
        CGContextSetFillColorWithColor(contxt, [UIColor greenColor].CGColor);
        CGContextSetStrokeColorWithColor(contxt, [UIColor greenColor].CGColor);
        CGContextSetLineWidth(contxt, 3);
        CGContextMoveToPoint(contxt, _lcheck.startPoint.x, _lcheck.startPoint.y);
        CGContextAddLineToPoint(contxt, _lcheck.endPoint.x, _lcheck.endPoint.y);
        CGContextStrokePath(contxt);
    }
    
    if (!CGLineEqualToLine(_lmove, CGLineNotFound)
        && !CGLineEqualToLine(_lcheck, CGLineNotFound)) {
        
        CGPoint p;
        p = CGPointNotFound;
        
        CGLineIntersectsLine(_lmove, _lcheck, &p);
        
        if (!CGPointEqualToPoint(p, CGPointNotFound)) {
            CGContextSetFillColorWithColor(contxt, [UIColor blueColor].CGColor);
            CGContextSetStrokeColorWithColor(contxt, [UIColor blueColor].CGColor);
            
            CGFloat offset = 5;
            CGRect rect;
            rect.origin.x = p.x - offset;
            rect.origin.y = p.y - offset;
            rect.size.width = offset * 2;
            rect.size.height = offset * 2;
            
            CGContextFillEllipseInRect(contxt, rect);
        }
    }
    
    if (!CGRectEqualToRect(_rcheck, CGRectZero)) {
        CGContextSetStrokeColorWithColor(contxt, [UIColor darkGrayColor].CGColor);
        CGContextSetLineWidth(contxt, 3);
        CGContextStrokeRect(contxt, _rcheck);
    }
    
    if (!CGLineEqualToLine(_lmove, CGLineNotFound)
        && !CGRectEqualToRect(_rcheck, CGRectZero)) {
        CGPoint ps[2] = {CGPointNotFound, CGPointNotFound};
        int cnt = 0;
        
        CGLineIntersectsRect(_lmove, _rcheck, &ps[0], &cnt);
        
        for (int i = 0; i < cnt; i++) {
            CGPoint p = ps[i];
            if (!CGPointEqualToPoint(p, CGPointNotFound)) {
                CGContextSetFillColorWithColor(contxt, [UIColor blueColor].CGColor);
                CGContextSetStrokeColorWithColor(contxt, [UIColor blueColor].CGColor);
                
                CGFloat offset = 5;
                CGRect rect;
                rect.origin.x = p.x - offset;
                rect.origin.y = p.y - offset;
                rect.size.width = offset * 2;
                rect.size.height = offset * 2;
                
                CGContextFillEllipseInRect(contxt, rect);
            }
        }
        
    }
}

- (void)setLmove:(CGLine)lmove
{
    _lmove = lmove;
    [self setNeedsDisplay];
}

- (void)setLcheck:(CGLine)lcheck
{
    _lcheck = lcheck;
    [self setNeedsDisplay];
}

- (void)setRcheck:(CGRect)rcheck
{
    _rcheck = rcheck;
    [self setNeedsDisplay];
}

@end
