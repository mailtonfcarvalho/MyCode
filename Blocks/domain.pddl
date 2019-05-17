(define (domain block_typed)
    (:requirements :strips :typing) 
    (:types ROBOT BOX POINT )
    (:predicates 	
    	(at ?obj ?loc)                                     
    	(clear ?box)
    	(holding ?rbt ?box)
    	(on ?obj ?obj)
    	(empty ?rbt)
    	(ontable ?box)
    )
    
    (:action go
        :parameters
        (
            ?rbt - ROBOT
            ?from - POINT                                 
            ?to - POINT
        )                                 
        :precondition
        	    (at ?rbt ?from)
        	
        :effect
        	(and 
        	    (at ?rbt ?to)
        	    (not (at ?rbt ?from)) 
            )
    )
    
    (:action popBox
        :parameters
        (
            ?rbt - ROBOT
            ?box1 - BOX
            ?box2 - BOX
            ?loc - POINT
        )
        :precondition
            (and 
                (at ?rbt ?loc) 
                (at ?box1 ?loc)
                (on ?box1 ?box2)
                (empty ?rbt)
                (clear ?box1)
            )
        :effect
            (and 
                (holding ?rbt ?box1)
                (clear ?box2)
                (not(empty ?rbt)) 
                (not (on ?box1 ?box2))
                (not (clear ?box1))
        	)
    )
    
    (:action get_box_table
	:parameters
		(?rbt - ROBOT
		 ?box - BOX
		 ?loc - POINT)
	:precondition
		(and
		    (at ?rbt ?loc)
		    (at ?box ?loc)
		    (empty ?rbt)
		    (clear ?box)
		    (ontable ?box)
		)
	:effect
  		(and 	
  		    (holding ?rbt ?box)
			(not (empty ?rbt)) 
			(not(clear ?box))
			(not(ontable ?box))
		)
	)
    
    (:action go_robot_box                          
        :parameters
        	 (?rbt - ROBOT
        	  ?box - BOX
        	  ?from - POINT
        	  ?to - POINT)
        :precondition
        	(and
    
        	    (holding ?rbt ?box)
        	    (at ?rbt ?from) 
        	    (at ?box ?from)
        	)
        	   
        :effect
        	(and
        	    (at ?rbt ?to) 
        	    (not (at ?rbt ?from))
        	    (at ?box ?to)
        	    (not (at ?box ?from))
        	)
    )
    
    (:action put_down_box
	:parameters
		(?box1 - BOX
		 ?box2 - BOX
		 ?rbt - ROBOT
		 ?loc - POINT)
	:precondition
		(and   
		    (holding ?rbt ?box1)
		    (not(empty ?rbt))
		    (not(clear ?box1))
		    (clear ?box2)
		)
	:effect
		(and	
		    (empty ?rbt)
			(on ?box1 ?box2)
			(clear ?box1)
			(not (clear ?box2)) 
			(not(holding ?rbt ?box1))
		)
	)
    
    (:action put_box_table
	:parameters
		(?box - BOX
		 ?rbt - ROBOT
		 ?loc - POINT)
	:precondition
		(and
		    (holding ?rbt ?box)
		    (not(empty ?rbt))
		    (not(clear ?box))
		)
	:effect
		(and	
		    (empty ?rbt)
			(ontable ?box)
			(clear ?box)
			(not (holding ?rbt ?box))
		)
	)
)