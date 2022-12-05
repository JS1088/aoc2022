# [H]                 [Z]         [J]
# [L]     [W] [B]     [G]         [R]
# [R]     [G] [S]     [J] [H]     [Q]
# [F]     [N] [T] [J] [P] [R]     [F]
# [B]     [C] [M] [R] [Q] [F] [G] [P]
# [C] [D] [F] [D] [D] [D] [T] [M] [G]
# [J] [C] [J] [J] [C] [L] [Z] [V] [B]
# [M] [Z] [H] [P] [N] [W] [P] [L] [C]
#  1   2   3   4   5   6   7   8   9 

stack1 = ["M", "J", "C", "B", "F", "R", "L", "H"]
stack2 = ["Z", "C", "D"]
stack3 = ["H", "J", "F", "C", "N", "G", "W"]
stack4 = ["P", "J", "D", "M", "T", "S", "B"]
stack5 = ["N", "C", "D", "R", "J"]
stack6 = ["W", "L", "D", "Q", "P", "J", "G", "Z"]
stack7 = ["P", "Z", "T", "F", "R", "H"]
stack8 = ["L", "V", "M", "G"]
stack9 = ["C", "B", "G", "P", "F", "Q", "R", "J"]

crates = Vector{Vector{String}}([
            stack1,
            stack2,
            stack3,
            stack4,
            stack5,
            stack6,
            stack7,
            stack8,
            stack9])

open("input.txt") do f

    # read till end of file
    while ! eof(f)
        # read a new / next line for every iteration		
        s = readline(f)	
        procedure = split(s, r"[ a-z ]+")
        many = parse(Int,procedure[2])
        from = parse(Int,procedure[3])
        to = parse(Int,procedure[4])

        stack = last(crates[from], many)
        deleteat!(crates[from], (length(crates[from])-many+1):length(crates[from]))
        crates[to] = [crates[to]; stack]
    end

    res = []
    for stack in crates
        push!(res,last(stack))
    end
    println(res)

end   