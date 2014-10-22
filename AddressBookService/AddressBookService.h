//
//  AddressBookService.h
//  FindLocationDemo
//
//  Created by Peter Lee on 14-4-11.
//  Copyright (c) 2014年 Peter Lee. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import "AddressBookPeopleInfo.h"
#import "SingletonManager.h"

@interface AddressBookService : NSObject
Single_interface(AddressBookService);

-(NSMutableDictionary *)getAllAddressBookPeopleInfo;

@end
