def input = "111"

switch (input) {
    case ~/\d{3}/:
        println "The number has 3 digits."
        def x = 3
        println(x)
        break

    case ~/\w{4}/:
        println "The word has 4 letters."
        break

    default:
        println "Unrecognized..."
}