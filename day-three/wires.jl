input = Array{String}(undef, 2)
if size(ARGS)[1] > 0
    println(ARGS[1])
    if isfile(ARGS[1])
        input = readlines(ARGS[1])
    end
end
print(input)

