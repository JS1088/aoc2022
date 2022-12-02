# read file contents, one line at a time
open("input.txt") do f

    rock = ["A","X"]
    paper = ["B","Y"]
    scissors = ["C","Z"]

    win = 6
    lose = 0
    draw = 3

    score = 0

    # read till end of file
    while ! eof(f)
        # read a new / next line for every iteration		
        s = readline(f)	
        elf = first(s, 1)
        you = last(s, 1)

        if (you in rock) 
            score += 1
        elseif (you in paper)
            score += 2
        elseif (you in scissors)
            score += 3
        end

        if (you in rock && elf in scissors
            || you in scissors && elf in paper
            || you in paper && elf in rock)
            score += 6
        elseif (you in rock && elf in rock
            || you in scissors && elf in scissors
            || you in paper && elf in paper)
            score +=3
        end

    end

    println(score)
end
    