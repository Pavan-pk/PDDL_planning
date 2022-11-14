(define (domain simple_switches)
    (:requirements :typing :equality)
    
    ;; this domain has one type of object
    (:types switch)

    (:predicates
        ;; the properties of a switch
        (off ?s - switch)
        (on ?s - switch)
        (neighbors ?s1 ?s2 - switch)
    )

    ;; this action toggles a switch ON
    (:action switch_on
        :parameters (?s - switch)
        :precondition (and
                        (exists (?n - switch)
                        (and
                            (neighbors ?s ?n)
                            (on ?n)
                        )
                    ))
        :effect (and
            (not (off ?s))
            (on ?s)
        )
    )
    
    ;; this action toggles a switch OFF
    (:action switch_off
        :parameters (?s - switch)
        :precondition (and
            (on ?s)
        )
        :effect (and
            (off ?s)
            (not (on ?s))
        )
    )
)