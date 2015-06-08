//
//  Deck.h
//  mtgdeckanalysis
//
//  Created by Brandon Barber on 5/30/15.
//  Copyright (c) 2015 Brandon Barber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Deck : NSObject

@property NSString *name;
@property NSMutableArray *content;

- (id)initWithName:(NSString *)str;
- (id)initWithDeck:(Deck *)deck;

- (void)addCardWithName:(NSString *)str andQuantity:(int)n;

- (void)calcRandHandProb;

- (void)printDeck;

@end

@protocol carddelegate <NSObject>

@required
- (void)sendBackHand:(Deck *)deck;

@end

@interface Deck() {
    
}
@property (weak) id <carddelegate> delegate;

@end