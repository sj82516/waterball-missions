
generate:
	# for enum
	go generate ./...

	# for mocks
	mockery --all --inpackage
