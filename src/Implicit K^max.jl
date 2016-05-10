using Roots

y=-4

function f(x)
  x^2 + y + t
end

fzero(f,[-2,2])

N = 100

q = zeros(N)              # Price of capital
c_E = zeros(N)            # Consumption of the Entrepreneur
c_F = zeros(N)            # Consumption of the Financier
k_E = zeros(N)            # Capital of the Entrepreneur
k_F = zeros(N)            # Capital of the Financier
d = zeros(N)              # Debt issued by E and bought by F
n = zeros(N)
E =
for t in 1:N
  n[t] = a*k_E[t]+q[t]*k_E[t] - d[t]
end



alpha = 0.4         # standard value
k_ = 1              # normalized to 1
r = 0.02            # arbitrary discount rate

#just for now
n = zeros(N)
n[1]=0.5
n[2]=0.8

function f(k)
  (alpha*(k_-k)^(alpha-1)*k)/(1+r)-n[t]
end

t=2

fzero(f,[0,1])

k_E[2]=fzero(f,[0,1])
