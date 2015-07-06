//
//  MWGLJDReqModel.h
//  Customs
//
//  Created by Tiny on 15/7/6.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "JSONModel.h"

@interface MWGLJDReqModel : JSONModel

//sourceNo=1&gName=2&codeTS=3&gModel=4&gNameEn=5&gNameOther=6
/// 其他名称
@property (nonatomic,strong) NSString *gNameOther;
/// 英文名称
@property (nonatomic,strong) NSString *gNameEn;
/// 规格型号
@property (nonatomic,strong) NSString *gModel;
/// 决定税号
@property (nonatomic,strong) NSString *codeTS;
/// 商品名称
@property (nonatomic,strong) NSString *gName;
/// 相关编号
@property (nonatomic,strong) NSString *sourceNo;


//@property (nonatomic,strong) NSString *dataSourceType;

@end
