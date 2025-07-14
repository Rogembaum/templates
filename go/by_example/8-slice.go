package main

import "fmt"

func main() {
	// создание
	var buf0 []int    //len=0, cap=0 - внутри nil - не иницилизирован
	buf1 := []int{}   //len=0, cap=0, но уже инициализтрован
	buf2 := []int{42} // len=1, cap=1
	buf3 := make([]int, 0)
	buf3 := make([]int, 5) //инициализация 5 элементов
}
