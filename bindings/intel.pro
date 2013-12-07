%%%%%%%%%%%%
% Limiares %
%%%%%%%%%%%%

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

%%%%%%%%%%%
% Decisor %
%%%%%%%%%%%

decisao_tambiente(TemperaturaExterior, TemperaturaMedia, CotaSuperior, CotaInferior, Ajuste, Rendimento, Write) :-

        TemperaturaMedia > CotaSuperior,
        TemperaturaExterior > CotaSuperior,
        cota(CotaSuperior, CotaInferior, TemperaturaMedia, Rendimento),
        append("Sistem (Erro): Temperatura exterior muito alta.", "MuitoQuenteException", Write), !.

decisao_tambiente(TemperaturaExterior, TemperaturaMedia, CotaSuperior, CotaInferior, Ajuste, Rendimento, Write) :-

        % forca rendimento ficar entre as cotas superior e inferior pelo ajuste em %
        TemperaturaMedia < CotaInferior,
        TemperaturaExterior < CotaInferior,
        cota(CotaSuperior, CotaInferior, TemperaturaMedia, Rendimento),
        append("Sistema (Erro): Temperatura exterior muito baixa.","MuitoFrioException", Write), !.

decisao_tambiente(TemperaturaExterior, TemperaturaMedia, CotaSuperior, CotaInferior, Ajuste, Rendimento, Write) :-

        % caso contrario procura por um bom rendimento
        ajuste(TemperaturaExterior, TemperaturaMedia, Ajuste, Unbounded),
        cota(CotaSuperior, CotaInferior, Unbounded, Rendimento),
        \+ Unbounded == Rendimento,
        append("Sistem (Erro): Ajuste fora dos limites.", "", Write), !.

decisao_tambiente(TemperaturaExterior, TemperaturaMedia, CotaSuperior, CotaInferior, Ajuste, Rendimento, Write) :-
        ajuste(TemperaturaExterior, TemperaturaMedia, Ajuste, Unbounded),
        cota(CotaSuperior, CotaInferior, Unbounded, Rendimento),
        append("Sistem (Decidido): Temperatura ajustada.", "", Write), !.


%%%%%%%%%%%%%%
% Calculador %
%%%%%%%%%%%%%%

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
