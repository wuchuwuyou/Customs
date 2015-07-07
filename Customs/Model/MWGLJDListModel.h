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
@property (nonatomic,strong) NSString *SOURCE_NO;

///-- CODE_TS：决定税号
@property (nonatomic,strong) NSString *CODE_TS;

///-- G_MODEL：规格型号
@property (nonatomic,strong) NSString *G_MODEL;

///-- G_NAME ：商品名称（中文）
@property (nonatomic,strong) NSString *G_NAME;

///-- G_NAME_EN ：商品名称（英文）
@property (nonatomic,strong) NSString *G_NAME_EN;

///-- G_NAME_OTHER ：商品名称（其他）
@property (nonatomic,strong) NSString *G_NAME_OTHER;

///-- G_DESCRIPTION ：商品描述
@property (nonatomic,strong) NSString *G_DESCRIPTION;

///-- CLASSIFY_ADJUST ：归类意见
@property (nonatomic,strong) NSString *CLASSIFY_ADJUST;

@end
