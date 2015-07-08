//
//  MWLabModel.h
//  Customs
//
//  Created by Tiny on 15/7/8.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "JSONModel.h"

@interface MWLabModel : JSONModel
//"ENTRYID": "020720151123456789",
@property (nonatomic,strong) NSString *ENTRYID;

//"APPLICATIONID": "2015032301",
@property (nonatomic,strong) NSString *APPLICATIONID;

//"APPNAME": "具有书写或绘画面的石板、黑板",
@property (nonatomic,strong) NSString *APPNAME;

//"APPSTATUS": "已签发",
@property (nonatomic,strong) NSString *APPSTATUS;

//"UPDATETIME": "2015/5/21 11:44:36"
@property (nonatomic,strong) NSString *UPDATETIME;

@end
