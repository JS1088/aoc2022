# read file contents, one line at a time
open("input.txt") do f

    sum = 0
    alphabet = vcat('a':'z','A':'Z')
    score = 1:52

    # read till end of file
    while ! eof(f)
        # read a new / next line for every iteration		
        items = readline(f)	
        len_items = length(items)
        #split into compartments
        items_rucksack1 = first(items,Int(len_items/2))
        items_rucksack2 = last(items,Int(len_items/2))

        for item in items_rucksack1
            if item in items_rucksack2
                # get score for shared item
                idx_alphabet = findall( x -> x == item, alphabet)[1]
                sum += score[idx_alphabet]
                break
            end
        end
    end
    println(sum)
end    