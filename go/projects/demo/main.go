package main

import (
	"fmt"
	"reflect"
	"strings"
	"time"
)

func main() {
	//res := math.Floor(math.Pi)
	//typo := math.Floor("string")
	//strings.ToTitle(2.75)

	//fmt.Println(123)
	//fmt.Println(strings.Repeat("-", 10))

	//Литералы
	//fmt.Println("Hello\nGo\nWorld!")
	//fmt.Println("Hello\tGo\tWorld!")
	//fmt.Println("Hello\"Go\"World!")
	//fmt.Println("Hello\\Go\\World!")

	//Руны
	fmt.Println('A')
	fmt.Println("A")
	fmt.Println('A' + 'B')
	fmt.Println('Я')
	fmt.Println('\n')

	//Bool
	perem := 0
	cond := (1 - perem) > 0
	fmt.Println(cond)

	//Типы
	fmt.Println("\n\t\t<< Типы>>\n")

	fmt.Println("Type of my value is: ", reflect.TypeOf(42))
	fmt.Println("Type of my value is: ", reflect.TypeOf(42.42))
	fmt.Println("Type of my value is: ", reflect.TypeOf("str"))
	fmt.Println("Type of my value is: ", reflect.TypeOf('a'))
	fmt.Println("Type of my value is: ", reflect.TypeOf(true))

	// Объявление переменных
	fmt.Println("\n\t\t<< Объявление переменных>>\n")

	var new_perem bool
	fmt.Println(new_perem)

	var length, wigth float64
	length, wigth = 3.1, 4.2
	fmt.Println(length, wigth)

	var quantity = 4
	fmt.Println(reflect.TypeOf(quantity))

	quantity2 := 5
	fmt.Println(quantity2)

	//Вызываем ошибку
	//quantity2 := 6
	//new_quantity = 7
	//quantity2 = "string"
	//length, wigth := 1.2

	//Преобразования

	var length3 float64 = 1.2
	var width3 int = 2
	fmt.Println("Area is ", length3*float64(width3))

	var length4 float64 = 3.1
	var width4 int = 2

	//length4 = float64(width4)
	fmt.Println("length4 > width4?", length4 > float64(width4))

	var length5 float64 = 3.1
	var width5 int
	width5 = int(length5)
	fmt.Println(width5)

	var price int = 100
	fmt.Println("Price is", price, "dollars.")
	var taxRate float64 = 0.08
	var tax float64 = float64(price) * taxRate
	fmt.Println("Tax is", tax, "dollars.")
	var total float64 = float64(price) + tax
	fmt.Println("Total cost is", total, "dollars.")
	var availableFunds int = 120
	fmt.Println(availableFunds, "dollars available.")
	fmt.Println("Within budget?", total <= float64(availableFunds))

	//Вызо методов

	var now time.Time = time.Now()
	var year int = now.Year()
	fmt.Println(now)
	fmt.Println(year)

	broken := "G# r#cks!"
	replacer := strings.NewReplacer("#", "o")
	fmt.Println(replacer.Replace(broken))
}
