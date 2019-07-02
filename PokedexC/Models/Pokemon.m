//
//  Pokemon.m
//  PokedexC
//
//  Created by Timothy Rosenvall on 7/2/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon

- (instancetype)initWithPokemonName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities
{
    self = [super init];
    if (self) {
        _pokemonName = name;
        _pokemonIdentifier = identifier;
        _pokemonAbilities = abilities;
    }
    return self;
    
}

@end


@implementation Pokemon (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)topLevelDictionary
{
    NSString *name = topLevelDictionary[@"name"];
    NSInteger identifier = [topLevelDictionary[@"id"] integerValue];
    NSArray *abilitiesDict = topLevelDictionary[@"abilities"];
    if (![name isKindOfClass:[NSString class]] || ![abilitiesDict isKindOfClass:[NSArray class]]) {
        return nil;
    }

    NSMutableArray<NSString *> *abilities = [NSMutableArray new];
    // let abilities : [String] = []
    for (NSDictionary *dictionary in abilitiesDict) {
        NSDictionary *abilityDict = dictionary[@"ability"];
        NSString *abilityName = abilityDict[@"name"];
        [abilities addObject:abilityName];
    }
    
    return [self initWithPokemonName:name identifier:identifier abilities:abilities];
    
    
    
}

@end

