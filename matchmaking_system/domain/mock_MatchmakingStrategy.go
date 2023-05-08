// Code generated by mockery v2.20.0. DO NOT EDIT.

package domain

import mock "github.com/stretchr/testify/mock"

// MockMatchmakingStrategy is an autogenerated mock type for the MatchmakingStrategy type
type MockMatchmakingStrategy struct {
	mock.Mock
}

// Sort provides a mock function with given fields: individual, candidates
func (_m *MockMatchmakingStrategy) Sort(individual Individual, candidates []Individual) []Individual {
	ret := _m.Called(individual, candidates)

	var r0 []Individual
	if rf, ok := ret.Get(0).(func(Individual, []Individual) []Individual); ok {
		r0 = rf(individual, candidates)
	} else {
		if ret.Get(0) != nil {
			r0 = ret.Get(0).([]Individual)
		}
	}

	return r0
}

type mockConstructorTestingTNewMockMatchmakingStrategy interface {
	mock.TestingT
	Cleanup(func())
}

// NewMockMatchmakingStrategy creates a new instance of MockMatchmakingStrategy. It also registers a testing interface on the mock and a cleanup function to assert the mocks expectations.
func NewMockMatchmakingStrategy(t mockConstructorTestingTNewMockMatchmakingStrategy) *MockMatchmakingStrategy {
	mock := &MockMatchmakingStrategy{}
	mock.Mock.Test(t)

	t.Cleanup(func() { mock.AssertExpectations(t) })

	return mock
}
