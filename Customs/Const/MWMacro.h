//
//  MWMacro.h
//  Customs
//
//  Created by Tiny on 15/6/9.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#ifndef Customs_MWMacro_h
#define Customs_MWMacro_h

#ifdef DEBUG

#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil

#endif

#endif
