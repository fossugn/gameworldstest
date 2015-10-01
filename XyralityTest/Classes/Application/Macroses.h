//
//  Macroses.h
//  XyralityTest
//
//  Created by Eugene Kutia on 10/1/15.
//  Copyright © 2015 EugeneKutia. All rights reserved.
//

#ifndef Macroses_h
#define Macroses_h

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

// Colors
#define XTUIColorFromRGB(rgbValue)                                       \
    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
                    green:((float)((rgbValue & 0xFF00  ) >>  8)) / 255.0 \
                     blue:((float)( rgbValue & 0xFF    )       ) / 255.0 \
                    alpha:1.0]

#define XT_COLOR_SOLID_BUTTON_ACTIVE                XTUIColorFromRGB(0x6fca77)
#define XT_COLOR_SOLID_BUTTON_INACTIVE              XTUIColorFromRGB(0xD2D2D2)
#define XT_COLOR_YELLOW_GREEN                       XTUIColorFromRGB(0xD8D90A)
#endif /* Macroses_h */
