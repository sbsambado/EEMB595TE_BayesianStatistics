
    
  data {
  int<lower=1> N;
  real<lower=0> height[N];
  real weight[N];

}
parameters { # mean of normal distribution is depended on predictor weight
  real alpha; # intercept
  real beta; # slope of the effect of weight on height
  real <lower=0, upper=50> sigma;
} # new block, transformed parameters
# each data point, we will calculate mu, combine parameters alpha and beta to calculate likelihood rather than calculate this linearly
transformed parameters{
real mu[N]; // introduce our paramter that is a combination of other parameters
for(i in 1:N){
  mu[i] = alpha + beta * weight[i]; # mu is dependent on other parameters
  }
}

model {
//priors
alpha ~ normal(178,100); # prior
beta ~ normal(0,10); # prior
sigma ~ uniform(0,50); # prior
for(i in 1:N){
height[i] ~ normal(mu[i], sigma); # i element of mu's
} # wether we accept or reject, allow sus to calculate posterior probablilty

}
 
    
    
    
