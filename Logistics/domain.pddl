(define (domain basic_logistics)
    (:requirements :typing)
    (:types location package truck driver)
    (:predicates
        (in ?t - truck ?p - package)
        (at ?loc - location ?any)
        (link ?loc1 - location ?loc2 - location)
        (driving ?t - truck ?d - driver)
    )

    (:action board_truck
        :parameters (?loc - location ?t - truck ?d - driver)
        :precondition (and
            (at ?loc ?t)
            (at ?loc ?d)
            (not(exists(?t1 - truck)(driving ?t1 ?d)))
            (not(exists(?d1 - driver)(driving ?t ?d1)))
        )
        :effect (and
            (not(at ?loc ?d))
            (driving ?t ?d)
        )
    )
    
    (:action disembark_truck
        :parameters (?loc - location ?t - truck ?d - driver)
        :precondition (and
            (at ?loc ?t)
            (driving ?t ?d)
        )
        :effect (and
            (not(driving ?t ?d))
            (at ?loc ?d)
        )
    )
    
    (:action load_package
        :parameters (?loc - location ?t - truck ?p - package)
        :precondition (and
            (at ?loc ?t)
            (at ?loc ?p)
            (not(exists(?t1 - truck)(in ?t1 ?p)))
        )
        :effect (and
            (not(at ?loc ?p))
            (in ?t ?p)
        )
    )
    
    (:action unload_package
        :parameters (?loc - location ?t - truck ?p - package)
        :precondition (and
            (at ?loc ?t)
            (in ?t ?p)
        )
        :effect (and
            (not(in ?t ?p))
            (at ?loc ?p)
        )
    )
    
    (:action walk
        :parameters (?loc1 - location ?loc2 - location ?d - driver)
        :precondition (and
            (at ?loc1 ?d)
            (link ?loc1 ?loc2)
            (not(exists(?t - truck)(driving ?t ?d)))
        )
        :effect (and
            (not(at ?loc1 ?d))
            (at ?loc2 ?d)
        )
    )
    
    (:action drive_truck
        :parameters (?loc1 - location ?loc2 - location ?d - driver ?t - truck)
        :precondition (and
            (at ?loc1 ?t)
            (link ?loc1 ?loc2)
            (driving ?t ?d)
        )
        :effect (and
            (not(at ?loc1 ?t))
            (at ?loc2 ?t)
        )
    )
    
)