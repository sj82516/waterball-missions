package strategy

import (
	"github.com/stretchr/testify/assert"
	"testing"
	"waterball/matchmaking_system/domain"
)

func TestDistanceBaseStrategy_Sort(t *testing.T) {
	tests := []struct {
		desc       string
		candidates []domain.Individual
		individual domain.Individual
		expIDs     []int
	}{
		{
			desc: "should sort candidates by distance",
			candidates: []domain.Individual{
				// distance: 1
				{ID: 1, Coord: []float64{1, 0}},
				// distance: 5
				{ID: 2, Coord: []float64{0, 5}},
				// distance: 3
				{ID: 3, Coord: []float64{3, 0}},
			},
			individual: domain.Individual{
				ID: 0, Coord: []float64{0, 0},
			},
			expIDs: []int{1, 3, 2},
		},
		{
			desc: "should sort candidates id if distance is same",
			candidates: []domain.Individual{
				// distance: 5
				{ID: 3, Coord: []float64{0, 5}},
				// distance: 5
				{ID: 1, Coord: []float64{0, 5}},
				// distance: 5
				{ID: 2, Coord: []float64{0, 5}},
			},
			individual: domain.Individual{
				ID: 0, Coord: []float64{0, 0},
			},
			expIDs: []int{1, 2, 3},
		},
	}

	for _, test := range tests {
		strategy := NewDistanceBaseStrategy()
		candidates := strategy.Sort(test.individual, test.candidates)
		for i, candidate := range candidates {
			assert.Equal(t, test.expIDs[i], candidate.ID)
		}
	}
}
