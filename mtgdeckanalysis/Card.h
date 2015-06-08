//
//  Card.h
//  mtgdeckanalysis
//
//  Created by Brandon Barber on 5/30/15.
//  Copyright (c) 2015 Brandon Barber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Card : UIImageView

@property NSNumber *quantity;

@property NSMutableString *name;
@property NSMutableString *type;
@property NSNumber *power;
@property NSNumber *toughness;

- (id)initWithName:(NSString *)str andQuantity:(int)n;
- (id)initWithCard:(Card *)card;

@end
