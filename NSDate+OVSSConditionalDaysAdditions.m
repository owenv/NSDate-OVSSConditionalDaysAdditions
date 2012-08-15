//
//  NSDate+OVSSConditionalDaysAdditions.m
//  Core Data RunLog
//
//  Created by John Voorhees on 4/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSDate+OVSSConditionalDaysAdditions.h"


@implementation NSDate (NSDate_OVSSConditionalDaysAdditions)
+(NSDate *)beginningofweek{
    NSDate *today=[NSDate date]; 
    
    unsigned units = NSYearCalendarUnit | NSMonthCalendarUnit |  NSWeekdayCalendarUnit | NSWeekCalendarUnit /*| NSDayCalendarUnit*/;
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:units fromDate:today];
   // if ([components day]<=7) {
     //   [components setMonth:[components month]-1];
    //}
    int week=[components week];
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"StartOnMondayKey"]==YES) {
        [components setWeekday:2];

    } else {
        [components setWeekday:1];

    }
    [components setWeek:week];
    NSDate *finaldate=[gregorian dateFromComponents:components];
    NSDate *finisheddate;
    if ([today compare:finaldate]==NSOrderedAscending) {
        NSDateComponents *finalcomponents = [gregorian components:units fromDate:finaldate];
        [finalcomponents setWeek:[finalcomponents week]-1];
        finisheddate=[gregorian dateFromComponents:finalcomponents];

        return finisheddate;
    }
    

    return finaldate;

}

-(NSString *)monthNum{
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
      NSDateComponents *weekdayComponents =
    [gregorian components:NSMonthCalendarUnit | NSYearCalendarUnit fromDate:self];
    int month = [weekdayComponents month];
    NSString *monthstring;
    switch (month) {
        case 1:
            monthstring=@"January";
            break;
        case 2:
              monthstring=@"February";
            break;
        case 3:
              monthstring=@"March";
            break;
        case 4:
              monthstring=@"April";
            break;
        case 5:
              monthstring=@"May";
            break;
        case 6:
              monthstring=@"June";
            break;
        case 7:
              monthstring=@"July";
            break;
        case 8:
              monthstring=@"August";
            break;
        case 9:
              monthstring=@"September";
            break;
        case 10:
              monthstring=@"October";
            break;
        case 11:
              monthstring=@"November";
            break;
        case 12:
              monthstring=@"December";
            break;
        default:monthstring=@"error";
            break;
    }
    NSString *final=[NSString stringWithFormat:@"%@ %d",monthstring,[weekdayComponents year]];
    return final;
}



+(NSDate *)beginningofmonth{
    NSDate *today=[NSDate date]; 
    
    unsigned units = NSYearCalendarUnit | NSMonthCalendarUnit |  NSWeekdayCalendarUnit | NSWeekCalendarUnit | NSDayCalendarUnit;
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:units fromDate:today];
    
    [components setDay:1];
       return [gregorian dateFromComponents:components];
}




+(NSDate *)beginningofyear{
    NSDate *today=[NSDate date]; 
    
    unsigned units = NSYearCalendarUnit | NSMonthCalendarUnit |  NSWeekdayCalendarUnit | NSWeekCalendarUnit;
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:units fromDate:today];
    
   
    [components setMonth:1];
    [components setDay:1];
        return [gregorian dateFromComponents:components];  
}




+(NSDate *)beginningoflastweek{
    NSDate *today=[NSDate date]; 
    unsigned bunits = NSYearCalendarUnit | NSMonthCalendarUnit |  NSWeekdayCalendarUnit | NSWeekCalendarUnit | NSDayCalendarUnit;
    NSCalendar *bgregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *bcomponents = [bgregorian components:bunits fromDate:today];

    unsigned units = NSYearCalendarUnit | NSMonthCalendarUnit |  NSWeekdayCalendarUnit | NSWeekCalendarUnit | NSDayCalendarUnit;
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:units fromDate:today];
    
    int day=[components day];
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"StartOnMondayKey"]==YES) {
        [components setWeekday:2];
        
    } else {
        [components setWeekday:1];
        
    }
    [components setDay:day-7];
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"StartOnMondayKey"]==YES & [bcomponents weekday]==1) {
        [components setDay:[components day]-6];

    }
       return [gregorian dateFromComponents:components];  
}




+(NSDate *)beginningoftwoweeksago{
    NSDate *today=[NSDate date]; 
    BOOL lastmonth=NO;
    unsigned bunits = NSYearCalendarUnit | NSMonthCalendarUnit |  NSWeekdayCalendarUnit | NSWeekCalendarUnit | NSDayCalendarUnit;
    NSCalendar *bgregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *bcomponents = [bgregorian components:bunits fromDate:today];
    if ([bcomponents day]<=7) {
        lastmonth=YES;
    }
    
    unsigned units = NSYearCalendarUnit | NSMonthCalendarUnit |  NSWeekdayCalendarUnit | NSWeekCalendarUnit | NSDayCalendarUnit;
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:units fromDate:today];
   
    int day=[components day];
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"StartOnMondayKey"]==YES) {
        [components setWeekday:2];
        
    } else {
        [components setWeekday:1];
        
    }
    if (lastmonth) {
        [components setMonth:[components month]-1];
    }
    [components setDay:day-14];
if ([[NSUserDefaults standardUserDefaults]boolForKey:@"StartOnMondayKey"]==YES & [bcomponents weekday]==1) {
       [components setDay:[components day]-6];
    }
       return [gregorian dateFromComponents:components];  
}
@end
