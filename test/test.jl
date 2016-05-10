module test
  using FactCheck, Fixed_point

  alpha = 0.4         # Output elasticity of the Financier
  a = 0.7             # Marginal productivity of the Entrepreneur
  A = 0.5             # Initial productivity shock
  beta = 0.98         # Discount rate
  r = (1-beta)/beta   # From the intertemporal rate of marginal substitution
  k_ = 1              # Normalized to 1

  # Equilibrium values
  k_eq = k_-(a/alpha)^(1/(alpha-1))   # Capital allocation at equilibrium
  q_eq = a/r                          # Price of capital at equilibrium
  n_eq = a*k_eq                       # Net worth


  facts("A Simple test of Kmax") do
    @fact Fixed_point.Kmax(n_eq) --> less_than(k_eq)  
  end



end
