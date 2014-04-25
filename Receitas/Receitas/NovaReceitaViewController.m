//
//  NovaReceitaViewController.m
//  Receitas
//
//  Created by Wesley Scardua on 4/10/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "NovaReceitaViewController.h"
#import "Receita.h"
#import "Ingrediente.h"
#import "ReceitaStore.h"
#import "ReceitaViewController.h"
@interface NovaReceitaViewController () {
    NSMutableArray *igd;
    Receita *atual;
    UITapGestureRecognizer *tap;
    CGRect p;
    //Usar NSDictionary para guardar estes vetores
}

@end

@implementation NovaReceitaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    igd = [[NSMutableArray alloc] init];

    p = _passos.frame;
    _campoNome.delegate =self;
    _quantidade.delegate = self;
    _ingrediente.delegate = self;
    _passos.delegate =self;
    
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(retiraTeclado)];
    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
    [_botaoSalvar setHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    
    NSLog(@"string");
    [_passosTexto setHidden:YES];
    float largura = p.size.width;
    float altura = p.size.height;
    float larguraEspaco = (self.view.frame.size.width - largura)/2;
    float alturaEspaco = (self.view.frame.size.height - altura)/2;
    
    [_passos setFrame:CGRectMake(larguraEspaco, alturaEspaco, largura, altura)];
    
    
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    _passos.frame = p;
    [_passosTexto setHidden:NO];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) retiraTeclado {
    [self.view endEditing:YES];
}


- (IBAction)adicionarIngrediente:(id)sender {
    if (_campoNome.text.length > 0
        && _ingrediente.text.length >0
        && _quantidade.text.length > 0) {
        Ingrediente *aux = [[Ingrediente alloc] initWithNome:_ingrediente.text quantidade:[_quantidade.text floatValue]];
        [igd addObject:aux];
        [_botaoSalvar setHidden:NO];
        _quantidade.text = @"";
        _ingrediente.text = @"";
        
    }
    else {
        NSLog(@"Sem Nome/Ingrediente/Unidade/Quantidade");
    }
}

- (IBAction)voltar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)salvar:(id)sender {
    NSLog(@"botao Salvar");
    if (_campoNome.text.length > 0) {
        [_botaoSalvar setHidden:YES];
        atual = [[Receita alloc] initWithNome:_campoNome.text passos:_passos.text eIngredientes:igd];
        [[ReceitaStore sharedInstance] addReceita:atual];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}
@end
