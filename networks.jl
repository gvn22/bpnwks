using Revise
using ZonalFlow

# Set up parameters for a stochastically forced case
domain  = Domain(extent=(2π,2π),res=(8,8));
coeffs  = Coefficients(Ω=5.0,θ=0.0,μ=0.001,ν=0.0,ν₄=1.0,linear=false);
forcing = Stochastic(kf=5,dk=0,ε=0.001);
prob    = BetaPlane(domain,coeffs,forcing);

dn = "testdata/"
eqs = [NL(),GQL(0),GQL(1)] # set of equations

# time-independent (coupling coefficients) adjacency matrix
dumpadjacency(prob,eqs[1];fn=dn*"adjacency_nl_8x8")
dumpadjacency(prob,eqs[2];fn=dn*"adjacency_ql_8x8")
dumpadjacency(prob,eqs[3];fn=dn*"adjacency_gql1_8x8")

# time-dependent adjacency matrix
tspan   = (0.0,2000.0);
tsargs  = (
            dt=0.001,
            adaptive=false,
            progress=true,
            progress_steps=100000,
            save_everystep=false,
            dense=false,
            save_noise=false,
            saveat=5
           );

# NL
sol = integrate(prob,eqs[1],tspan;tsargs...)
write(prob,eqs[1],sol,dn=dn,fn="nl_sol_m53_e001_8x8")
dumpadjacency(prob,eqs[1],sol;fn=dn*"nl_adj_m53_e001_8x8")

# QL
sol = integrate(prob,eqs[2],tspan;tsargs...)
write(prob,eqs[2],sol,dn=dn,fn="ql_sol_m53_e001_8x8")
dumpadjacency(prob,eqs[2],sol;fn=dn*"ql_adj_m53_e001_8x8")

# GQL(1)
sol = integrate(prob,eqs[3],tspan;tsargs...)
write(prob,eqs[3],sol,dn=dn,fn="gql1_sol_m53_e001_8x8")
dumpadjacency(prob,eqs[3],sol;fn=dn*"gql1_adj_m53_e001_8x8")
