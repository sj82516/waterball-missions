package domain

import (
	"math"
	"strings"
)

type Individual struct {
	ID     int
	Gender string
	Age    int
	Habits []string
	Coord  []float64
}

func NewIndividual(id int, gender string, age int, habits string, coord []float64) (Individual, error) {
	return Individual{
		ID:     id,
		Gender: gender,
		Age:    age,
		Habits: strings.Split(habits, ","),
		Coord:  coord,
	}, nil
}

func (i *Individual) GetDistance(other Individual) float64 {
	diffX := i.Coord[0] - other.Coord[0]
	diffY := i.Coord[1] - other.Coord[1]
	return math.Sqrt(math.Pow(float64(diffX), 2) + math.Pow(float64(diffY), 2))
}

func (i *Individual) GetCommonHabitCount(other Individual) int {
	habitMap := make(map[string]bool)
	for _, habit := range i.Habits {
		habitMap[habit] = true
	}
	count := 0

	for _, habit := range other.Habits {
		if habitMap[habit] {
			count++
		}
	}
	return count
}
