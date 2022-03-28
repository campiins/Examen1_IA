(deffacts pedidoFrutas
    (palets naranjas 3 manzanas 3 caquis 3 uvas 3)
    (robot maximo 3 naranjas 0 manzanas 0 caquis 0 uvas 0)
    (pedido naranjas 2 manzanas 3 caquis 0 uvas 1)
    (linea naranjas 0 manzanas 0 caquis 0 uvas 0)
)

(defrule recoger_naranjas
    (declare (salience 10))
    ?f1 <- (pedido naranjas ?np $?rest1)
    ?f2 <- (palets naranjas ?n $?rest2)
    ?f3 <- (robot maximo ?max naranjas ?nr $?rest3)
    (test (<= ?np ?max))
=>
    (assert (palets naranjas (- ?n ?np) $?rest2))
    (assert (robot maximo ?max naranjas (+ ?nr ?np) $?rest3))
    (retract ?f2)
    (retract ?f3)
)

(defrule dejar_en_linea
    (declare (salience 20))
    ?f1 <- (robot maximo ?max naranjas ?nr manzanas ?mr caquis ?cr uvas ?ur)
    ?f2 <- (linea naranjas ?nl manzanas ?ml caquis ?cl uvas ?ul)
    =>
    (assert (linea naranjas ?nr manzanas ?mr caquis ?cr uvas ?ur))
    (assert (robot maximo ?max naranjas 0 manzanas 0 caquis 0 uvas 0))
    ;(retract ?f1)
    ;(retract ?f2)
)

(defrule pedidoFinalizado
    ?f1 <- 
)