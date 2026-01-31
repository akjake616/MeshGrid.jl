module MeshGrid

export meshgrid

function meshgrid(x, y)

    sx = length(x)
    sy = length(y)

    T = promote_type(eltype(x), eltype(y))

    X = Array{T}(undef, sy, sx)
    Y = Array{T}(undef, sy, sx)

    @inbounds for i in 1:sx, j in 1:sy
        X[j, i] = x[i]
        Y[j, i] = y[j]
    end

    return (X, Y)
end

function meshgrid(x, y, z)
    
    sx = length(x)
    sy = length(y)
    sz = length(z)

    T = promote_type(eltype(x), eltype(y), eltype(z))

    X = Array{T}(undef, sy, sx, sz)
    Y = Array{T}(undef, sy, sx, sz)
    Z = Array{T}(undef, sy, sx, sz)

    @inbounds for k in 1:sz, i in 1:sx, j in 1:sy
        X[j, i, k] = x[i]
        Y[j, i, k] = y[j]
        Z[j, i, k] = z[k]
    end

    return (X, Y, Z)
end

end
