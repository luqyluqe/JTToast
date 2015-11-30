#import "JTToastConfiguration.h"

@implementation JTToastConfiguration

+(instancetype)defaultConfiguration
{
    JTToastConfiguration* config=[[JTToastConfiguration alloc] init];
    config.duration=JTToastDurationNormal;
    config.gravity=JTToastGravityBottom;
    config.colorStyle=JTToastColorStyleNormal;
    return config;
}

#pragma mark - NSCopying
-(instancetype)copyWithZone:(NSZone *)zone
{
    JTToastConfiguration* copy=[[JTToastConfiguration alloc] init];
    copy.duration=self.duration;
    return copy;
}

@end
