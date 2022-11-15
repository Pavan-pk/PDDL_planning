(define (domain basic_logistics)
(:requirements :strips :typing :durative-actions :numeric-fluents :timed-initial-literals)
    
    (:types 
        location locatable - object
        truck plane boat - vehicle
        package driver vehicle truck plane boat - locatable
    )
    
    (:predicates
        (connected ?from ?to - location)
        (air_connected ?from ?to - location)
        (sea_connected ?from ?to - location)
        (at ?o - locatable ?l - location)
        (in ?p - package ?v - vehicle)
        (driving ?d - driver ?t - truck)
        (free_driver ?d - driver) ;; not doing any action
        (can_get_on ?t - truck);; I am disallowing embark and diembarking in parallel, this was jsut making drivers switch.
        (can_deliver ?p - package)
    )
    
    (:functions
        (speed_truck ?t - truck)
        (speed_driver ?d - driver)
        (speed_plane ?ap - plane)
        (speed_boat ?bt - boat)
        
        (distance ?from ?to - location)

        (driver_in_out ?d - driver)
        (package_in_out ?p - package)
    )

            
    ;;================;;
    ;; driver actions ;;
    ;;================;;
    
    (:durative-action walk
      :parameters (?d - driver ?from ?to - location)
      :duration (= ?duration (/ (distance ?from ?to) (speed_driver ?d)))
      :condition (and
        (at start (at ?d ?from))
        (at start (free_driver ?d))
        (over all (connected ?from ?to))
      )
      :effect (and
        (at end (not (at ?d ?from)))
        (at end (at ?d ?to))
        ; lock driver
        (at start (not (free_driver ?d)))
        (at end (free_driver ?d))
      )
    )
    
    (:durative-action board_truck
      :parameters (?t - truck ?d - driver ?wp - location)
      :duration (= ?duration (driver_in_out ?d))
      :condition (and
        (at start (at ?d ?wp))
        (at start (can_get_on ?t))
        (over all (free_driver ?d))
        (over all (at ?t ?wp))
      )
      :effect (and
        (at start (not (at ?d ?wp)))
        (at end (driving ?d ?t))
        (at end (not (can_get_on ?t)))
      )
    )
    
    (:durative-action disembark_truck
      :parameters (?t - truck ?d - driver ?wp - location)
      :duration (= ?duration (driver_in_out ?d))
      :condition (and
        (at start (driving ?d ?t))
        (over all (at ?t ?wp))
      )
      :effect (and
        (at start (not (driving ?d ?t)))
        (at end (at ?d ?wp))
        (at end (can_get_on ?t))
      )
    )
    
    ;;=================;;
    ;; vehicle actions ;;
    ;;=================;;
    
    (:durative-action drive_truck
      :parameters (?t - truck ?d - driver ?from ?to - location)
      :duration (= ?duration (/ (distance ?from ?to) (speed_truck ?t)))
      :condition (and
        (at start (at ?t ?from))
        (over all (driving ?d ?t))
        (over all (connected ?from ?to))
      )
      :effect (and
        (at start (not (at ?t ?from)))
        (at end (at ?t ?to))
      )
    )
    
    (:durative-action travel_air
        :parameters(?ap - plane ?from ?to - location)
        :duration (= ?duration (/ (distance ?from ?to) (speed_plane ?ap)))
        :condition (and
          (at start (at ?ap ?from))
          (over all (air_connected ?from ?to))
        )
        :effect (and
          (at start (not (at ?ap ?from)))
          (at end (at ?ap ?to))
        )
    )
    
    (:durative-action travel_sea
        :parameters(?bt - boat ?from ?to - location)
        :duration (= ?duration (/ (distance ?from ?to) (speed_boat ?bt)))
        :condition (and
          (at start (at ?bt ?from))
          (over all (sea_connected ?from ?to))
        )
        :effect (and
          (at start (not (at ?bt ?from)))
          (at end (at ?bt ?to))
        )
    )
    
    ;;=================;;
    ;; package actions ;;
    ;;=================;;
    
    (:durative-action load_package
      :parameters (?v - vehicle ?p - package ?wp - location)
      :duration (= ?duration (package_in_out ?p))
      :condition (and
        (at start (at ?p ?wp))
        (over all (at ?v ?wp))
      )
      :effect (and
        (at start (not (at ?p ?wp)))
        (at end (in ?p ?v))
      )
    )
    
    (:durative-action unload_package
      :parameters (?v - vehicle ?p - package ?wp - location)
      :duration (= ?duration (package_in_out ?p))
      :condition (and
        (at start (in ?p ?v))
        (over all (at ?v ?wp))
        (over all (can_deliver ?p))
      )
      :effect (and
        (at start (not (in ?p ?v)))
        (at end (at ?p ?wp))
      )
    )
    
    
)