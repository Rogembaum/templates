package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
)

func main() {
	fmt.Print("Enter a grade: ")
	reader := bufio.NewReader(os.Stdin)   // создать буфер чтения, для получения текста
	input, err := reader.ReadString('\n') //вернуть текст, введенный пользователем до нажатия Enter
	if err != nil {
		log.Fatal(err) // если ошибка, то завершить программу
	}
	fmt.Println(input)

	//s := "\tremove tab new_string on the start and end\n"
	//fmt.Println(strings.TrimSpace(s)) // удалить пробелы и символы новой строки

	input = strings.TrimSpace(input)
	input = strings.ReplaceAll(input, ",", ".") // заменить запятую на точку
	grade, err := strconv.ParseFloat(input, 64)
	if err != nil {
		log.Fatal(err)
	}
	var status string
	if grade >= 60 {
		status = "Congrats! You're passing =)"
	} else {
		status = "Hmm, probably next time...you're failing"
	}
	fmt.Println(status)
	//bool, err := strconv.ParseBool("1")
	//if err != nil {
	//	fmt.Println(err)
	//}
	//fmt.Println(bool)

	//объявление переменных
	//	c, a := 1, 1
	//	b, a := 2, 2
	//	fmt.Println(a, b, c)
}
