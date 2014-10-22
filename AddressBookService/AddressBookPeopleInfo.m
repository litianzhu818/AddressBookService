//
//  AddressBookPeopleInfo.m
//  FindLocationDemo
//
//  Created by Peter Lee on 14-4-14.
//  Copyright (c) 2014年 Peter Lee. All rights reserved.
//

#import "AddressBookPeopleInfo.h"

@implementation AddressBookPeopleInfo

#pragma mark -
#pragma mark NSCopying Methods
- (id)copyWithZone:(NSZone *)zone
{
    AddressBookPeopleInfo *newPeopleInfo = [[AddressBookPeopleInfo allocWithZone:zone] init];
    
    newPeopleInfo.peopleMobilePhoneNo = self.peopleMobilePhoneNo;
    newPeopleInfo.peopleIphonePhoneNo = self.peopleIphonePhoneNo;
    newPeopleInfo.peopleHomePhoneNo = self.peopleHomePhoneNo;                 
    newPeopleInfo.peopleWorkPhoneNo = self.peopleWorkPhoneNo;                  
    newPeopleInfo.peopleMainPhoneNo = self.peopleMainPhoneNo;
    newPeopleInfo.peopleHomeEmailNo = self.peopleHomeEmailNo;                
    newPeopleInfo.peopleWorkEmailNo = self.peopleWorkEmailNo;                 
    newPeopleInfo.peopleOtherEmailNo = self.peopleOtherEmailNo;                
    newPeopleInfo.peopleName = self.peopleName;                         
    newPeopleInfo.peopleFirstName = self.peopleFirstName;                   
    newPeopleInfo.peopleMidlleName = self.peopleMidlleName;                  
    newPeopleInfo.peopleLastName = self.peopleLastName;                     
    newPeopleInfo.peopleNickName = self.peopleNickName;                     
    newPeopleInfo.peoplePrefix = self.peoplePrefix;                     
    newPeopleInfo.peopleSuffix = self.peopleSuffix;                       
    newPeopleInfo.peopleFirstnamePhonetic = self.peopleFirstnamePhonetic;            
    newPeopleInfo.peopleMiddlenamePhonetic = self.peopleMiddlenamePhonetic;           
    newPeopleInfo.peopleLastnamePhonetic = self.peopleLastnamePhonetic;             
    newPeopleInfo.peopleBirthday = self.peopleBirthday;
    newPeopleInfo.peopleCompanyName = self.peopleCompanyName;                  
    newPeopleInfo.peopleJobName = self.peopleJobName;                      
    newPeopleInfo.peopleDepartmentName = self.peopleDepartmentName;
    newPeopleInfo.personID = self.personID;
    
    return newPeopleInfo;
}

#pragma mark -
#pragma mark NSCoding Methods
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.peopleMobilePhoneNo forKey:@"peopleMobilePhoneNo"];
    [aCoder encodeObject:self.peopleIphonePhoneNo forKey:@"peopleIphonePhoneNo"];
    [aCoder encodeObject:self.peopleHomePhoneNo forKey:@"peopleHomePhoneNo"];
    [aCoder encodeObject:self.peopleWorkPhoneNo forKey:@"peopleWorkPhoneNo"];
    [aCoder encodeObject:self.peopleHomeEmailNo forKey:@"peopleHomeEmailNo"];
    [aCoder encodeObject:self.peopleWorkEmailNo forKey:@"peopleWorkEmailNo"];
    [aCoder encodeObject:self.peopleOtherEmailNo forKey:@"peopleOtherEmailNo"];
    [aCoder encodeObject:self.peopleName forKey:@"peopleName"];
    [aCoder encodeObject:self.peopleFirstName forKey:@"peopleFirstName"];
    [aCoder encodeObject:self.peopleMidlleName forKey:@"peopleMidlleName"];
    [aCoder encodeObject:self.peopleLastName forKey:@"peopleLastName"];
    [aCoder encodeObject:self.peopleNickName forKey:@"peopleNickName"];
    [aCoder encodeObject:self.peoplePrefix forKey:@"peoplePrefix"];
    [aCoder encodeObject:self.peopleSuffix forKey:@"peopleSuffix"];
    [aCoder encodeObject:self.peopleFirstnamePhonetic forKey:@"peopleFirstnamePhonetic"];
    [aCoder encodeObject:self.peopleMiddlenamePhonetic forKey:@"peopleMiddlenamePhonetic"];
    [aCoder encodeObject:self.peopleLastnamePhonetic forKey:@"peopleLastnamePhonetic"];
    [aCoder encodeObject:self.peopleBirthday forKey:@"peopleBirthday"];
    [aCoder encodeObject:self.peopleCompanyName forKey:@"peopleCompanyName"];
    [aCoder encodeObject:self.peopleJobName forKey:@"peopleJobName"];
    [aCoder encodeObject:self.peopleDepartmentName forKey:@"peopleDepartmentName"];
    [aCoder encodeObject:self.personID forKey:@"personID"];
    
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self.peopleMobilePhoneNo = [[aDecoder decodeObjectForKey:@"peopleMobilePhoneNo"]copy];
    self.peopleIphonePhoneNo = [[aDecoder decodeObjectForKey:@"peopleIphonePhoneNo"]copy];
    self.peopleHomePhoneNo = [[aDecoder decodeObjectForKey:@"peopleHomePhoneNo"]copy];
    self.peopleWorkPhoneNo = [[aDecoder decodeObjectForKey:@"peopleWorkPhoneNo"]copy];
    self.peopleHomeEmailNo = [[aDecoder decodeObjectForKey:@"peopleHomeEmailNo"]copy];
    self.peopleWorkEmailNo = [[aDecoder decodeObjectForKey:@"peopleWorkEmailNo"]copy];
    self.peopleOtherEmailNo = [[aDecoder decodeObjectForKey:@"peopleOtherEmailNo"]copy];
    self.peopleName = [[aDecoder decodeObjectForKey:@"peopleName"]copy];
    self.peopleFirstName = [[aDecoder decodeObjectForKey:@"peopleFirstName"]copy];
    self.peopleMidlleName = [[aDecoder decodeObjectForKey:@"peopleMidlleName"]copy];
    self.peopleLastName = [[aDecoder decodeObjectForKey:@"peopleLastName"]copy];
    self.peopleNickName = [[aDecoder decodeObjectForKey:@"peopleNickName"]copy];
    self.peoplePrefix = [[aDecoder decodeObjectForKey:@"peoplePrefix"]copy];
    self.peopleSuffix = [[aDecoder decodeObjectForKey:@"peopleSuffix"]copy];
    self.peopleFirstnamePhonetic = [[aDecoder decodeObjectForKey:@"peopleFirstnamePhonetic"]copy];
    self.peopleMiddlenamePhonetic = [[aDecoder decodeObjectForKey:@"peopleMiddlenamePhonetic"]copy];
    self.peopleLastnamePhonetic = [[aDecoder decodeObjectForKey:@"peopleLastnamePhonetic"]copy];
    self.peopleBirthday = [[aDecoder decodeObjectForKey:@"peopleBirthday"]copy];
    self.peopleCompanyName = [[aDecoder decodeObjectForKey:@"peopleCompanyName"]copy];
    self.peopleJobName = [[aDecoder decodeObjectForKey:@"peopleJobName"]copy];
    self.peopleDepartmentName = [[aDecoder decodeObjectForKey:@"peopleDepartmentName"]copy];
    self.personID = [[aDecoder decodeObjectForKey:@"personID"] copy];
    
    return self;
}

@end 
