//
//  XNBaseContract.m
//  XNTalk
//
//  Created by Jiabao on 16/7/5.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import "XNBaseContract.h"
#import "XNJson.h"

@interface XNBaseContract () {
    NSMutableDictionary *_fieldData;
}

@end

@implementation XNBaseContract

#pragma mark - 实例方法 初始化
- (instancetype)init {
    return [self initWithJsonDictionary:[NSMutableDictionary dictionary]];
}
- (instancetype)initWithJsonData:(NSData *)data {
    return [self initWithJsonDictionary:[data toJsonDictionary]];
}
- (instancetype)initWithJsonString:(NSString *)string {
    return [self initWithJsonDictionary:[string toJsonDictionary]];
}
- (instancetype)initWithJsonDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (nil != self) {
        if (nil != dictionary) {
            self.fieldData = [dictionary mutableCopy];
        }
    }
    return self;
}

#pragma mark - 获得Json数据
- (NSDictionary*)jsonDictionary {
    return [self.fieldData mutableCopy];
}
- (NSData*)jsonData {
    return [self.fieldData toJsonData];
}
- (NSString *)jsonString {
    return [self.fieldData toJsonString];
}
- (NSMutableDictionary*)jsonMutableDictionary {
    return [self.fieldData mutableCopy];
}
- (NSMutableData*)jsonMutableData {
    return [[self jsonData] mutableCopy];
}
- (NSMutableString*)jsonMutableString {
    return [[self jsonString] mutableCopy];
}

#pragma mark - 设置Json数据
- (void)setJsonDictionary:(NSDictionary*)dictionary {
    self.fieldData = [dictionary mutableCopy];
}
- (void)setJsonData:(NSData*)data {
    self.fieldData = [data toJsonMutableDictionary];
}
- (void)setJsonString:(NSString*)string {
    self.fieldData = [string toJsonMutableDictionary];
}

#pragma mark - setter/getter方法
- (NSMutableDictionary *)fieldData {
    if (nil == _fieldData) {
        _fieldData = [NSMutableDictionary dictionary];
    }
    return nil;
}

- (void)setFieldData:(NSMutableDictionary *)fieldData {
    _fieldData = fieldData;
}

#pragma mark - 检查有没有字段
- (BOOL)hasField:(NSString *)field {
    for(NSString *temp in self.fieldData.allKeys) {
        if ([temp isEqualToString:field]) {
            return YES;
        }
    }
    return NO;
}

#pragma mark - 移除key
- (void)removeObjectForField:(NSString *)field {
    if (0 < field.length) {
        [self.fieldData removeObjectForKey:field];
    }
}

