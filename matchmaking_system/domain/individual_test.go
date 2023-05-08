package domain

import (
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestIndividual_GetDistance(t *testing.T) {
	tests := []struct {
		desc string
		exp  float64
		p1   Individual
		p2   Individual
	}{
		{
			desc: "success",
			exp:  2,
			p1: Individual{
				Coord: []float64{0, 1},
			},
			p2: Individual{
				Coord: []float64{0, 3},
			},
		},
	}

	for _, test := range tests {
		assert.Equal(t, test.exp, test.p1.GetDistance(test.p2), test.desc)
	}
}

func TestIndividual_GetCommonHabitCount(t *testing.T) {
	tests := []struct {
		desc     string
		exp      int
		p1Habits string
		p2Habits string
	}{
		{
			desc:     "success",
			exp:      2,
			p1Habits: "a,b,c",
			p2Habits: "a,b,d",
		}, {
			desc:     "success with no common habits",
			exp:      0,
			p1Habits: "a,b,c",
			p2Habits: "d,e,f",
		}, {
			desc:     "success with no habits",
			exp:      0,
			p1Habits: "",
			p2Habits: "d,e,f",
		},
	}

	for _, test := range tests {
		p1, _ := NewIndividual(0, "", 0, test.p1Habits, []float64{})
		p2, _ := NewIndividual(0, "", 0, test.p2Habits, []float64{})
		assert.Equal(t, test.exp, p1.GetCommonHabitCount(p2), test.desc)
	}
}
