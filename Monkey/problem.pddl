(define (problem monkey_banana)
    (:domain monkey_typed)
    (:objects
        macaco - MONKEY
        caixa - BOX
        banana - BANANA
        ponto_a - POINT
        ponto_b - POINT
        ponto_c - POINT
        alto - HEIGHT
        baixo - HEIGHT
    )
    (:init
        (at macaco ponto_a)
        (at caixa ponto_b)
        (at banana ponto_c)
        (height macaco baixo)
        (height banana baixo)
        (height caixa baixo)
    )
    (:goal
        (and
            (with macaco banana)
            (at macaco ponto_a)
            (at banana ponto_a)
        )
    )
)