(define (problem more_switches)
(:domain simple_switches)
    
    (:objects
        ;; more switches
        switch_1 switch_2 switch_3 switch_4 switch_5 - switch
    )
    
    (:init
        ;; all off
        (off switch_1)
        (off switch_2)
        (on switch_3)
        (off switch_4)
        (off switch_5)
        (neighbors switch_1 switch_2)
        (neighbors switch_2 switch_1)
        (neighbors switch_2 switch_3)
        (neighbors switch_3 switch_2)
        (neighbors switch_3 switch_4)
        (neighbors switch_4 switch_3)
        (neighbors switch_4 switch_5)
        (neighbors switch_5 switch_4)
    )
    
    (:goal (and
        ;; all on
        (forall (?s - switch) (on ?s))
    ))
)