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

temperatura(TemperaturaExterior, TemperaturaMedia, CotaSuperior, CotaInferior, Ajuste, Rendimento, Write) :-

        TemperaturaMedia > CotaSuperior,
        TemperaturaExterior > CotaSuperior,
        cota(CotaSuperior, CotaInferior, TemperaturaMedia, Rendimento),
        append("Sistem (Erro): Temperatura exterior muito alta.", "MuitoQuenteException", Write), !.

temperatura(TemperaturaExterior, TemperaturaMedia, CotaSuperior, CotaInferior, Ajuste, Rendimento, Write) :-

        % forca rendimento ficar entre as cotas superior e inferior pelo ajuste em %
        TemperaturaMedia < CotaInferior,
        TemperaturaExterior < CotaInferior,
        cota(CotaSuperior, CotaInferior, TemperaturaMedia, Rendimento),
        append("Sistema (Erro): Temperatura exterior muito baixa.","MuitoFrioException", Write), !.

temperatura(TemperaturaExterior, TemperaturaMedia, CotaSuperior, CotaInferior, Ajuste, Rendimento, Write) :-

        % Otherwise, find the yield, but make sure it is bounded.
        ajuste(TemperaturaExterior, TemperaturaMedia, Ajuste, Unbounded),
        cota(CotaSuperior, CotaInferior, Unbounded, Rendimento),
        \+ Unbounded == Rendimento,
        append("Sistem (Erro): Ajuste fora dos limites.", "", Write), !.

temperatura(TemperaturaExterior, TemperaturaMedia, CotaSuperior, CotaInferior, Ajuste, Rendimento, Write) :-
        ajuste(TemperaturaExterior, TemperaturaMedia, Ajuste, Unbounded),
        cota(CotaSuperior, CotaInferior, Unbounded, Rendimento),
        append("Sistem (Decidido): Temperatura ajustada.", "", Write), !.

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

something(X,Y,W) :- Y is X, append("", "", W).

main :-
        % test cotas
        cota( 100  , 12   , 20 , TestResult ) ,
        cota( 50   , 104  , 20 , TestResult ) ,
        cota( 30   , 112  , 50 , TestResult ) ,
        cota( 110  , 10   , 70 , TestResult ) ,
        cota( 140  , 510  , 80 , TestResult ) ,
        cota( 600  , 7600 , 32 , TestResult ) ,
        cota( 300  , 700  , 10 , TestResult ) ,
        cota( 400  , 200  , 0  , TestResult ) ,
        cota( 130  , 400  , 0  , TestResult ) ,
        cota( 544  , 70   , 40 , TestResult ) ,
        cota( 1204 , 0    , 50 , TestResult ) ,
        cota( 1420 , 0    , 66 , TestResult ) ,

        % test temperaturas
        temperatura( 45  , 12  , 63   , 13    , 4    , TestRendimento , Test ) ,
        temperatura( 140 , 13  , 543  , 634   , 4    , TestRendimento , Test ) ,
        temperatura( 30  , 613 , 341  , 33    , 4    , TestRendimento , Test ) ,
        temperatura( 0   , 63  , 0    , 53    , 0    , TestRendimento , Test ) ,
        temperatura( 23  , 1   , 4    , 53    , 434  , TestRendimento , Test ) ,
        temperatura( 413 , 1   , 0    , 53    , 24   , TestRendimento , Test ) ,
        temperatura( 631 , 13  , 0    , 53    , 17   , TestRendimento , Test ) ,
        temperatura( 50  , 312 , 34   , 53    , 145  , TestRendimento , Test ) ,
        temperatura( 31  , 163 , 1143 , 53    , 2134 , TestRendimento , Test ) ,
        temperatura( 13  , 43  , 143  , 53    , 9283 , TestRendimento , Test ) ,
        temperatura( 0   , 0   , 0    , 0     , 0    , TestRendimento , Test ) ,
        temperatura( 100 , 100 , 100  , 100   , 100  , TestRendimento , Test ) ,
        temperatura( 0   , 100 , 100  , 53100 , 0    , TestRendimento , Test ) ,

        % test ajustes

        ajuste( 30  , 613 , TestAjuste , TestRendimento ) ,
        ajuste( 0   , 63  , TestAjuste , TestRendimento ) ,
        ajuste( 45  , 12  , TestAjuste , TestRendimento ) ,
        ajuste( 631 , 13  , TestAjuste , TestRendimento ) ,
        ajuste( 0   , 100 , TestAjuste , TestRendimento ) ,
        ajuste( 31  , 163 , TestAjuste , TestRendimento ) ,
        ajuste( 413 , 1   , TestAjuste , TestRendimento ) ,
        ajuste( 50  , 312 , TestAjuste , TestRendimento ) ,
        ajuste( 23  , 1   , TestAjuste , TestRendimento ) ,
        ajuste( 140 , 13  , TestAjuste , TestRendimento ) ,
        ajuste( 13  , 43  , TestAjuste , TestRendimento ) ,
        ajuste( 0   , 0   , TestAjuste , TestRendimento ) ,
        ajuste( 100 , 100 , TestAjuste , TestRendimento ) .
