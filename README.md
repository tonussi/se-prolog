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



# Arquitetura (Software architecture)

Base de Conhecimentos

In expert system technology, the knowledge base is expressed with natural language rules IF ... THEN ...

Every rule has an IF part, also called the antecedent and a THEN part, also called the consequent part. These rules must link the evidence about the problem under consideration to the conclusion. For examples :

    "IF it is living THEN it is mortal"
    "IF his age = known THEN his year of birth = current year - his age in years"
    "IF the identity of the germ is not known with certainty AND the germ is gram-positive AND the morphology of the organism is "rod" AND the germ is aerobic THEN there is a strong probability (0.8) that germ is of type enterobacteriacae"[27]

This formulation has the advantage of speaking in everyday language which is very rare in computer science (a classic program is coded). Rules express the knowledge to be exploited by the expert system. There exist other formulations of rules, which are not in everyday language, understandable only to computer scientists. Each rule style is adapted to an engine style.
The inference engine

The inference engine is a computer program designed to produce a reasoning on rules. In order to produce a reasoning, it should be based on logic. There are several kinds of logic: propositional logic, predicates of order 1 or more, epistemic logic, modal logic, temporal logic, fuzzy logic, probabilistic logic (implemented in a Bayesian network), etc. Propositional logic is the basic human logic, that is expressed in syllogisms. The expert system that uses that logic is also called a zeroth-order expert system. With logic, the engine is able to generate new information from the knowledge contained in the rule base and data to be processed.

The engine has two ways to run: batch or conversational. In batch, the expert system has all the necessary data to process from the beginning. For the user, the program works as a classical program: he provides data and receives results immediately. Reasoning is invisible. The conversational method becomes necessary when the developer knows he cannot ask the user for all the necessary data at the start, the problem being too complex. The software must "invent" the way to solve the problem, request the missing data from the user, gradually approaching the goal as quickly as possible. The result gives the impression of a dialogue led by an expert. To guide a dialogue, the engine may have several levels of sophistication: "forward chaining", "backward chaining" and mixed chaining. Forward chaining is the questioning of an expert who has no idea of the solution and investigates progressively (e.g. fault diagnosis). In backward chaining, the engine has an idea of the target (e.g. is it okay or not? Or: there is danger but what is the level?). It starts from the goal in hopes of finding the solution as soon as possible. In mixed chaining the engine has an idea of the goal but it is not enough: it deduces in forward chaining from previous user responses all that is possible before asking the next question. So quite often he deduces the answer to the next question before asking it.

A strong interest in using logic is that this kind of software is able to give the user clear explanation of what it is doing (the "Why?") and what it has deduced (the "How?" ). Better yet, thanks to logic, the most sophisticated expert systems are able to detect contradictions[28] in user information or in the knowledge and can explain them clearly, revealing at the same time the expert's knowledge and way of thinking.
