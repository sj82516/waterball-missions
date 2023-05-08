package strategy

import (
	"sort"
	"waterball/matchmaking_system/domain"
)

type DistanceBaseStrategy struct{}

func NewDistanceBaseStrategy() *DistanceBaseStrategy {
	return &DistanceBaseStrategy{}
}

func (d *DistanceBaseStrategy) Sort(individual domain.Individual, candidates []domain.Individual) []domain.Individual {
	sort.Slice(candidates, func(i, j int) bool {
		d1 := individual.GetDistance(candidates[i])
		d2 := individual.GetDistance(candidates[j])
		if d1 == d2 {
			return candidates[i].ID < candidates[j].ID
		}

		return d1 < d2
	})
	return candidates
}
