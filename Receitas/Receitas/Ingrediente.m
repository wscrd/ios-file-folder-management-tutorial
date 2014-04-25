//
//  Ingrediente.m
//  Receitas
//
//  Created by Wesley Scardua on 4/7/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "Ingrediente.h"

@implementation Ingrediente

@synthesize nome;
@synthesize quantidade;



-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        nome = [aDecoder decodeObjectForKey:@"nome"];
        quantidade = [aDecoder decodeFloatForKey:@"quantidade"];
    }
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:nome forKey:@"nome"];
    [aCoder encodeFloat:quantidade forKey:@"quantidade"];
}

- (id)initWithNome:(NSString *) ingrediente quantidade:(float) qte {
    if (self = [super init]) {
        nome = ingrediente;
        quantidade = qte;
    }
    return self;
}

@end
