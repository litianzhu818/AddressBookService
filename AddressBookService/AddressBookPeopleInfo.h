//
//  AddressBookPeopleInfo.h
//  FindLocationDemo
//
//  Created by Peter Lee on 14-4-14.
//  Copyright (c) 2014年 Peter Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressBookPeopleInfo : NSObject<NSCoding,NSCopying>

@property (strong, nonatomic) NSString *peopleMobilePhoneNo;                //移动电话号码
@property (strong, nonatomic) NSString *peopleIphonePhoneNo;                //iphone电话号码
@property (strong, nonatomic) NSString *peopleHomePhoneNo;                  //住宅电话号码
@property (strong, nonatomic) NSString *peopleWorkPhoneNo;                  //工作电话号码
@property (strong, nonatomic) NSString *peopleMainPhoneNo;                  //主要电话号码
@property (strong, nonatomic) NSString *peopleHomeEmailNo;                  //住宅email
@property (strong, nonatomic) NSString *peopleWorkEmailNo;                  //工作email
@property (strong, nonatomic) NSString *peopleOtherEmailNo;                 //其他email
@property (strong, nonatomic) NSString *peopleName;                         //联系人姓名
@property (strong, nonatomic) NSString *peopleFirstName;                    //第一name
@property (strong, nonatomic) NSString *peopleMidlleName;                   //中间姓名
@property (strong, nonatomic) NSString *peopleLastName;                     //最后姓名
@property (strong, nonatomic) NSString *peopleNickName;                     //联系人昵称
@property (strong, nonatomic) NSString *peoplePrefix;                       //Prefix前缀
@property (strong, nonatomic) NSString *peopleSuffix;                       //suffix后缀
@property (strong, nonatomic) NSString *peopleFirstnamePhonetic;            //Firstname的拼音
@property (strong, nonatomic) NSString *peopleMiddlenamePhonetic;           //Middlename的拼音
@property (strong, nonatomic) NSString *peopleLastnamePhonetic;             //Lastname的拼音
@property (strong, nonatomic) NSDate   *peopleBirthday;                     //联系人生日
@property (strong, nonatomic) NSString *peopleCompanyName;                  //联系人公司名称
@property (strong, nonatomic) NSString *peopleJobName;                      //联系人工作名称
@property (strong, nonatomic) NSString *peopleDepartmentName;               //联系人Department名称
@property (strong,nonatomic)  NSString * personID;
@end
