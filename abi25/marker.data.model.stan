data{
  vector[6] MD;
  vector[6] MW;

}
parameters{
  real beta;
  real alpha;
  real gamma;
  real<lower = 0> sigma;
  
}
model{
  sigma ~ exponential(1);
  beta ~ normal(2, 1);
  alpha ~ normal(0, 1);
  gamma ~ normal(0, 0.5);
  
  
  MD ~ normal( exp(-beta * MW + alpha) + gamma ,sigma);
}
