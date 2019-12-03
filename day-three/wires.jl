input = Array{String}(undef, 2)
if size(ARGS)[1] > 0 && isfile(ARGS[1])        
    println("reading file $(ARGS[1])")
    input = readlines(ARGS[1])
end
println("the input is $(input)")
splitinput = map((x) -> String.(split(x,",")), input)
println("the split input is $(splitinput)")

buildpathaccumulate = function(result,dir)    
    direction = dir[1];
    distance = parse(Int16,dir[2:end])
    if direction == 'R'
        push!(result , (result[end][1] + distance, result[end][2] ))
    elseif direction == 'L'
        push!(result, (result[end][1] - distance, result[end][2] ))
    elseif direction == 'U'
        push!(result, (result[end][1], result[end][2] + distance))
    elseif direction == 'D'
        push!(result, (result[end][1], result[end][2] - distance))
    end
    return result
end

buildpath = function(input)
    foldl(buildpathaccumulate, input; init= [(0,0)])
end

path1 = buildpath(splitinput[1])
path2 = buildpath(splitinput[2])
println("path1 $(path1)")
println("path2 $(path2)")