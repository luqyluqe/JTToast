#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JTToastDuration){
    JTToastDurationLong,
    JTToastDurationNormal,
    JTToastDurationShort
};

typedef NS_ENUM(NSInteger, JTToastGravity){
    JTToastGravityTop,
    JTToastGravityCenter,
    JTToastGravityBottom
};

typedef NS_ENUM(NSInteger, JTToastColorStyle){
    JTToastColorStyleLight,
    JTToastColorStyleNormal,
    JTToastColorStyleDark
};

@interface JTToastConfiguration : NSObject<NSCopying>

@property (nonatomic,copy) UIFont* font;
@property (nonatomic,assign) JTToastDuration duration;
@property (nonatomic,assign) JTToastGravity gravity;
@property (nonatomic,assign) JTToastColorStyle colorStyle;
@property (nonatomic,assign) CGFloat widthLimit;
@property (nonatomic,assign) CGFloat paddingHorizontal;
@property (nonatomic,assign) CGFloat paddingVertical;

+(instancetype)defaultConfiguration;

@end
