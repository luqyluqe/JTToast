#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JTToast : NSObject

+(JTToast*)makeText:(NSString*)text;
-(void)showInView:(UIView*)containerView size:(CGSize)size;

@end
