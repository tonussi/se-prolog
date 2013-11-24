# Definição de sistema especialista (SE)

Um sistema especialista é um sistema computacional com uma estratégia de resolução de problemas.

![Sistemas Especialistas](http://www.dee.ufma.br/~lpaucar/teaching/ia2000-1/figs/se1.gif "Sistemas Especialistas")


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

# Arquitetura (Software architecture)

Base de Conhecimentos

É basicamente uma série de regras que serão feitas em prolog.

```
IF   | <algo acontecer> ; Antecendente
THEN | <faça isso>      ; Consequência
```

As regras precisam associar a evidência sobre o problema. Sob considerações a fim de o sistema especialista tirar conclusões para a linguagem de mais alto nível. Exemplos:

```
IF   | <está vivo>
THEN | <é mortal>

IF   | <idade = conhecida>
THEN | <ano de nascimento = ano atual - idade em anos>

IF   | <the identity of the germ is not known with certainty>
     + AND <the germ is gram-positive>
     + AND <the morphology of the organism is rod>
     + AND <the germ is aerobic>
THEN | <there is a strong probability (0.8) that germ is of type enterobacteriacae>
```

A máquina de inferências é um programa de computador desenhado para produzir um dicernimento sobre regras. Existem muitos tipos de abordagens lógicas, via lógica proposicional, predicados de ordem >= 1, lógica epistêmica, lógica modal, lógica temporal, lógica fuzzy, lógica probabilistica (implementada por Redes de Bayesianas), dentre outras. A proposicional é mais usada, por ser natural nos seres humanos, e é expressada com silogismos. O sistema especialista que usa tal lógica é também chamado de ordem zero-ésima. Com lógica, o programa é capaz de gerar novas informações vindas do conhecimento na base de regras e informações.
