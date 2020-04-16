
    
  data {
  int<lower=1> N;
  real<lower=0> height[N];
  real weight[N];

}
parameters {
  real alpha; # parameter
  real beta; # parameter
  real gamma; # parameter
  real <lower=0, upper=50> sigma;
}
transformed parameters{
real mu[N]; // introduce our paramter that is a combination of other parameters
for(i in 1:N){
  mu[i] = alpha + beta * weight[i]+ gamma * weight[i]^2; # put particular formula here, transformation step
  }
}

model {
//priors
alpha ~ normal(178,100);
beta ~ normal(0,10);
gamma ~ normal(0,10);
sigma ~ uniform(0,50);
for(i in 1:N){
height[i] ~ normal(mu[i], sigma);
}

}
 
    
    
    
