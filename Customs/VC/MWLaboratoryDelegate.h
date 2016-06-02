//
//  MWLaboratoryDelegate.h
//  Customs
//
//  Created by Murphy on 16/6/2.
//  Copyright © 2016年 Murphy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MWLaboratoryDelegate <NSObject>
// 1 关注 0 取消关注
- (void)attentionWithStatus:(BOOL)status;
@end
