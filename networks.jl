using Revise
using ZonalFlow

dn = "data/"
domain  = Domain(extent=(2π,2π),res=(8,8));
coeffs  = Coefficients(Ω=5.0,θ=0.0,μ=0.01,ν=0.0,ν₄=1.0,linear=false);
forcing = Stochastic(kf=5,dk=2,ε=0.0); # set 0 forcing
prob    = BetaPlane(domain,coeffs,forcing);

dumpadjacency(prob,NL();fn=dn*"adjacency_nl_8x8_test")
dumpadjacency(prob,GQL(3);fn=dn*"adjacency_gql3_8x8")

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
