using MeshGrid
using Test

@testset "MeshGrid.jl" begin
    x = [1.0, 2.0, 3.0]
    y = [10.0, 20.0]

    X, Y = meshgrid(x, y)

    @test size(X) == (length(y), length(x))
    @test size(Y) == (length(y), length(x))
    @test X[1, 1] == x[1]
    @test X[2, 3] == x[3]
    @test Y[1, 1] == y[1]
    @test Y[2, 3] == y[2]

    # 3D case
    z = [100, 200]
    X3, Y3, Z3 = meshgrid(x, y, z)
    @test size(X3) == (length(y), length(x), length(z))
    @test X3[1, 1, 1] == x[1]
    @test Z3[2, 3, 2] == z[2]

    # type promotion between integers and floats
    xi = [1, 2]
    yf = [2.5, 3.5]
    Xp, Yp = meshgrid(xi, yf)
    @test eltype(Xp) == eltype(Yp) == Float64
    @test Xp[1, 2] == xi[2]
    @test Yp[2, 1] == yf[2]
end
