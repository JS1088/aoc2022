# read file contents, one line at a time
open("input.txt") do f

    score_contains = 0
    score_intersects = 0

    # read till end of file
    while ! eof(f)
        # read a new / next line for every iteration		
        s = readline(f)	
        elf1 = split(s, ",")[1]
        elf2 = split(s, ",")[2]

        elf1_from_to = split(elf1, "-")
        elf2_from_to = split(elf2, "-")

        elf1_total = parse(Int,elf1_from_to[1]):parse(Int,elf1_from_to[2])
        elf2_total = parse(Int,elf2_from_to[1]):parse(Int,elf2_from_to[2])

        # Part I check for total subsets
        if issubset(elf1_total, elf2_total) || issubset(elf2_total, elf1_total)
            score_contains += 1
        end
        # Part II check for intersections
        if length(intersect(elf1_total, elf2_total)) != 0
            score_intersects += 1
        end

    end
    println(score_contains)
    println(score_intersects)
end