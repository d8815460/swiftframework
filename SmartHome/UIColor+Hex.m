//
//  UIColor+Hex.h
//  UIColor+Hex.h
//
//  Created by jakey_lee on 12/12/19.
//  Copyright (c) 2012年 jakey_lee. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor*) colorWithHexRed: (int)red green: (int)green blue: (int)blue alpha: (float)alpha
{
    return [UIColor colorWithRed:(float)red/255.0f green:(float)green/255.0f blue:(float)blue/255.0f alpha:alpha];
}

@end
