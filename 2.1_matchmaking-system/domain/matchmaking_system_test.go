package domain

import (
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestMatchmakingSystem_Match(t *testing.T) {

	tests := []struct {
		desc       string
		individual Individual
		candidates []Individual
		expMatch   Individual
		expErr     error
	}{
		{
			desc: "should return error when no candidate",
			individual: Individual{
				ID: 0,
			},
			candidates: []Individual{},
			expErr:     ErrNoMatch,
			expMatch:   Individual{},
		},
		{
			desc: "should match first candidate",
			individual: Individual{
				ID: 0,
			},
			candidates: []Individual{
				{
					ID: 1,
				}, {
					ID: 2,
				},
			},
			expMatch: Individual{
				ID: 1,
			},
		}, {
			desc: "should match second candidate if first is himself",
			individual: Individual{
				ID: 0,
			},
			candidates: []Individual{
				{
					ID: 0,
				}, {
					ID: 2,
				},
			},
			expMatch: Individual{
				ID: 2,
			},
		},
	}

	for _, test := range tests {
		mockStrategy := NewMockMatchmakingStrategy(t)
		mockStrategy.On("Sort", test.individual, test.candidates).Return(test.candidates)

		matchmakingSystem := NewMatchmakingSystem(mockStrategy, test.candidates)
		match, err := matchmakingSystem.Match(test.individual)
		if err != nil {
			assert.Equal(t, err, test.expErr)
		} else {
			assert.Equal(t, test.expMatch.ID, match.ID)
		}
	}
}
