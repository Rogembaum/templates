package main

import (
	"fmt"
	"math"
)

const s string = "const"

func double(i float64) float64 {
	return i * i
}

func main() {
	fmt.Println(s)

	const n = 500000000
	const d = 3e22 / n
	fmt.Println(d)

	fmt.Println(int64(d))

	fmt.Println((math.Sin(n)))
	fmt.Println((math.Cos(n)))

	fmt.Println((math.Cos(n)))

	fmt.Println(math.Round(double(math.Cos(n)) + double(math.Sin(n))))

	const pi = 22.000 / 7.000
	fmt.Println(pi)

	// можно объявить сразу блок констант, чтобы каждый раз не указывать слово const
	const (
		// iota - автоинкремент для константы
		zero = iota
		_    //пуская переменная, пропуск iota
		third
	)
	const (
		_  = iota //пропускаем первое значение
		kb = 1 << (10 * iota)
		mb
	)
	fmt.Println(kb)
	fmt.Println(int64(mb))
}
