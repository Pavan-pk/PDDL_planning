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
            (off ?s)
            (forall (?n1 - switch)
                (imply
                    (and (neighbors ?s ?n1) (on ?n1))
                    (not(exists
                        (?n2 - switch)
                        (and
                            (not(= ?n1 ?n2))
                            (neighbors ?s ?n2)
                            (on ?n2)
                        )
                    ))
                )
            )
        )
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