# Definição de sistema especialista (SE)

Um sistema especialista é um sistema computacional com uma estratégia de resolução de problemas.

![Sistemas Especialistas](sesets.png "Sistemas Especialistas")

# Linguagens Pesquisadas

Seguem as linguagens que pesquisamos para interface com o usuário. Todas são ótimas e trabalham bem a abordagem de se fazer ponte entre uma base de conhecimentos em Prolog.

## Perl

[Linguagem Perl](http://en.wikipedia.org/wiki/Perl)

* functional
* imperative
* object-oriented (class-based)
* reflective
* procedural
* data-driven
* generic

## Ruby

[Linguagem Ruby](http://en.wikipedia.org/wiki/Ruby_%28programming_language%29)

* object-oriented
* imperative
* functional
* reflective

## C

[Linguagem C](http://en.wikipedia.org/wiki/C_%28programming_language%29)

* Imperative (procedural)
* Structured

## Python

[Linguagem Python](http://en.wikipedia.org/wiki/Python_%28programming_language%29)

A linguagem escolhida é Python e estou usando [pyswip](http://code.google.com/p/pyswip).

* object-oriented
* imperative
* functional
* procedural
* reflective

## Java

[Linguagem Java](http://en.wikipedia.org/wiki/Java_%28programming_language%29)

* object-oriented
* structured
* imperative
* generic
* reflective

## C++

[Linguagem C++](http://en.wikipedia.org/wiki/C++_%28programming_language%29)

* procedural
* functional
* object-oriented
* generic


# Arquitetura (Software architecture)

Base de Conhecimentos

É basicamente uma série de regras que serão feitas em prolog.

```
IF   | <algo acontecer> ; Antecendente
THEN | <faça isso>      ; Consequência
```

As regras precisam associar a evidência sobre o problema. Sob considerações a fim de o sistema especialista tirar conclusões para a linguagem de mais alto nível. Exemplos:

Verifica se o valor da temperatura está regulado corretamente.

```prolog
cota(CotaSuperior, CotaInferior, X, Result) :-
        X > CotaSuperior,
        Result is CotaSuperior, !.
cota(CotaSuperior, CotaInferior, X, Result) :-
        X < CotaInferior,
        Result is CotaInferior, !.
cota(CotaSuperior, CotaInferior, X, Result) :-
        X =< CotaSuperior,
        X >= CotaInferior,
        Result is X, !.
```

Se a temperatura média e a de fóra estão abaixo da cota superior a elas que é definida logo no começo
seta a temperatura para alguma temperatura cujo rendimento é válido para as preferencias dos hospedes.

```prolog
setto(TemperaturaExterior, TemperaturaMedia, CotaSuperior, CotaInferior, Ajuste, Rendimento, Write) :-

        TemperaturaMedia > CotaSuperior,
        TemperaturaExterior > CotaSuperior,
        cota(CotaSuperior, CotaInferior, TemperaturaMedia, Rendimento),
        append("Sistem (Erro): Temperatura exterior muito alta.", "MuitoQuenteException", Write), !.

Ou forma o rendimento ficar entre as cotas superiores ou inferiores.

setto(TemperaturaExterior, TemperaturaMedia, CotaSuperior, CotaInferior, Ajuste, Rendimento, Write) :-
        TemperaturaMedia < CotaInferior,
        TemperaturaExterior < CotaInferior,
        cota(CotaSuperior, CotaInferior, TemperaturaMedia, Rendimento),
        append("Sistema (Erro): Temperatura exterior muito baixa.","MuitoFrioException", Write), !.

Caso contrario procura por um bom rendimento

setto(TemperaturaExterior, TemperaturaMedia, CotaSuperior, CotaInferior, Ajuste, Rendimento, Write) :-
        ajuste(TemperaturaExterior, TemperaturaMedia, Ajuste, Unbounded),
        cota(CotaSuperior, CotaInferior, Unbounded, Rendimento),
        \+ Unbounded == Rendimento,
        append("Sistem (Erro): Ajuste fora dos limites.", "", Write), !.

setto(TemperaturaExterior, TemperaturaMedia, CotaSuperior, CotaInferior, Ajuste, Rendimento, Write) :-
        ajuste(TemperaturaExterior, TemperaturaMedia, Ajuste, Unbounded),
        cota(CotaSuperior, CotaInferior, Unbounded, Rendimento),
        append("Sistem (Decidido): Temperatura ajustada.", "", Write), !.
```


Aqui seria o motor de decisão realmente, onde ele decide ajustar ou não dependendo dos valores problema passados pelo programinha em Python.

```prolog
ajuste(TemperaturaExterior, TemperaturaMedia, Ajuste, Rendimento) :-
        \+ TemperaturaMedia == TemperaturaExterior,
        TemperaturaExterior > TemperaturaMedia,
        abs(TemperaturaExterior-TemperaturaMedia, TaxaVariacao),
        abs(TemperaturaExterior - (TaxaVariacao * (1 - (Ajuste / 100))), Rendimento).

ajuste(TemperaturaExterior, TemperaturaMedia, Ajuste, Rendimento) :-
        \+ TemperaturaMedia == TemperaturaExterior,
        TemperaturaExterior < TemperaturaMedia,
        abs(TemperaturaExterior-TemperaturaMedia, TaxaVariacao),
        abs(TemperaturaExterior + (TaxaVariacao * (1 - (Ajuste / 100))), Rendimento).

ajuste(TemperaturaExterior, TemperaturaExterior, Ajuste, Rendimento) :-
        TemperaturaMedia == TemperaturaExterior,
        Rendimento is TemperaturaExterior.
```

A máquina de inferências é um programa de computador desenhado para produzir um dicernimento sobre regras. Existem muitos tipos de abordagens lógicas, via lógica proposicional, predicados de ordem >= 1, lógica epistêmica, lógica modal, lógica temporal, lógica fuzzy, lógica probabilistica (implementada por Redes de Bayesianas), dentre outras. A proposicional é mais usada, por ser natural nos seres humanos, e é expressada com silogismos. O sistema especialista que usa tal lógica é também chamado de ordem zero-ésima. Com lógica, o programa é capaz de gerar novas informações vindas do conhecimento na base de regras e informações.

- __Base de Conhecimento__: Regras IF-THEN-ELSE.
- __Base de Dados__: Dados específicos para o problema.
- __Mecânismo de Inferência__: O núcleo pensante.
- __Interface de Usuário__: Faz o diálogo.

![Modelo](sesch.jpg "Modelo")

# Implementação

Implementar um Sistema Especialista utilizando a integração da linguagem prolog com uma linguagem imperativa de alto nível, como Java ou C++.

Pesquisar recursos existentes, como bibliotecas ou frameworks que permitam esta integração e implementar um exemplo de aplicação na qual a __interface de usuário__ seja implementada na __linguagem escolhida__ e a __base de conhecimento__ e as regras de inferencia sejam implementadas em __prolog__.

# Sugestões

[pl2cpp](http://www.swi-prolog.org/pldoc/package/pl2cpp.html)

[pylog](http://cdsoft.fr/pylog/)

[pyswip](https://code.google.com/p/pyswip/)

[gnuprologjava](http://www.gnu.org/software/gnuprologjava/)

# Referências

[Expert System at Wiki](https://en.wikipedia.org/wiki/Expert_system)

[Language Binding at Wiki](http://en.wikipedia.org/wiki/Language_binding)

[Sistemas Especialistas](http://www.dee.ufma.br/~lpaucar/teaching/ia2000-1/cap4.html)

[IRQ Expert System](http://www.amzi.com/articles/irq_expert_system.htm)

[Building Expert Systems in Prolog](http://www.amzi.com/ExpertSystemsInProlog/index.htm)

[Interfacing Arduino Python](http://playground.arduino.cc/Interfacing/Python)

[Python Unit Test Framework](http://pyunit.sourceforge.net/pyunit.html)
