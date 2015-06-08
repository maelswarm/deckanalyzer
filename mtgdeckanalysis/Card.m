//
//  Card.m
//  mtgdeckanalysis
//
//  Created by Brandon Barber on 5/30/15.
//  Copyright (c) 2015 Brandon Barber. All rights reserved.
//

#import "Card.h"

@interface Card() {
}

@end

@implementation Card

- (id)initWithName:(NSString *)str andQuantity:(int)n{
    if((self = [super init])) {
        
        NSMutableDictionary *root = [NSMutableDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"card" ofType:@"plist"]];
        NSMutableDictionary *card = [root objectForKey:str];
        
        self.name = [str mutableCopy];
        self.quantity = [NSNumber numberWithInt:n];
        self.type = [card objectForKey:@"Type"];
        
        if ([self.type isEqual:@"Creature"]) {
            self.power = [card objectForKey:@"Power"];
            self.toughness = [card objectForKey:@"Toughness"];
        }
        
        return self;
    }
    return NULL;
}

- (id)initWithCard:(Card *)card {
    if((self = [super init])) {
        
        self.name = [NSMutableString stringWithString:card.name];
        self.quantity = [card.quantity copy];
        self.type = [NSMutableString stringWithString:card.type];
        
        if ([self.type isEqual:@"Creature"]) {
            self.power = card.power;
            self.toughness = card.toughness;
        }
        
        return self;
    }
    return NULL;
}

@end
