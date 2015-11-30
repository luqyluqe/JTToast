#import <Foundation/Foundation.h>

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

@property (nonatomic) JTToastDuration duration;
@property (nonatomic) JTToastGravity gravity;
@property (nonatomic) JTToastColorStyle colorStyle;

+(instancetype)defaultConfiguration;

@end
