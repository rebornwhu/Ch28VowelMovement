//
//  main.m
//  Ch28VowelMovement
//
//  Created by Xiao Lu on 3/30/15.
//  Copyright (c) 2015 Xiao Lu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ArrayEnumerationBlock) (id, NSUInteger, BOOL *);

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        NSArray *originalStrings = @[@"Sauerkraut", @"Raygun", @"Big Nerd Ranch", @"Mississippi"];
        NSLog(@"original string: %@", originalStrings);
        
        NSMutableArray *devowelizedStrings = [NSMutableArray array];
        
        NSArray *vowels = @[@"a", @"e", @"i", @"o", @"u"];
        
        /* void (^devowelizer)(id, NSUInteger, BOOL *); */
        //        ArrayEnumerationBlock devowelizer; // use typedef instead. It looks more OO
        //
        //        devowelizer = ^(id string, NSUInteger i, BOOL *stop) {
        //            NSRange yRange = [string rangeOfString:@"y"
        //                                           options:NSCaseInsensitiveSearch];
        //
        //            if (yRange.location != NSNotFound) {
        //                *stop = YES;
        //                return;
        //            }
        //
        //
        //            NSMutableString *newString = [NSMutableString stringWithString:string];
        //            for (NSString *s in vowels) {
        //                NSRange fullRange = NSMakeRange(0, [newString length]);
        //                [newString replaceOccurrencesOfString:s
        //                                           withString:@""
        //                                              options:NSCaseInsensitiveSearch
        //                                                range:fullRange];
        //            }
        //
        //            [devowelizedStrings addObject:newString];
        //        };
        
        // could do it in one step
        
        void (^devowelizer)(id, NSUInteger, BOOL *) = ^(id string, NSUInteger i, BOOL *stop) {
//            NSRange yRange = [string rangeOfString:@"y"
//                                           options:NSCaseInsensitiveSearch];
//            if (yRange.location != NSNotFound) {
//                *stop = YES;
//                return;
//            }
            
            
            NSMutableString *newString = [NSMutableString stringWithString:string];
            for (NSString *s in vowels) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:s
                                           withString:@""
                                              options:NSCaseInsensitiveSearch
                                                range:fullRange];
            }
            
            [devowelizedStrings addObject:newString];
        };
        
        
        [originalStrings enumerateObjectsUsingBlock:devowelizer];
        NSLog(@"devowelized strings: %@", devowelizedStrings);
    }
    
    return 0;
}

