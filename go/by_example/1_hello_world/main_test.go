package main

import (
	"testing"

	"1_hello_world/hello"
	"github.com/stretchr/testify/require"
)

func TestHello(t *testing.T) {
	require.Equal(t, hello.Hello(), "hello")
}
