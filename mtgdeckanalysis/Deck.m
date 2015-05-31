//
//  Deck.m
//  mtgdeckanalysis
//
//  Created by Brandon Barber on 5/30/15.
//  Copyright (c) 2015 Brandon Barber. All rights reserved.
//

#import "Deck.h"
#import "Card.h"

@interface Deck() {
}

@end

@implementation Deck

- (id)initWithName:(NSString *)str {
    if((self = [super init])) {
        self.name = str;
        self.content = [NSMutableArray new];
        return self;
    }
    return NULL;
}

- (id)initWithDeck:(Deck *)deck {
    if((self = [super init])) {
        self.name = [NSString stringWithString:deck.name];
        self.content = [NSMutableArray arrayWithArray:deck.content];
        return self;
    }
    return NULL;
}

- (void)addCardWithName:(NSString *)str andQuantity:(int)n {
    for (int i=0; i<n; i++) {
        Card *card = [[Card alloc]initWithName:str andQuantity:n];
        [self.content addObject:card];
    }
}

- (void)calcRandHandProb {
    for (int u=0; u<2000; u++) {
        
        NSLog(@" ");
        
        NSMutableArray *occurenceArray = [NSMutableArray new];
        
        Deck *tempDeck = [[Deck alloc]initWithDeck:self];
        Deck *tempHand = [[Deck alloc]initWithName:@"Hand"];
        
        int cnt = 60;
        
        for (int i=0; i<7; i++) {
            int randNum = arc4random_uniform(cnt-i);
            NSLog(@"%@", ((Card *)[tempDeck.content objectAtIndex:randNum]).name);
            Card *tempCard = [[Card alloc]initWithCard:((Card *)[tempDeck.content objectAtIndex:randNum])];
            [tempHand.content addObject:tempCard];
            [tempDeck.content removeObjectAtIndex:randNum];
            
        }
        
        NSLog(@" ");
        
        double numerator = 1.0;
        double denominator = [self factorialLoop:60.0]/([self factorialLoop:7.0]*[self factorialLoop:53.0]);
        double probabiltyofhand = 0.0;
        for (int i=0; i<tempHand.content.count; i++) {
            
            if ([self checkForOccurence:((Card *)[tempHand.content objectAtIndex:i]).name in:occurenceArray]) {
                continue;
            }
            
            double cardCnt = 1;
            for (int j=i+1; j<tempHand.content.count; j++) {
                if ([((Card *)[tempHand.content objectAtIndex:i]).name isEqualToString:((Card *)[tempHand.content objectAtIndex:j]).name]) {
                    cardCnt++;
                    [occurenceArray addObject:[NSString stringWithString:((Card *)[tempHand.content objectAtIndex:i]).name]];
                }
            }
            
            double nFact = [self factorialLoop:[((Card *)[tempHand.content objectAtIndex:i]).quantity doubleValue]];
            double rFact = [self factorialLoop:cardCnt];
            double nMinusRFact = [self factorialLoop:([((Card *)[tempHand.content objectAtIndex:i]).quantity doubleValue]-cardCnt)];
            
            numerator *= (nFact/(rFact*nMinusRFact));
            
        }
        NSLog(@"Fin Numerator %f", numerator);
        NSLog(@"Denominator %f", denominator);
        probabiltyofhand = numerator/denominator;
        
        if (probabiltyofhand > .000317) {
            NSLog(@"%f", probabiltyofhand);
        }
        
    }
}

-(BOOL)checkForOccurence:(NSString *)str in:(NSMutableArray *)arr {
    for (NSString *tempStr in arr) {
        if ([str isEqualToString:tempStr]) {
            return TRUE;
        }
    }
    return FALSE;
}

- (double)factorialLoop:(double)operand {
    
    if( operand == 1.0 || operand == 0.0) {
        return(1.0);
    } else if( operand < 0.0 ) {
        return(-1.0);
    }
    
    double factorial = 1.0;
    for(int i = operand; i > 1; i-- ) {
        factorial *= (double)i;
    }
    
    return(factorial);
    
}

- (void)printDeck {
    NSLog(@"Number of Cards: %lu", (unsigned long)self.content.count);
    for (Card *temp in self.content) {
        NSLog(@"%@", temp.name);
    }
}

@end
