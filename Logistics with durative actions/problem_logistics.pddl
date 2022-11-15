(define (problem problem_logistics)
(:domain basic_logistics)
(:requirements :strips :typing :durative-actions :numeric-fluents)

    (:objects 
        wp1 wp2 wp3 wp4 wp5 wp6 wp7 wp8 wp9 wp10 wp11 sky lighthouse - location
        t1 t2 - truck
        dr1 dr2 - driver
        pack1 pack2 pack3 pack4 - package
        ap1 - plane
        bt1 - boat
    )
    
    (:init
        ;; drivers
        (at dr1 wp4)
        (at dr2 wp1)
        (free_driver dr1)
        (free_driver dr2)
        
        ;; trucks
        (at t1 wp6)
        (at t2 wp9)
        (can_get_on t1)
        (can_get_on t2)
        
        ;; plane
        (at ap1 sky)
        
        ;; boat
        (at bt1 lighthouse)
        
        ;; packages
        (at pack1 wp2)
        (at pack2 wp3)
        (at pack3 wp5)
        (at pack4 wp11)
        
        ;; Ground Connections
        (connected wp1 wp2)
        (connected wp2 wp1)
        (connected wp2 wp3)
        (connected wp3 wp2)
        (connected wp3 wp8)
        (connected wp8 wp3)
        (connected wp8 wp11)
        (connected wp11 wp8)
        (connected wp11 wp10)
        (connected wp10 wp11)
        (connected wp10 wp9)
        (connected wp9 wp10)
        (connected wp9 wp4)
        (connected wp4 wp9)
        (connected wp4 wp1)
        (connected wp1 wp4)
        (connected wp1 wp5)
        (connected wp5 wp1)
        (connected wp5 wp6)
        (connected wp6 wp5)
        (connected wp6 wp7)
        (connected wp7 wp6)
        (connected wp2 wp6)
        (connected wp6 wp2)
        
        ;; air Connections
        (air_connected wp4 sky)
        (air_connected sky wp4)
        (air_connected wp2 sky)
        (air_connected sky wp2)
        
        ;; sea Connections
        (sea_connected wp7 lighthouse)
        (sea_connected lighthouse wp7)
        
        ;; speed
        (= (speed_truck t1) 1.0)
        (= (speed_truck t2) 1.0)
        (= (speed_driver dr1) 0.5)
        (= (speed_driver dr2) 0.5)
        (= (speed_plane ap1) 2.0)
        (= (speed_boat bt1) 1.5)
        
        ;; in out duration
        (= (driver_in_out dr1) 10.0)
        (= (driver_in_out dr2) 10.0)
        (= (package_in_out pack1) 10.0)
        (= (package_in_out pack2) 10.0)
        (= (package_in_out pack3) 10.0)
        (= (package_in_out pack4) 10.0)
        
        ;; land distances
        (= (distance wp1 wp2) 100.0)
        (= (distance wp2 wp1) 100.0)
        (= (distance wp2 wp3) 100.0)
        (= (distance wp3 wp2) 100.0)
        (= (distance wp3 wp8) 75.0)
        (= (distance wp8 wp3) 75.0)
        (= (distance wp8 wp11) 75.0)
        (= (distance wp11 wp8) 75.0)
        (= (distance wp11 wp10) 100.0)
        (= (distance wp10 wp11) 100.0)
        (= (distance wp10 wp9) 100.0)
        (= (distance wp9 wp10) 100.0)
        (= (distance wp9 wp4) 75.0)
        (= (distance wp4 wp9) 75.0)
        (= (distance wp4 wp1) 75.0)
        (= (distance wp1 wp4) 75.0)
        (= (distance wp1 wp5) 100.0)
        (= (distance wp5 wp1) 100.0)
        (= (distance wp5 wp6) 50.0)
        (= (distance wp6 wp5) 50.0)
        (= (distance wp6 wp7) 50.0)
        (= (distance wp7 wp6) 50.0)
        (= (distance wp2 wp6) 75.0)
        (= (distance wp6 wp2) 75.0)
        
        ;; sky distances
        (= (distance wp4 sky) 20)
        (= (distance sky wp4) 20)
        (= (distance wp2 sky) 20)
        (= (distance sky wp2) 20)
        
        ;; boat distances
        (= (distance wp7 lighthouse) 20)
        (= (distance lighthouse wp7) 20)
    )
    
    (:goal (and 
        ;; packages delivered
        (at pack1 wp9)
        (at pack3 wp9)
        (at pack4 wp2)
        (at pack2 lighthouse)
    ))
)
kekl