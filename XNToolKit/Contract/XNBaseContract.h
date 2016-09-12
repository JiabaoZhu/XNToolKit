//
//  XNBaseContract.h
//  XNTalk
//
//  Created by Jiabao on 16/7/5.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NSTR2CSTR(n_str) [n_str UTF8String]
#define CSTR2NSTR(c_str) [[NSString alloc] initWithCString:(const char*)c_str encoding:NSUTF8StringEncoding]

@interface XNBaseContract : NSObject

#pragma mark - 实例方法 初始化
- (instancetype)init;
- (instancetype)initWithJsonData:(NSData *)data;
- (instancetype)initWithJsonString:(NSString *)string;
- (instancetype)initWithJsonDictionary:(NSDictionary *)dictionary;

#pragma mark - 获得Json数据
- (NSDictionary *)jsonDictionary;
- (NSData *)jsonData;
- (NSString *)jsonString;
- (NSMutableDictionary *)jsonMutableDictionary;
- (NSMutableData *)jsonMutableData;
- (NSMutableString *)jsonMutableString;

#pragma mark - 设置Json数据
- (void)setJsonDictionary:(NSDictionary*)dictionary;
- (void)setJsonData:(NSData*)data;
- (void)setJsonString:(NSString*)string;

#pragma mark - 检查有没有字段
- (BOOL)hasField:(NSString *)field;

#pragma mark - 移除key
- (void)removeObjectForField:(NSString *)field;

#pragma mark - 设置字段的值
- (void)setFieldValue_BOOL: (BOOL)value forField:(NSString*)field;
- (void)setFieldValue_int:(int)value forField:(NSString*)field;
- (void)setFieldValue_float:(float)value forField:(NSString*)field;
- (void)setFieldValue_double:(double)value forField:(NSString*)field;
- (void)setFieldValue_SInt8:(SInt8)value forField:(NSString*)field;
- (void)setFieldValue_SInt16:(SInt16)value forField:(NSString*)field;
- (void)setFieldValue_SInt32:(SInt32)value forField:(NSString*)field;
- (void)setFieldValue_SInt64:(SInt64)value forField:(NSString*)field;
- (void)setFieldValue_Integer:(NSInteger)value forField:(NSString*)field;
- (void)setFieldValue_UInt8:(UInt8)value forField:(NSString*)field;
- (void)setFieldValue_UInt16:(UInt16)value forField:(NSString*)field;
- (void)setFieldValue_UInt32:(UInt32)value forField:(NSString*)field;
- (void)setFieldValue_UInt64:(UInt64)value forField:(NSString*)field;
- (void)setFieldValue_UInteger:(NSUInteger)value forField:(NSString*)field;
- (void)setFieldValue_Number:(NSNumber*)value forField:(NSString*)field;
- (void)setFieldValue_String:(NSString*)value forField:(NSString*)field;
- (void)setFieldValue_Dictionary:(NSDictionary*)value forField:(NSString*)field;
- (void)setFieldValue_Array:(NSArray*)value forField:(NSString*)field;
- (void)setFieldValue_id:(id)value forField:(NSString*)field;

#pragma mark - 获得字段的值
- (BOOL)getFieldValue_BOOL:(NSString*)field;
- (int)getFieldValue_int:(NSString*)field;
- (float)getFieldValue_float:(NSString*)field;
- (double)getFieldValue_double:(NSString*)field;
- (SInt8)getFieldValue_SInt8:(NSString*)field;
- (SInt16)getFieldValue_SInt16:(NSString*)field;
- (SInt32)getFieldValue_SInt32:(NSString*)field;
- (SInt64)getFieldValue_SInt64:(NSString*)field;
- (NSInteger)getFieldValue_Integer:(NSString*)field;
- (UInt8)getFieldValue_UInt8:(NSString*)field;
- (UInt16)getFieldValue_UInt16:(NSString*)field;
- (UInt32)getFieldValue_UInt32:(NSString*)field;
- (UInt64)getFieldValue_UInt64:(NSString*)field;
- (NSUInteger)getFieldValue_UInteger:(NSString*)field;
- (NSNumber*)getFieldValue_Number:(NSString*)field;
- (NSString*)getFieldValue_String:(NSString*)field;
- (NSDictionary*)getFieldValue_Dictionary:(NSString*)field;
- (NSArray*)getFieldValue_Array:(NSString*)field;
- (id)getFieldValue_id:(NSString*)field;

@property (nonatomic, strong, readonly) NSMutableDictionary *fieldData;
@end
