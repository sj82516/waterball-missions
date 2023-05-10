package strategy

import (
	"sort"
	"waterball/matchmaking_system/domain"
)

type HabitBaseStrategy struct{}

func NewHabitBaseStrategy() *HabitBaseStrategy {
	return &HabitBaseStrategy{}
}

func (h *HabitBaseStrategy) Sort(individual domain.Individual, candidates []domain.Individual) []domain.Individual {
	sort.Slice(candidates, func(i, j int) bool {
		h1 := individual.GetCommonHabitCount(candidates[i])
		h2 := individual.GetCommonHabitCount(candidates[j])
		if h1 == h2 {
			return candidates[i].ID < candidates[j].ID
		}

		return h1 > h2
	})
	return candidates
}
