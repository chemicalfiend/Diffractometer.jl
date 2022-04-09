include("../src/diffract.jl")

@testset "BCC" begin
    

    atoms = load_xyz("bcc.xyz")

    # Co-ordinates of the box end points.

    box = [[30.0, 0.0, 0.0], [0.0, 30.0, 0.0], [0.0, 0.0, 30.0]]
    diffract(atoms, 512)

end
