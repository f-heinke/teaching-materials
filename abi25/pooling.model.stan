data{
  int N;
  vector[N] beta;
  vector[N] alpha;
  vector[N] gamma;
  vector[N] sigma;
  
  real MD1;
  real MD2;
}
parameters{
  real mu0;
  
}
model{
  
  mu0 ~ normal( 50 / 700.0, 10 / 700.0);
  MD1 ~ normal( exp(-beta * mu0 + alpha) + gamma, sigma);
  MD2 ~ normal( exp(-beta * mu0 + alpha) + gamma, sigma);
}
