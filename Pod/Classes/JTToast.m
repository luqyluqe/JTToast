#import "JTToast.h"
#import "JTToastView.h"

@interface JTToast ()

@property (strong,nonatomic) NSString* text;
@property (strong,nonatomic) JTToastView* view;
@property (strong,nonatomic) JTToastConfiguration* config;

@end

@implementation JTToast

+(JTToast*)toastWithText:(NSString *)text
{
    return [JTToast toastWithText:text configuration:[JTToastConfiguration defaultConfiguration]];
}

+(JTToast*)toastWithText:(NSString *)text configuration:(JTToastConfiguration *)config
{
    JTToast* toast=[[JTToast alloc] init];
    toast.text=text;
    toast.config=config;
    return toast;
}

-(void)show
{
    UIWindow* window=[[UIApplication sharedApplication] keyWindow];
    [self showInView:window];
}

-(void)showInView:(UIView *)containerView
{
    CGRect boundingRect=[self.text boundingRectWithSize:CGSizeMake(self.config.widthLimit, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.config.font} context:nil];
    [self showInView:containerView size:CGSizeMake(boundingRect.size.width+2*self.config.paddingHorizontal, boundingRect.size.height+2*self.config.paddingVertical)];
}

-(void)showInView:(UIView *)containerView size:(CGSize)size
{
    self.view=[[JTToastView alloc] initWithFrame:CGRectMake(0, 0, size.width,size.height)];
    UILabel* label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width-2*self.config.paddingHorizontal,size.height-2*self.config.paddingVertical)];
    label.numberOfLines=0;
    label.textAlignment=NSTextAlignmentCenter;
    label.center=self.view.center;
    label.textColor=[UIColor whiteColor];
    label.font=self.config.font;
    label.text=self.text;
    [self.view addSubview:label];
    
    CGRect bounds=containerView.bounds;
    CGPoint origin=bounds.origin;
    CGSize containerSize=bounds.size;
    CGFloat xCenter=origin.x+0.5*containerSize.width;
    CGFloat yCenter=origin.y+0.5*containerSize.height;
    CGFloat yTop=origin.y+0.3*containerSize.height;
    CGFloat yBottom=origin.y+0.7*containerSize.height;
    
    // gravity
    switch (self.config.gravity) {
        case JTToastGravityTop:
        {
            self.view.center=CGPointMake(xCenter, yTop);
            break;
        }
        case JTToastGravityCenter:
        {
            self.view.center=CGPointMake(xCenter, yCenter);
            break;
        }
        case JTToastGravityBottom:
        {
            self.view.center=CGPointMake(xCenter, yBottom);
            break;
        }
        default:
            break;
    }
    
    // Duration
    float duration=0;
    switch (self.config.duration) {
        case JTToastDurationLong:
            duration=5;
            break;
        case JTToastDurationNormal:
            duration=3;
            break;
        case JTToastDurationShort:
            duration=1;
            break;
        default:
            break;
    }
    
    self.view.colorStyle=self.config.colorStyle;
    self.view.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    [containerView addSubview:self.view];
    
    // Fade in and fade out
    self.view.alpha=0;
    float fadeInDuration=0.1*duration;
    float fadeOutDuration=0.3*duration;
    [UIView animateWithDuration:fadeInDuration delay:0 options:0 animations:^{
        self.view.alpha=1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:fadeOutDuration delay:duration-fadeInDuration-fadeOutDuration options:0 animations:^{
            self.view.alpha=0;
        } completion:nil];
    }];
//    [UIView animateWithDuration:animationDuration delay:duration-animationDuration options:0 animations:^{
//        self.view.alpha=0;
//    } completion:nil];
    
    [NSTimer scheduledTimerWithTimeInterval:duration target:self selector:@selector(cancelToast) userInfo:nil repeats:NO];
}

-(void)cancelToast
{
    [self.view removeFromSuperview];
}

@end
