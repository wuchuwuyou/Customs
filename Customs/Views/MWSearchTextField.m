//
//  MWSearchTextField.m
//  Customs
//
//  Created by Murphy on 16/6/13.
//  Copyright © 2016年 Murphy. All rights reserved.
//

#import "MWSearchTextField.h"

@implementation MWSearchTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (CGRect)editingRectForBounds:(CGRect)bounds{
    return CGRectMake(bounds.origin.x + 10, bounds.origin.y, bounds.size.width - 10, bounds.size.height);
}
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + 10, bounds.origin.y, bounds.size.width - 10, bounds.size.height);
}
@end
