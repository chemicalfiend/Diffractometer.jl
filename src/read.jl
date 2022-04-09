function load_xyz(f)
    f1 = open("f", "r")

    lines = readlines(f1)
    close(f1)

    natoms = parse(Int64, lines[1])

    # loading atoms from the xyz file.

    for i in 3:natoms
        tokens = split(lines[i])
        x = parse(Float64, tokens[2])
        y = parse(Float64, tokens[3])
        z = parse(Float64, tokens[4])
        push!(atoms, [x,y,z])
    end
    
    return atoms

end
