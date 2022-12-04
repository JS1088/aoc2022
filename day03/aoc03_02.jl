# read file contents, one line at a time
open("input.txt") do f

    sum = 0
    alphabet = vcat('a':'z','A':'Z')
    score = 1:52

    count = 0
    group = 1

    # prepare empty matrix
    list  = Matrix{String}(undef,100,3)

    # read till end of file
    while ! eof(f)
        # build groups of 3
        count += 1
        col = mod(count,3)
        if col == 0
            col = 3
        end
        # read a new / next line for every iteration		
        items = readline(f)	
        list[group,col] = items
        if (mod(count,3) == 0)
            group += 1
        end

    end

    for row in eachrow(list)
        elf1 = row[1]
        elf2 = row[2]
        elf3 = row[3] 
        for item in elf1
            if item in elf2
                if item in elf3 
                    idx_alphabet = findall( x -> x == item, alphabet)[1]
                    sum += score[idx_alphabet]
                    break
                end
            end
        end

    end
    println(sum)

end  