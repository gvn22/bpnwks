using Revise
using ZonalFlow

lx = Float64(2π);
ly = Float64(2π);
nx = 8;
ny = 8;

dn = "data/"

dumpadjacency(lx,ly,nx,ny;fs=dn*"adjacency_nl_8x8",Λ=nx-1)
dumpadjacency(lx,ly,nx,ny;fs=dn*"adjacency_gql3_8x8",Λ=3)

# dt = 0.005;
# t_end = 1000.0;
# savefreq = 5;
#
# β = 10.0 # β = 10.0
# μ = 0.01 # μ = 0.01
# ν = 0.0
# ν₄ = 1.0 # ν₄ = 1.0
#
# kf = 6
# dk = 1
# ε = 1.0e-3
#
# @time sol = nl(lx,ly,nx,ny,β,μ,ν,ν₄,kf,dk,ε,dt=dt,t_end=t_end,savefreq=savefreq);
#
# dumpenergy(lx,ly,nx,ny,sol.t,sol.u,fs=dn*"series_nl_8x8");
# dumpfields(lx,ly,nx,ny,sol.t,sol.u,fs=dn*"fields_nl_12x12");