#pragma mark - 设置字段的值
- (void)setFieldValue_BOOL: (BOOL)value forField:(NSString*)field {
    [self.fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_int:(int)value forField:(NSString*)field {
    [self.fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_float:(float)value forField:(NSString*)field {
    [self.fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_double:(double)value forField:(NSString*)field {
    [self.fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_SInt8:(SInt8)value forField:(NSString*)field {
    [self.fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_SInt16:(SInt16)value forField:(NSString*)field {
    [self.fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_SInt32:(SInt32)value forField:(NSString*)field {
    [self.fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_SInt64:(SInt64)value forField:(NSString*)field {
    [self.fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_Integer:(NSInteger)value forField:(NSString*)field {
    [self.fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_UInt8:(UInt8)value forField:(NSString*)field {
    [self.fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_UInt16:(UInt16)value forField:(NSString*)field {
    [self.fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_UInt32:(UInt32)value forField:(NSString*)field {
    [self.fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_UInt64:(UInt64)value forField:(NSString*)field {
    [self.fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_UInteger:(NSUInteger)value forField:(NSString*)field {
    [self.fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_Number:(NSNumber*)value forField:(NSString*)field {
    if (nil == value) {
        [self.fieldData removeObjectForKey:field];
    } else {
        [self.fieldData setObject:value forKey:field];
    }
}
- (void)setFieldValue_String:(NSString*)value forField:(NSString*)field {
    if (nil == value) {
        [self.fieldData removeObjectForKey:field];
    } else {
        [self.fieldData setObject:value forKey:field];
    }
}
- (void)setFieldValue_Dictionary:(NSDictionary*)value forField:(NSString*)field {
    if (nil == value) {
        [self.fieldData removeObjectForKey:field];
    } else {
        [self.fieldData setObject:value forKey:field];
    }
}
- (void)setFieldValue_Array:(NSArray*)value forField:(NSString*)field {
    if (nil == value) {
        [self.fieldData removeObjectForKey:field];
    } else {
        [self.fieldData setObject:value forKey:field];
    }
}
- (void)setFieldValue_id:(id)value forField:(NSString*)field {
    if (nil == value) {
        [self.fieldData removeObjectForKey:field];
    } else {
        [self.fieldData setObject:value forKey:field];
    }    
}

#pragma mark - 获得字段的值
- (BOOL)getFieldValue_BOOL:(NSString*)field {
    return [[self.fieldData objectForKey:field] boolValue];
}
- (int)getFieldValue_int:(NSString*)field {
    return [[self.fieldData objectForKey:field] intValue];
}
- (float)getFieldValue_float:(NSString*)field {
    return [[self.fieldData objectForKey:field] floatValue];
}
- (double)getFieldValue_double:(NSString*)field {
    return [[self.fieldData objectForKey:field] doubleValue];
}
- (SInt8)getFieldValue_SInt8:(NSString*)field {
    return [[self.fieldData objectForKey:field] intValue];
}
- (SInt16)getFieldValue_SInt16:(NSString*)field {
    return [[self.fieldData objectForKey:field] intValue];
}
- (SInt32)getFieldValue_SInt32:(NSString*)field {
    return [[self.fieldData objectForKey:field] intValue];
}
- (SInt64)getFieldValue_SInt64:(NSString*)field {
    return [[self.fieldData objectForKey:field] longLongValue];
}
- (NSInteger)getFieldValue_Integer:(NSString*)field {
    return [[self.fieldData objectForKey:field] integerValue];
}
- (UInt8)getFieldValue_UInt8:(NSString*)field {
    return (UInt8)[[self.fieldData objectForKey:field] intValue];
}
- (UInt16)getFieldValue_UInt16:(NSString*)field {
    return (UInt16)[[self.fieldData objectForKey:field] intValue];
}
- (UInt32)getFieldValue_UInt32:(NSString*)field {
    return (UInt32)[[self.fieldData objectForKey:field] intValue];
}
- (UInt64)getFieldValue_UInt64:(NSString*)field {
    return (UInt64)[[self.fieldData objectForKey:field] longLongValue];
}
- (NSUInteger)getFieldValue_UInteger:(NSString*)field {
    return (NSUInteger)[[self.fieldData objectForKey:field] integerValue];
}
- (NSNumber*)getFieldValue_Number:(NSString*)field {
    return [self.fieldData objectForKey:field];
}
- (NSString*)getFieldValue_String:(NSString*)field {
    return [self.fieldData objectForKey:field];
}
- (NSDictionary*)getFieldValue_Dictionary:(NSString*)field {
    return [self.fieldData objectForKey:field];
}
- (NSArray*)getFieldValue_Array:(NSString*)field {
    return [self.fieldData objectForKey:field];
}
- (id)getFieldValue_id:(NSString*)field {
    return [self.fieldData objectForKey:field];
}

@end

/*
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  BOOL value,             NSString* key) {
    [dict setObject:@(value) forKey:key];
}
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  int value,              NSString* key) {
    [dict setObject:@(value) forKey:key];
}
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  float value,            NSString* key) {
    [dict setObject:@(value) forKey:key];
}
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  UInt8 value,            NSString* key) {
    [dict setObject:@(value) forKey:key];
}
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  UInt16 value,           NSString* key) {
    [dict setObject:@(value) forKey:key];
}
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  UInt32 value,           NSString* key) {
    [dict setObject:@(value) forKey:key];
}
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  UInt64 value,           NSString* key) {
    [dict setObject:@(value) forKey:key];
}
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  NSInteger value,        NSString* key) {
    [dict setObject:@(value) forKey:key];
}
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  NSNumber* value,        NSString* key) {
    [dict setObject:value forKey:key];
}
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  NSString* value,        NSString* key) {
    [dict setObject:value forKey:key];
}
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  NSDictionary* value,    NSString* key) {
    [dict setObject:value forKey:key];
}
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  NSArray* value,         NSString* key) {
    [dict setObject:value forKey:key];
}
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  XNBaseContract* value,  NSString* key) {
    [dict setObject:value forKey:key];
}

BOOL            __attribute__((overloadable)) getFieldValue(NSDictionary* dict, BOOL* value,            NSString* key) {
    NSNumber* number = [dict objectForKey:key];
    BOOL boolValue = [number boolValue];
    if (nil != value) {
        *value = boolValue;
    }
    return boolValue;
}
int             __attribute__((overloadable)) getFieldValue(NSDictionary* dict, int* value,             NSString* key) {
    
}
float           __attribute__((overloadable)) getFieldValue(NSDictionary* dict, float* value,           NSString* key) {
    
}
UInt8           __attribute__((overloadable)) getFieldValue(NSDictionary* dict, UInt8* value,           NSString* key) {
    
}
UInt16          __attribute__((overloadable)) getFieldValue(NSDictionary* dict, UInt16* value,          NSString* key) {
    
}
UInt32          __attribute__((overloadable)) getFieldValue(NSDictionary* dict, UInt32* value,          NSString* key) {
    
}
UInt64          __attribute__((overloadable)) getFieldValue(NSDictionary* dict, UInt64* value,          NSString* key) {
    
}
NSInteger       __attribute__((overloadable)) getFieldValue(NSDictionary* dict, NSInteger* value,       NSString* key) {
    
}
NSNumber*       __attribute__((overloadable)) getFieldValue(NSDictionary* dict, NSNumber** value,       NSString* key) {
    
}
NSString*       __attribute__((overloadable)) getFieldValue(NSDictionary* dict, NSString** value,       NSString* key) {
    
}
NSDictionary*   __attribute__((overloadable)) getFieldValue(NSDictionary* dict, NSDictionary** value,   NSString* key) {
    
}
NSArray*        __attribute__((overloadable)) getFieldValue(NSDictionary* dict, NSArray** value,        NSString* key) {
    
}
XNBaseContract* __attribute__((overloadable)) getFieldValue(NSDictionary* dict, XNBaseContract** value, NSString* key) {
    
}
*/