#=

Program to generate a colourmap GIXS pattern

Input => xyz data of the final frame of the trajectory.

Output => GIXS scattering plots.


=#


export 
    pbc_2d,
    bin,
    diffract


function pbc_2d(x, N)
    for i in x
        i -= round.(i) .- 0.5
        i *= N
        i = [i[1]%N, i[2]%N]
        #i = i .% N
    end

    m = []
    for i in x
        push!(m, abs.(round.(i)))
    end
    return m
end

function bin(yz, n)
    u = unique(yz)
    counts = [(count(x->x==i, yz)) for i in u]
    img = zeros(n, n)

    for (v, c) in zip(u, counts)
        img[Int64(v[1])+1, Int64(v[2])+1] = c
    end

    return img

end

@fastmath function diffract(xyz, grid_size)
    
    n = grid_size
    rot = I
    yz = []
    for x in xyz
        push!(yz, [x[2],x[3]])
    end

    yz = pbc_2d(yz, n)

    img = bin(yz, n)
    F = fftshift(fft(Float64.(Gray.(im))))
    #print(F)

    heatmap(log.(abs.(F.*F)).+1, c = :jet)

end
