(deffacts pedidoFrutas
    (palets naranjas 3 manzanas 3 caquis 3 uvas 3)
    (robot maximo 3 naranjas 0 manzanas 0 caquis 0 uvas 0)
    (pedido naranjas 2 manzanas 3 caquis 0 uvas 1)
)

(defrule recoger_cajas
    ?f1 <- (palets naranjas ?np manzanas ?mp caquis ?cp uvas ?up)
    ?f2 <- (robot maximo ?max naranjas ?nr manzanas ?mr caquis ?cr uvas ?ur)
=>
    (assert )
)