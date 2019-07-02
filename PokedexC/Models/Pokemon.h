//
//  Pokemon.h
//  PokedexC
//
//  Created by Timothy Rosenvall on 7/2/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Pokemon : NSObject

// let pokemonName: String
@property (nonatomic, copy, readonly) NSString *pokemonName;
@property (nonatomic, readonly) NSInteger pokemonIdentifier;
// First pointer for the strings in the array, second pointer for the array.
@property (nonatomic, copy, readonly) NSArray<NSString *> *pokemonAbilities;

- (instancetype)initWithPokemonName:(NSString *)name
                         identifier:(NSInteger)identifier
                          abilities:(NSArray<NSString *> *)abilities;

/*
 init(name: String, identifier: Int, abilties: [String]){
 
 }
 */

@end

@interface Pokemon (JSONConvertable)

// init(with dictionary: [String:Any]) {
- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
