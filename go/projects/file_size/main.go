package main

import (
	"fmt"
	"log"
	"os"
)

func main() {

	// Проверяем файл
	filename := "go1.mod"

	println("Getting fileinfo about file:", filename)
	// Проверяем текущую рабочую директорию
	wd, err := os.Getwd()
	if err != nil {
		fmt.Println("Error getting working directory:", err)
		return
	}
	fmt.Println("Current working directory:", wd)

	fileInfo, err := os.Stat(filename)
	if err != nil {
		log.Fatal("Error:", err)
		return
	}
	fmt.Println("Info about file", filename, fileInfo)
}
