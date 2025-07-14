package main

import (
	"fmt"
	"unicode/utf8"
)

func main() {
	var a = "initial"
	fmt.Println(a)

	var b, c = 1, 2
	fmt.Println(b, c)

	var d = true
	fmt.Println(d)

	var e int
	fmt.Println(e)

	f := "apple"
	fmt.Println(f)

	var g string = "string"
	fmt.Println(g)

	var numInt int
	fmt.Println(numInt)

	var numFloat float64
	fmt.Println(numFloat)

	numFloat2 := 1.2
	fmt.Println(numFloat2)

	numFloat2++
	fmt.Println(numFloat2)

	str := "Hello\n\tWorld"
	fmt.Println(str)

	x := '\x27'
	fmt.Println(x)

	helloWorld := "Hello World"
	andGoodMorning := helloWorld + " и доброе утро!"
	fmt.Println(andGoodMorning)
	fmt.Println(helloWorld[1])

	//получение длинны строки в байтах
	byteLen := len(helloWorld) //длина в символах
	fmt.Println(byteLen)

	// получение длины в символах
	symbols := utf8.RuneCountInString(helloWorld)
	fmt.Println(symbols)

	// получение подстройки в байтах, а не символах
	hello := helloWorld[:10]
	h := helloWorld[0]
	fmt.Println(hello)
	fmt.Println(h) //байт 72 а не буква П

	//конвертация в слайс байт и обратно
	byteString = []byte(helloWorld)
	fmt.Println(byteString)

	// и обратно
	helloWorld = string(byteString)
}
