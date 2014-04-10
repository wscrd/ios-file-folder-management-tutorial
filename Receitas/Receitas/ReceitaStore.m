//
//  ReceitaStore.m
//  Receitas
//
//  Created by Vinicius Miana on 3/30/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "ReceitaStore.h"
#import "MackenzieAppDelegate.h"

@implementation ReceitaStore {
    NSMutableArray *receitas;
    NSInteger current;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        receitas = (NSMutableArray *)[aDecoder decodeObjectForKey:@"receitas"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:(NSArray *)receitas forKey:@"receitas"];
}
+ (ReceitaStore *)sharedInstance
{
    static ReceitaStore *sharedInstance = nil;
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:nil] initPrivado];
    }
    return sharedInstance;
}

-(id)initPrivado {
    self = [super init];
    if(self) {
        // TODO recuperar as receitas do arquivo
        NSURL *caminho = [MackenzieAppDelegate caminhoDoArquivo];
        receitas = [NSKeyedUnarchiver unarchiveObjectWithFile:[caminho path]];
        if (!receitas) {
            receitas = [[NSMutableArray alloc] init];
        }
        current = 0;
    }
    return self;
}


-(Receita*)previous {
    if(current == 0) {
        current = receitas.count - 1;
    } else {
        current--;
    }
    return [receitas objectAtIndex:current];
}

-(Receita*)next {
    if(current == receitas.count - 1) {
        current = 0;
    } else {
        current++;
    }
    return [receitas objectAtIndex:current];
}

-(void)addReceita:(Receita*)novaReceita {
    // TODO implementar este metodo -> adicionar no array e no arquivo!!!
    [receitas addObject:novaReceita];
    NSURL *caminho = [MackenzieAppDelegate caminhoDoArquivo];
    [receitas addObject:novaReceita];
    [NSKeyedArchiver archiveRootObject:(NSArray *)receitas toFile:[caminho path]];
}




@end
