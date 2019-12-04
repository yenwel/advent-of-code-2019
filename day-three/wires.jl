input = Array{String}(undef, 2)
if size(ARGS)[1] > 0 && isfile(ARGS[1])   
    input = readlines(ARGS[1])
end
splitinput = map((x) -> String.(split(x,",")), input)

buildwireaccumulate = function(result,dir) 
    direction = dir[1];
    distance = parse(Int64,dir[2:end])
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

buildwire = (input) -> foldl(buildwireaccumulate, input; init= [(0,0)])

wire1 = buildwire(splitinput[1])
wire2 = buildwire(splitinput[2])
println("wire1 $(wire1)")
println("wire2 $(wire2)")

isbetween = (a,b,c) -> (a <= b && b <= c) || (c <= b && b <= a)

allsame(x) = all(y -> y == first(x), x)

intersections = function (start1, stop1, start2, stop2)
    # n intersections
    if allsame([start1[1], stop1[1],start2[1],stop2[1]])
        println("parallel horizontal $([start1, stop1,start2,stop2])")
    elseif  allsame([start1[2], stop1[2],start2[2],stop2[2]])   
        println("parallel vertical $([start1, stop1,start2,stop2])")
    end

    # 1 intersection
    if isbetween(start1[1], start2[1], stop1[1]) && isbetween(start2[2],start1[2],stop2[2])
        return (true, [(start2[1],start1[2])])
    elseif isbetween(start2[1], start1[1], stop2[1]) && isbetween(start1[2],start2[2],stop1[2])
        return (true, [(start1[1],start2[2])])

    # no intersection
    else
        return (false, ())
    end
end

findintersections = function(wireone,wiretwo)
    result = Tuple{Int64,Int64}[]
    foldl(
        function(start1,stop1) 
            foldl(
                function(start2, stop2)  
                    intersect = intersections(start1 ,stop1, start2, stop2)
                    if intersect[1]
                        append!(result, intersect[2])
                    end
                    return stop2
                end,
            wiretwo)
            return stop1
        end, 
        wireone)
    return result
end

intersections = findintersections(wire1,wire2)
println(intersections)

manhattandistance = (a, b) -> abs(a[1]-b[1]) + abs(a[2] + b[2])

manhattandistancewireintersections = map((x) -> manhattandistance((0,0),x), intersections[2:end])

println(manhattandistancewireintersections)
println(minimum(manhattandistancewireintersections))