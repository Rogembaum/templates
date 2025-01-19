package main

import (
	"os"

	qrterminal "github.com/mdp/qrterminal/v3"
)

func main() {
	config := qrterminal.Config{
		Level:     qrterminal.M,
		Writer:    os.Stdout,
		BlackChar: qrterminal.WHITE,
		WhiteChar: qrterminal.BLACK,
		QuietZone: 1,
	}

	// Correct the argument passing by using the right syntax.
	qrterminal.GenerateWithConfig("Hello, world", config)
}
