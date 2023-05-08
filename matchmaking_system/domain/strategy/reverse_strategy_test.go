package strategy

import (
	"github.com/stretchr/testify/assert"
	"testing"
	"waterball/matchmaking_system/domain"
)

func TestReverseStrategy_Sort(t *testing.T) {
	tests := []struct {
		desc       string
		mockReturn []domain.Individual
		expIDs     []int
	}{
		{
			desc: "should reverse the order",
			mockReturn: []domain.Individual{
				{
					ID: 1,
				},
				{
					ID: 2,
				},
				{
					ID: 3,
				},
			},
			expIDs: []int{3, 2, 1},
		},
	}

	for _, test := range tests {
		mockStrt := domain.NewMockMatchmakingStrategy(t)
		mockStrt.On("Sort", domain.Individual{}, []domain.Individual{}).Return(test.mockReturn)
		strategy := NewReverseStrategy(mockStrt)
		candidates := strategy.Sort(domain.Individual{}, []domain.Individual{})
		for i, candidate := range candidates {
			assert.Equal(t, test.expIDs[i], candidate.ID)
		}
	}
}
