//
//  XNJson.m
//  Jiabao
//
//  Created by Jiabao on 16/7/7.
//  Copyright © 2016年 Jiabao. All rights reserved.
//

#import "XNJson.h"

#pragma mark - 函数声明
// NSString
NSString* XNJson_DataToString(NSData *data);
NSString* XNJson_DictionaryToString(NSDictionary *dictionary);
NSString* XNJson_ArrayToString(NSArray* array);

// NSData
NSData* XNJson_StringToData(NSString *string);
NSData* XNJson_DictionaryToData(NSDictionary *dictionary);
NSData* XNJson_ArrayToData(NSArray *array);

// NSDictionary
NSDictionary* XNJson_StringToDictionary(NSString *string);
NSDictionary* XNJson_DataToDictionary(NSData *data);

// NSArray
NSArray* XNJson_StringToArray(NSString *string);
NSArray* XNJson_DataToArray(NSData *data);

#pragma mark - 函数实现

// NSData* -> NSString*
NSString* XNJson_DataToString(NSData *data) {
    if (nil != data) {
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}
// NSString* -> NSData*
NSData* XNJson_StringToData(NSString *string) {
    if (nil != string) {
        return [string dataUsingEncoding:NSUTF8StringEncoding];
    }
    return nil;
}

// NSData* -> NSDictionary*
NSDictionary* XNJson_DataToDictionary(NSData *data) {
    if (nil != data) {
        NSError *error = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if ([dictionary isKindOfClass:[NSDictionary class]] && nil != dictionary && nil == error) {
            return dictionary;
        }
    }
    return nil;
}
// NSDictionary* -> NSData*
NSData* XNJson_DictionaryToData(NSDictionary *dictionary) {
    if (nil != dictionary) {
        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:&error];
        if (0 < data.length && nil == error) {
            return data;
        }
    }
    return nil;
}

// NSData* -> NSArray*
NSArray* XNJson_DataToArray(NSData *data) {
    if (nil != data) {
        NSError *error = nil;
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if ([array isKindOfClass:[NSArray class]] && nil != array && nil == error) {
            return array;
        }
    }
    return nil;
}
// NSArray* -> NSData*
NSData* XNJson_ArrayToData(NSArray *array) {
    if (nil != array) {
        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:array options:0 error:&error];
        if (0 < data.length && nil == error) {
            return data;
        }
    }
    return nil;
}

// NSDictionary* -> NSString*
NSString* XNJson_DictionaryToString(NSDictionary *dictionary) {
    if (nil != dictionary) {
        return XNJson_DataToString(XNJson_DictionaryToData(dictionary));
    }
    return nil;
}
// NSString* -> NSDictionary*
NSDictionary* XNJson_StringToDictionary(NSString *string) {
    if (nil != string) {
        return XNJson_DataToDictionary(XNJson_StringToData(string));
    }
    return nil;
}

// NSArray* -> NSString*
NSString* XNJson_ArrayToString(NSArray *array) {
    if (nil != array) {
        return XNJson_DataToString(XNJson_ArrayToData(array));
    }
    return nil;
}
// NSString* -> NSArray*
NSArray* XNJson_StringToArray(NSString *string) {
    if (nil != string) {
        return XNJson_DataToArray(XNJson_StringToData(string));
    }
    return nil;
}


#pragma mark - NSString(XNJson)
@implementation NSString (XNJson)

+ (instancetype)stringWithJsonData:(NSData *)data {
    return XNJson_DataToString(data);
}
+ (instancetype)stringWithJsonDictionary:(NSDictionary *)dictionary {
    return XNJson_DictionaryToString(dictionary);
}
+ (instancetype)stringWithJsonArray:(NSArray *)array {
    return XNJson_ArrayToString(array);
}

- (NSData *)toJsonData {
    return XNJson_StringToData(self);
}
- (NSMutableData *)toJsonMutableData {
    return [XNJson_StringToData(self) mutableCopy];
}
- (NSArray *)toJsonArray {
    return XNJson_StringToArray(self);
}
- (NSMutableArray *)toJsonMutableArray {
    return [XNJson_StringToArray(self) mutableCopy];
}
- (NSDictionary *)toJsonDictionary {
    return XNJson_StringToDictionary(self);
}
- (NSMutableDictionary *)toJsonMutableDictionary {
    return [XNJson_StringToDictionary(self) mutableCopy];
}

@end

#pragma mark - NSData(XNJson)
@implementation NSData (XNJson)

+ (instancetype)dataWithJsonString:(NSString *)string {
    return XNJson_StringToData(string);
}
+ (instancetype)dataWithJsonDictionary:(NSDictionary *)dictionary {
    return XNJson_DictionaryToData(dictionary);
}
+ (instancetype)dataWithJsonArray:(NSArray *)array {
    return XNJson_ArrayToData(array);
}

- (NSString *)toJsonString {
    return XNJson_DataToString(self);
}
- (NSMutableString *)toJsonMutableStirng {
    return [XNJson_DataToString(self) mutableCopy];
}
- (NSArray *)toJsonArray {
    return XNJson_DataToArray(self);
}
- (NSMutableArray *)toJsonMutableArray {
    return [XNJson_DataToArray(self) mutableCopy];
}
- (NSDictionary *)toJsonDictionary {
    return XNJson_DataToDictionary(self);
}
- (NSMutableDictionary *)toJsonMutableDictionary {
    return [XNJson_DataToDictionary(self) mutableCopy];
}

@end

#pragma mark - NSDictionary(XNJson)
@implementation NSDictionary (XNJson)

+ (instancetype)dictionaryWithJsonString:(NSString *)string {
    return XNJson_StringToDictionary(string);
}
+ (instancetype)dictionaryWithJsonData:(NSData *)data {
    return XNJson_DataToDictionary(data);
}

- (NSString *)toJsonString {
    return XNJson_DictionaryToString(self);
}
- (NSMutableString *)toJsonMutableStirng {
    return [XNJson_DictionaryToString(self) mutableCopy];
}
- (NSData *)toJsonData {
    return XNJson_DictionaryToData(self);
}
- (NSMutableData *)toJsonMutableData {
    return [XNJson_DictionaryToData(self) mutableCopy];
}

@end

#pragma mark - NSArray(XNJson)
@implementation NSArray (XNJson)

+ (instancetype)arrayWithJsonString:(NSString *)string {
    return XNJson_StringToArray(string);
}
+ (instancetype)arrayWithJsonData:(NSData *)data {
    return XNJson_DataToArray(data);
}

- (NSString *)toJsonString {
    return XNJson_ArrayToString(self);
}
- (NSMutableString *)toJsonMutableStirng {
    return [XNJson_ArrayToString(self) mutableCopy];
}
- (NSData *)toJsonData {
    return XNJson_ArrayToData(self);
}
- (NSMutableData *)toJsonMutableData {
    return [XNJson_ArrayToData(self) mutableCopy];
}

@end

