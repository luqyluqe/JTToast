#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JTToastConfiguration.h"

@interface JTToast : NSObject

+(JTToast*)toastWithText:(NSString*)text;
+(JTToast*)toastWithText:(NSString*)text configuration:(JTToastConfiguration*)config;

-(void)show;
-(void)showInView:(UIView*)containerView;
-(void)showInView:(UIView*)containerView size:(CGSize)size;

@end
