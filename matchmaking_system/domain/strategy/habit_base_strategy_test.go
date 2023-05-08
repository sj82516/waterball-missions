package strategy

import (
	"github.com/stretchr/testify/assert"
	"testing"
	"waterball/matchmaking_system/domain"
)

func TestHabitBaseStrategy_Sort(t *testing.T) {
	tests := []struct {
		desc       string
		individual domain.Individual
		candidates []domain.Individual
		expIDs     []int
	}{
		{
			desc: "should sort by common habit count",
			individual: domain.Individual{
				ID:     0,
				Habits: []string{"a", "b", "c"},
			},
			candidates: []domain.Individual{
				// 3
				{
					ID:     1,
					Habits: []string{"a", "b", "c"},
				},
				// 0
				{
					ID:     2,
					Habits: []string{"d", "e", "f"},
				},
				// 1
				{
					ID:     3,
					Habits: []string{"a", "b", "d"},
				},
			},
			expIDs: []int{1, 3, 2},
		},
	}

	for _, test := range tests {
		strategy := NewHabitBaseStrategy()
		candidates := strategy.Sort(test.individual, test.candidates)
		for i, candidate := range candidates {
			assert.Equal(t, test.expIDs[i], candidate.ID)
		}
	}
}
