//
//  TARPokemonController.m
//  PokedexC
//
//  Created by Timothy Rosenvall on 7/2/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

#import "TARPokemonController.h"

static NSString * const baseURLString = @"https://pokeapi.co/api/v2/pokeathlon-stat/";

@implementation TARPokemonController

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^)(Pokemon *))completion
{
    // Step 1) Create the URL from the Base URL and search term.
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
        // Step 1.5) Create a path component for our search term.
    NSURL *finalURL = [baseURL URLByAppendingPathComponent:[searchTerm lowercaseString]];
    
    NSLog(@"%@", finalURL);
    
    // Step 2) Start my datatask with the Completion
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // Check for error
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        // Check the response
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        // Get the data
        if (data)
        {
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            if (!topLevelDictionary)
            {
                NSLog(@"Error parsing the JSON: %@", error);
                completion(nil);
                return;
            }
            // If we made it here, then I have successfully parsed my JSON and should be able to complete with a Pokemon Object
            Pokemon *pokemon = [[Pokemon alloc] initWithDictionary:topLevelDictionary];
            completion(pokemon);
        }
    }] resume];
}

@end
