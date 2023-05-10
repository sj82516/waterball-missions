package domain

import "fmt"

var ErrNoMatch = fmt.Errorf("no match found")

type MatchmakingStrategy interface {
	Sort(individual Individual, candidates []Individual) []Individual
}

type MatchmakingSystem struct {
	Strategy   MatchmakingStrategy
	candidates []Individual
}

func NewMatchmakingSystem(strategy MatchmakingStrategy, candidates []Individual) *MatchmakingSystem {
	return &MatchmakingSystem{
		Strategy:   strategy,
		candidates: candidates,
	}
}

func (m *MatchmakingSystem) AddCandidate(individual Individual) {
	m.candidates = append(m.candidates, individual)
}

func (m *MatchmakingSystem) Match(individual Individual) (Individual, error) {
	cands := m.Strategy.Sort(individual, m.candidates)
	if len(cands) == 0 {
		return Individual{}, ErrNoMatch
	}

	if cands[0].ID == individual.ID {
		if len(cands) == 1 {
			return Individual{}, ErrNoMatch
		}
		return cands[1], nil
	}
	return cands[0], nil
}
