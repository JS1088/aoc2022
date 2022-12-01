# read file contents, one line at a time
open("input.txt") do f

    numsum = 0
    sums = []
    
    # read till end of file
    while ! eof(f)
        # read a new / next line for every iteration		
        s = readline(f)	
        if s == ""
            push!(sums, numsum)
            numsum = 0
        else
            numsum += parse(Int, s)
        end	
    end
    sorted = sort(sums, rev=true)
    println(sorted[1])
    print(sum(sorted[1:3]))
end
    