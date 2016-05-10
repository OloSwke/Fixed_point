include("src/fixed_point.jl")

# Set all the parameters to desired value
parameters = Dict("alpha"=> 0.4,"a"=>0.7, "A"=>0.5, "beta" => 0.98, "k_" => 1)
N = 1000 # Number of periods for the simulation
            # (For our chosen values the model converges rather quickly though)

results = Solver.main(parameters, N)

# NB: The parameters are defined as follows
  # alpha: Output elasticity of the Financier
  # a: Marginal productivity of the Entrepreneur
  # A: initial productivity shock
  # beta: Discount rate
  # k_: Total fixed supply of capital

# NB: When setting the parameter values it should be the case that:
  # alpha < a*k_^(alpha-1)
  # A < a*beta
