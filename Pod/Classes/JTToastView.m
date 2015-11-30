#import "JTToastView.h"

@implementation JTToastView

- (void)drawRect:(CGRect)rect {
    // Drawing code

    CGFloat width=rect.size.width;
    CGFloat height=rect.size.height;
    CGFloat dimension=MIN(width, height);
    CGFloat radius=0.2*dimension;

    CGContextRef ctx=UIGraphicsGetCurrentContext();
    switch (self.colorStyle) {
        case JTToastColorStyleLight:
            CGContextSetRGBFillColor(ctx, 0.5, 0.5, 0.5, 0.8);
            break;
        case JTToastColorStyleNormal:
            CGContextSetRGBFillColor(ctx, 0.3, 0.3, 0.3, 0.8);
            break;
        case JTToastColorStyleDark:
            CGContextSetRGBFillColor(ctx, 0.1, 0.1, 0.1, 0.8);
            break;
        default:
            break;
    }
    CGContextBeginPath(ctx);

    CGContextMoveToPoint(ctx, radius, 0);
    CGContextAddLineToPoint(ctx, width-radius, 0);
    CGContextAddArcToPoint(ctx, width, 0, width, radius, radius);
    CGContextAddLineToPoint(ctx, width, height-radius);
    CGContextAddArcToPoint(ctx, width, height, width-radius, height, radius);
    CGContextAddLineToPoint(ctx, radius, height);
    CGContextAddArcToPoint(ctx, 0, height, 0, height-radius, radius);
    CGContextAddLineToPoint(ctx, 0, radius);
    CGContextAddArcToPoint(ctx, 0, 0, radius, 0, radius);

    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
}

@end
