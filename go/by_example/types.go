package main

type UserID int

func main() {
	idx := 1
	var uid UserID = 42
	//даже если базовый тип одинаковый, разные типы несовместимы
	myID := UserID(idx)

	println(uid, myID)
}
