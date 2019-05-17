(define (problem block)
    (:domain block_typed)
    (:objects
        R1 - ROBOT
	    R2 - ROBOT
        caixaA - BOX
        caixaB - BOX
        caixaC - BOX
	  	ponto1 - POINT
	    ponto2 - POINT
	    ponto3 - POINT
	    ponto4 - POINT
	    ponto5 - POINT
	    ponto6 - POINT
	    ponto7 - POINT
	    ponto8 - POINT
	    ponto9 - POINT
	    ponto10 - POINT
	    ponto11 - POINT
	    ponto12 - POINT
	           
    )
    (:init
        (at R1 ponto2)
        (at R2 ponto6)
        (empty R1)
        (empty R2)
        (at caixaA ponto11)
        (at caixaB ponto7)
        (at caixaC ponto11)
        (ontable caixaA)
        (ontable caixaB)
        (on caixaC caixaA)
        (clear caixaC)
        (clear caixaB)
    )
    
    (:goal 
	    (and 
	        (at caixaA ponto12)
	        (at caixaB ponto12)
	        (at caixaC ponto12)
	        (ontable caixaA)
	        (on caixaB caixaA)
	        (on caixaC caixaB)
	    )
    )
)
