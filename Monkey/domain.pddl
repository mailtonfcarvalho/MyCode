(define (domain monkey_typed)
    (:requirements :strips :typing) 
    (:types MONKEY BOX POINT HEIGHT BANANA)
    (:predicates 	
    	(at ?obj ?loc)                                      
    	(on ?mky ?box)                                      
    	(height ?obj ?hgt)                                  
    	(with ?mky ?ban)                                    
    )
    (:action go
        :parameters
        	 (?mky - MONKEY                                 
        	  ?from - POINT                                 
        	  ?to - POINT)                                  
        :precondition 
        	(and
        	    (at ?mky ?from)                                
                (height ?mky baixo)
            )
        :effect
        	(and 
        	    (at ?mky ?to)
        	    (not (at ?mky ?from)) 
            )       
    )
    
    (:action push
        :parameters
        	 (?mky - MONKEY
        	  ?box - BOX
        	  ?from - POINT
        	  ?to - POINT)
        :precondition
        	(and 
        	    (at ?mky ?from) 
        	    (at ?box ?from) 
        	    (height ?mky baixo)
        	    (height ?box baixo)
            )  
        :effect
        	(and
        	    (at ?mky ?to) 
        	    (at ?box ?to)                     
        	    (not (at ?mky ?from)) 
        	    (not (at ?box ?from))
            )    
    )
    
    (:action climb
        :parameters 
            (?mky - MONKEY 
             ?box - BOX 
             ?loc - POINT)
        :precondition 
            (and 
                (at ?mky ?loc) 
                (at ?box ?loc) 
                (height ?mky baixo)
                (height ?box baixo)
            ) 
        :effect 
            (and                                     
                 (height ?mky alto)                                 
                 (not (height ?mky baixo)) 
            ) 
    )
    
       (:action take_and_down
        :parameters 
            (?mky - MONKEY 
            ?ban - BANANA 
            ?box - BOX 
            ?loc - POINT) 
        :precondition 
            (and 
                (height ?mky alto) 
                (height ?ban alto)
                (height ?box baixo)
                (at ?mky ?loc) 
                (at ?ban ?loc) 
                (at ?box ?loc))
        :effect 
            (and 
                (with ?mky ?ban)                               
                (height ?mky baixo)                            
                (height ?ban baixo)                             
                (not (height ?mky alto))                      
                (not (height ?ban alto))
            )                      
    )
    
    (:action take_banana_baixo
        :parameters 
            (?mky - MONKEY 
            ?ban - BANANA
            ?loc - POINT) 
        :precondition 
            (and 
                (height ?mky baixo) 
                (height ?ban baixo)
                (at ?mky ?loc) 
                (at ?ban ?loc) 
        	)
               
        :effect 
                (with ?mky ?ban)
                                
    )
    
     (:action go_back                          
        :parameters
        	 (?mky - MONKEY 
        	  ?ban - BANANA
        	  ?from - POINT
        	  ?to - POINT)
        :precondition
        	(and 
        	    (at ?mky ?from) 
        	    (at ?ban ?from)
        	    (height ?mky baixo)
        	    (height ?ban baixo)
        	    (with ?mky ?ban)
        	)
        :effect
        	(and 
        	     (at ?mky ?to) 
        	     (not (at ?mky ?from))
        	     (at ?ban ?to)
        	     (not (at ?ban ?from))
        	)
    )
)