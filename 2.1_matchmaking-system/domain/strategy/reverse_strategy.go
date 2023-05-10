package strategy

import "waterball/matchmaking_system/domain"

type ReverseStrategy struct {
	Strategy domain.MatchmakingStrategy
}

func NewReverseStrategy(strategy domain.MatchmakingStrategy) *ReverseStrategy {
	return &ReverseStrategy{
		Strategy: strategy,
	}
}

func (r *ReverseStrategy) Sort(individual domain.Individual, candidates []domain.Individual) []domain.Individual {
	candidates = r.Strategy.Sort(individual, candidates)
	for i, j := 0, len(candidates)-1; i < j; i, j = i+1, j-1 {
		candidates[i], candidates[j] = candidates[j], candidates[i]
	}
	return candidates
}
