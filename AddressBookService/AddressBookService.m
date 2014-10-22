//
//  AddressBookService.m
//  FindLocationDemo
//
//  Created by Peter Lee on 14-4-11.
//  Copyright (c) 2014年 Peter Lee. All rights reserved.
//

#import "AddressBookService.h"


@implementation AddressBookService
{
    NSString* tempNumber;
}

Single_implementation(AddressBookService);


-(NSMutableDictionary *)getAllAddressBookPeopleInfo
{
    //取得本地通信录名柄
    ABAddressBookRef tmpAddressBook = nil;
    tempNumber = nil;
    if ([[UIDevice currentDevice].systemVersion floatValue]>=6.0) {
        tmpAddressBook=ABAddressBookCreateWithOptions(NULL, NULL);
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        ABAddressBookRequestAccessWithCompletion(tmpAddressBook, ^(bool greanted, CFErrorRef error){
            dispatch_semaphore_signal(sema);
        });
        
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        //dispatch_release(sema);
    }else{
        tmpAddressBook = ABAddressBookCreate();
    }
    //取得本地所有联系人记录
    if (tmpAddressBook == nil) {
        return nil;
    };
    
    NSArray* tmpPeoples = (NSArray*)CFBridgingRelease(ABAddressBookCopyArrayOfAllPeople(tmpAddressBook));
    NSMutableDictionary *peopleInfoDic = [NSMutableDictionary dictionary];
    NSMutableArray * peopleArray = [NSMutableArray array];
    
    for(id tmpPerson in tmpPeoples){
        
        AddressBookPeopleInfo *peopleInfo = [[AddressBookPeopleInfo alloc] init];
        //获取的联系人单一属性:First name
        peopleInfo.peopleFirstName = (NSString*)CFBridgingRelease(ABRecordCopyValue(CFBridgingRetain(tmpPerson), kABPersonFirstNameProperty));
        
        //获取的联系人单一属性:Last name
        peopleInfo.peopleLastName = (NSString*)CFBridgingRelease(ABRecordCopyValue(CFBridgingRetain(tmpPerson), kABPersonLastNameProperty));
        
        //获取联系人的middle name
        peopleInfo.peopleMidlleName = (NSString*)CFBridgingRelease(ABRecordCopyValue(CFBridgingRetain(tmpPerson), kABPersonMiddleNamePhoneticProperty));
       
        //获取的联系人单一属性:Nickname
        peopleInfo.peopleNickName = (NSString*)CFBridgingRelease(ABRecordCopyValue(CFBridgingRetain(tmpPerson), kABPersonNicknameProperty));
   
        //读取prefix前缀
        peopleInfo.peoplePrefix = (NSString*)CFBridgingRelease(ABRecordCopyValue(CFBridgingRetain(tmpPerson), kABPersonPrefixProperty));
        
        //读取suffix后缀
        peopleInfo.peopleSuffix = (NSString*)CFBridgingRelease(ABRecordCopyValue(CFBridgingRetain(tmpPerson), kABPersonSuffixProperty));
        
        //读取firstname拼音音标
        peopleInfo.peopleFirstnamePhonetic = (NSString*)CFBridgingRelease(ABRecordCopyValue(CFBridgingRetain(tmpPerson), kABPersonFirstNamePhoneticProperty));
        
        //读取lastname拼音音标
        peopleInfo.peopleLastnamePhonetic = (NSString*)CFBridgingRelease(ABRecordCopyValue(CFBridgingRetain(tmpPerson), kABPersonLastNamePhoneticProperty));
        
        //读取middlename拼音音标
        peopleInfo.peopleMiddlenamePhonetic = (NSString*)CFBridgingRelease(ABRecordCopyValue(CFBridgingRetain(tmpPerson), kABPersonMiddleNamePhoneticProperty));
        
//        peopleInfo.peopleName = [NSString stringWithFormat:@"%@%@%@",peopleInfo.peopleLastName,peopleInfo.peopleMidlleName,peopleInfo.peopleFirstName];
        
        if (!peopleInfo.peopleFirstName) {
         peopleInfo.peopleName = [NSString stringWithFormat:@"%@",peopleInfo.peopleLastName];
        }
        else
        {
            peopleInfo.peopleName = [NSString stringWithFormat:@"%@",peopleInfo.peopleFirstName];

        }
       
     
        
        //获取的联系人单一属性:Company name
        peopleInfo.peopleCompanyName = (NSString*)CFBridgingRelease(ABRecordCopyValue(CFBridgingRetain(tmpPerson), kABPersonOrganizationProperty));
    
        //获取的联系人单一属性:Job Title
        peopleInfo.peopleJobName = (NSString*)CFBridgingRelease(ABRecordCopyValue(CFBridgingRetain(tmpPerson), kABPersonJobTitleProperty));
        
        //获取的联系人单一属性:Department name
        peopleInfo.peopleDepartmentName = (NSString*)CFBridgingRelease(ABRecordCopyValue(CFBridgingRetain(tmpPerson), kABPersonDepartmentProperty));
        
        //获取的联系人单一属性:Email(s)
        ABMultiValueRef tmpEmails = ABRecordCopyValue(CFBridgingRetain(tmpPerson), kABPersonEmailProperty);
        
        for(NSInteger j = 0; j < ABMultiValueGetCount(tmpEmails); j++){
            switch (j) {
                case 0:
                    peopleInfo.peopleHomeEmailNo = (NSString*)CFBridgingRelease(ABMultiValueCopyValueAtIndex(tmpEmails, j));
                    break;
                case 1:
                    peopleInfo.peopleWorkEmailNo = (NSString*)CFBridgingRelease(ABMultiValueCopyValueAtIndex(tmpEmails, j));
                    break;
                case 2:
                    peopleInfo.peopleOtherEmailNo = (NSString*)CFBridgingRelease(ABMultiValueCopyValueAtIndex(tmpEmails, j));
                    break;
                default:
                    break;
            }
        }
    
        CFRelease(tmpEmails);
        
        //获取的联系人单一属性:Birthday
        peopleInfo.peopleBirthday = (NSDate*)CFBridgingRelease(ABRecordCopyValue(CFBridgingRetain(tmpPerson), kABPersonBirthdayProperty));
        
//        //获取的联系人单一属性:Note
//        NSString* tmpNote = (NSString*)CFBridgingRelease(ABRecordCopyValue(CFBridgingRetain(tmpPerson), kABPersonNoteProperty));
        
        //获取的联系人单一属性:Generic phone number
        ABMultiValueRef tmpPhones = ABRecordCopyValue(CFBridgingRetain(tmpPerson), kABPersonPhoneProperty);
        
        for(NSInteger j = 0; j < ABMultiValueGetCount(tmpPhones); j++)
        {
            switch (j) {
                case 0:
                {
                peopleInfo.peopleHomePhoneNo = (NSString*)CFBridgingRelease(ABMultiValueCopyValueAtIndex(tmpPhones, j));
                peopleInfo.peopleHomePhoneNo = [peopleInfo.peopleHomePhoneNo stringByReplacingOccurrencesOfString:@" " withString:@""];
                peopleInfo.peopleHomePhoneNo = [peopleInfo.peopleHomePhoneNo stringByReplacingOccurrencesOfString:@" " withString:@""];
//              peopleInfo.peopleHomePhoneNo = [peopleInfo.peopleHomePhoneNo stringByReplacingOccurrencesOfString:@"(" withString:@""];
//              peopleInfo.peopleHomePhoneNo = [peopleInfo.peopleHomePhoneNo stringByReplacingOccurrencesOfString:@")" withString:@""];
                peopleInfo.peopleHomePhoneNo = [peopleInfo.peopleHomePhoneNo stringByReplacingOccurrencesOfString:@"-" withString:@""];
                peopleInfo.peopleHomePhoneNo = [peopleInfo.peopleHomePhoneNo stringByReplacingOccurrencesOfString:@" " withString:@""];
                }
                    break;
                case 1:
                    peopleInfo.peopleWorkPhoneNo = (NSString*)CFBridgingRelease(ABMultiValueCopyValueAtIndex(tmpPhones, j));
                    break;
                case 2:
                    peopleInfo.peopleIphonePhoneNo = (NSString*)CFBridgingRelease(ABMultiValueCopyValueAtIndex(tmpPhones, j));
                    break;
                case 3:
                    peopleInfo.peopleMobilePhoneNo = (NSString*)CFBridgingRelease(ABMultiValueCopyValueAtIndex(tmpPhones, j));
                    break;
                case 4:
                    peopleInfo.peopleMainPhoneNo = (NSString*)CFBridgingRelease(ABMultiValueCopyValueAtIndex(tmpPhones, j));
                    break;
                default:
                    break;
            }
        }
        CFRelease(tmpPhones);
        peopleInfo.peopleHomePhoneNo = (peopleInfo.peopleHomePhoneNo ? peopleInfo.peopleHomePhoneNo:(peopleInfo.peopleWorkPhoneNo ? peopleInfo.peopleWorkPhoneNo:(peopleInfo.peopleIphonePhoneNo ? peopleInfo.peopleIphonePhoneNo:(peopleInfo.peopleMobilePhoneNo ? peopleInfo.peopleMobilePhoneNo:(peopleInfo.peopleMainPhoneNo ? peopleInfo.peopleMainPhoneNo:nil)))));
        if (peopleInfo.peopleHomePhoneNo)
        {
           // [peopleInfoDic setObject:peopleInfo forKey:peopleInfo.peopleHomePhoneNo];
            [peopleInfoDic setValue:peopleInfo forKey:peopleInfo.peopleHomePhoneNo];
            NSMutableArray * arr = [NSMutableArray array];
         
           
            
        }
    }
    
    CFRelease(tmpAddressBook);
    return peopleInfoDic;
}

@end
