def run_program(intcodes):
    print("starting program")
    for i in range(0, len(intcodes), 4):
        print(intcodes[i:i+4])
        if intcodes[i] == 1:
            intcodes[intcodes[i+3]] = intcodes[intcodes[i+1]] + intcodes[intcodes[i+2]]
        elif intcodes[i] == 2:
            intcodes[intcodes[i+3]] = intcodes[intcodes[i+1]] * intcodes[intcodes[i+2]]
        elif intcodes[i] == 99:
            break
        else:
            print("an error occured")
            break
        print(f"intermediate intcodes {intcodes}")
    print(f"result {intcodes}" )
    return intcodes


run_program([1,0,0,0,99])
run_program([2,3,0,3,99])
run_program([2,4,4,5,99,0])
run_program([1,1,1,4,99,5,6,0,99])

def enhanceProgram(intcodes, enhancementone, enhancementtwo):
    enhanced = intcodes.copy()
    enhanced[1] = enhancementone
    enhanced[2] = enhancementtwo
    return enhanced

puzzleinput = [1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,1,13,19,1,9,19,23,2,13,23,27,2,27,13,31,2,31,10,35,1,6,35,39,1,5,39,43,1,10,43,47,1,5,47,51,1,13,51,55,2,55,9,59,1,6,59,63,1,13,63,67,1,6,67,71,1,71,10,75,2,13,75,79,1,5,79,83,2,83,6,87,1,6,87,91,1,91,13,95,1,95,13,99,2,99,13,103,1,103,5,107,2,107,10,111,1,5,111,115,1,2,115,119,1,119,6,0,99,2,0,14,0]
run_program(enhanceProgram(puzzleinput, 12, 2))

def gridsearch(input, rangeone, rangetwo):
    for noun in range(0,rangeone):
        for verb in range(0,rangetwo):
            runprogram = run_program(enhanceProgram(input, noun, verb))
            print(f"run program {runprogram}")
            if runprogram[0] == 19690720:
                print(f"{100 * noun + verb }")
                return (noun, verb)

gridsearch(puzzleinput, 100, 100)
