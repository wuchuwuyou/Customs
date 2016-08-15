//
//  MWGLJDListModel.h
//  Customs
//
//  Created by Tiny on 15/7/6.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "JSONModel.h"

@interface MWGLJDListModel : JSONModel
///-- SOURCE_NO： 相关编号
@property (nonatomic,strong) NSString <Optional>*SOURCE_NO;

///-- CODE_TS：决定税号
@property (nonatomic,strong) NSString <Optional>*CODE_TS;

///-- G_MODEL：规格型号
@property (nonatomic,strong) NSString <Optional>*G_MODEL;

///-- G_NAME ：商品名称（中文）
@property (nonatomic,strong) NSString <Optional>*G_NAME;

///-- G_NAME_EN ：商品名称（英文）
@property (nonatomic,strong) NSString <Optional>*G_NAME_EN;

///-- G_NAME_OTHER ：商品名称（其他）
@property (nonatomic,strong) NSString <Optional>*G_NAME_OTHER;

///-- G_DESCRIPTION ：商品描述
@property (nonatomic,strong) NSString <Optional>*G_DESCRIPTION;

///-- CLASSIFY_ADJUST ：归类意见
@property (nonatomic,strong) NSString <Optional>*CLASSIFY_ADJUST;


@property (nonatomic,strong) NSString <Optional>*DATA_SOURCE_NAME;
@property (nonatomic,strong) NSNumber <Optional>*DATA_SOURCE_TYPE;
@property (nonatomic,strong) NSString <Optional>*DEPARTMENT;
@property (nonatomic,strong) NSString <Optional>*INURE_TIME;
@property (nonatomic,strong) NSString <Optional>*SOURCE_GUID;


@end
