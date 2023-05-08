package main

import (
	"waterball/matchmaking_system/domain"
	strategy "waterball/matchmaking_system/domain/strategy"
)

func main() {
	strt := strategy.NewDistanceBaseStrategy()
	system := domain.NewMatchmakingSystem(strt, []domain.Individual{})
	system.AddCandidate(domain.Individual{ID: 1, Coord: []float64{0, 0}})
	system.AddCandidate(domain.Individual{ID: 2, Coord: []float64{1, 1}})
	system.AddCandidate(domain.Individual{ID: 3, Coord: []float64{2, 2}})

	i, _ := system.Match(domain.Individual{ID: 0, Coord: []float64{3, 3}})
	println(i.ID) // should be 3

	strt2 := strategy.NewReverseStrategy(strategy.NewDistanceBaseStrategy())
	system = domain.NewMatchmakingSystem(strt2, []domain.Individual{})
	system.AddCandidate(domain.Individual{ID: 1, Coord: []float64{0, 0}})
	system.AddCandidate(domain.Individual{ID: 2, Coord: []float64{1, 1}})
	system.AddCandidate(domain.Individual{ID: 3, Coord: []float64{2, 2}})

	i, _ = system.Match(domain.Individual{ID: 0, Coord: []float64{3, 3}})
	println(i.ID) // should be 1

}
