#import "JTToastConfiguration.h"

@implementation JTToastConfiguration

+(instancetype)defaultConfiguration
{
    JTToastConfiguration* config=[[JTToastConfiguration alloc] init];
    config.font=[UIFont systemFontOfSize:15];
    config.duration=JTToastDurationNormal;
    config.gravity=JTToastGravityBottom;
    config.colorStyle=JTToastColorStyleNormal;
    config.widthLimit=200;
    config.paddingHorizontal=12;
    config.paddingVertical=8;
    return config;
}

#pragma mark - NSCopying
-(instancetype)copyWithZone:(NSZone *)zone
{
    JTToastConfiguration* copy=[[JTToastConfiguration alloc] init];
    copy.font=self.font;
    copy.duration=self.duration;
    copy.gravity=self.gravity;
    copy.colorStyle=self.colorStyle;
    copy.widthLimit=self.widthLimit;
    copy.paddingHorizontal=self.paddingHorizontal;
    copy.paddingVertical=self.paddingVertical;
    return copy;
}

@end
