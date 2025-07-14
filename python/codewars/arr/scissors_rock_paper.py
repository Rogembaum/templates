def rps(p1, p2):
    if p1 == p2:
        return "Draw!"

    match p1:

        case "scissors":
            if p2 == "paper":
                return 'Player 1 won!'
            else:
                return 'Player 2 won!'

        case "rock":
            if p2 == "scissors":
                return 'Player 1 won!'
            else:
                return 'Player 2 won!'

        case "paper":
            if p2 == "rock":
                return 'Player 1 won!'
            else:
                return 'Player 2 won!'

def rps_refactor(p1, p2):
        beats = {'rock': 'scissors', 'scissors': 'paper', 'paper': 'rock'}
        if beats[p1] == p2:
            return "Player 1 won!"
        if beats[p2] == p1:
            return "Player 2 won!"
        return "Draw!"


beats = {'rock': 'scissors', 'scissors': 'paper', 'paper': 'rock'}
print(beats["paper"])
