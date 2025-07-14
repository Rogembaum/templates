package main

import "fmt"

func main() {
	var a1 [3]int //[0,0,0]
	fmt.Println(a1)

	var a2 [3]string
	fmt.Println(a2)

	//для определения размера массива можно использовать const - но не переменные

	const size = 10
	var arr [size]int
	fmt.Println(arr)

	const size2 = 2
	var arr2 [2 * size2]bool
	fmt.Println(arr2)

	//определение размера при инициализации
	a3 := [...]int{1, 2, 3}
	fmt.Println(a3)
}
