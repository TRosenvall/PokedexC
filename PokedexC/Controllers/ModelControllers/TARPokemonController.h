//
//  TARPokemonController.h
//  PokedexC
//
//  Created by Timothy Rosenvall on 7/2/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pokemon.h"

@interface TARPokemonController : NSObject

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void(^) (Pokemon *))completion;

@end
