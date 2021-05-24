#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
    NSDictionary *dictOfMonths = @{ @(1):@"January",
                                    @(2):@"February",
                                    @(3):@"March",
                                    @(4):@"April",
                                    @(5):@"May",
                                    @(6):@"June",
                                    @(7):@"July",
                                    @(8):@"August",
                                    @(9):@"September",
                                    @(10):@"October",
                                    @(11):@"November",
                                    @(12):@"December"};
    NSString *answer = dictOfMonths[@(monthNumber)];
    return answer;
}


#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    return [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:[dateFormatter dateFromString:date]];
}



#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"EE";
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    NSLog(@"%@", [dateFormatter stringFromDate:date]);
    return [dateFormatter stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *currentDateComponents = [calendar components:(NSCalendarUnitWeekOfYear | NSCalendarUnitYear) fromDate:[NSDate now]];
    NSDateComponents *givenDateComponents = [calendar components:(NSCalendarUnitWeekOfYear | NSCalendarUnitYear) fromDate:date];
    
    return (currentDateComponents.year == givenDateComponents.year) && (currentDateComponents.weekOfYear == givenDateComponents.weekOfYear);
}

@end
