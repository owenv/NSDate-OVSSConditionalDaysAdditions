//
//  NSDate+OVSSConditionalDaysAdditions.h
//
//  Created by Owen Voorhees on 4/28/11.
//  Copyright 2011 Owen Voorhees. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate (NSDate_OVSSConditionalDaysAdditions)
+(NSDate *)beginningofweek;
+(NSDate *)beginningofmonth;
+(NSDate *)beginningofyear;
+(NSDate *)beginningoflastweek;
+(NSDate *)beginningoftwoweeksago;
-(NSString *)monthNum;
@end
