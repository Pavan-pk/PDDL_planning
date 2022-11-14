(define (problem more_switches)
(:domain simple_switches)
    
    (:objects
        ;; more switches
        switch_1 switch_2 switch_3 switch_4 switch_5 - switch
        switch_6 switch_7 switch_8 switch_9 switch_10 - switch
    )
    
    (:init
        ;; all off
        (on switch_1)
        (off switch_2)
        (on switch_3)
        (off switch_4)
        (off switch_5)
        (on switch_6)
        (off switch_7)
        (off switch_8)
        (on switch_9)
        (off switch_10)
        (neighbors switch_1 switch_2)
        (neighbors switch_2 switch_1)
        (neighbors switch_2 switch_3)
        (neighbors switch_3 switch_2)
        (neighbors switch_3 switch_4)
        (neighbors switch_4 switch_3)
        (neighbors switch_4 switch_5)
        (neighbors switch_5 switch_4)
        (neighbors switch_5 switch_6)
        (neighbors switch_6 switch_5)
        (neighbors switch_6 switch_7)
        (neighbors switch_7 switch_6)
        (neighbors switch_7 switch_8)
        (neighbors switch_8 switch_7)
        (neighbors switch_8 switch_9)
        (neighbors switch_9 switch_8)
        (neighbors switch_9 switch_10)
        (neighbors switch_10 switch_9)
    )
    
    (:goal (and
        ;; all on
        (forall (?s - switch) (on ?s))
    ))
)