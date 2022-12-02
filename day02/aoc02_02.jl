# read file contents, one line at a time
open("input.txt") do f

    rock_score = 1
    paper_score = 2
    scissors_score = 3

    lose_score = 0
    draw_score = 3
    win_score = 6

    # score matrix 3x3: possible combinations of RPF-Objects and winning/losing
    score_matrix = [scissors_score + lose_score rock_score + draw_score paper_score + win_score;
    rock_score + lose_score paper_score + draw_score scissors_score + win_score;
    paper_score + lose_score scissors_score + draw_score rock_score + win_score]

    rps = ["A","B","C"]
    strategys = ["X","Y","Z"]

    score = 0
    # read till end of file
    while ! eof(f)
        # read a new / next line for every iteration		
        s = readline(f)	
        elf = first(s, 1)
        strategy = last(s, 1)
        # elfs turn
        ixd_rps = findall( x -> x == elf, rps)[1]
        # strategy
        ixd_strategy = findall( x -> x == strategy, strategys)[1]
        # combine for score
        score += score_matrix[ixd_rps, ixd_strategy] 

    end

    println(score)
end
    