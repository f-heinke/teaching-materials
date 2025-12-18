data{
  real MD1;  
  real MD2;
  
  // posterior samples of regression model
  int N;
  vector[ N ] beta;
  vector[ N ] alpha;
  vector[ N ] gamma;
  vector[ N ] sigma;
}
parameters{
  real mu0;
}
model{
  mu0 ~ normal(50, 20); // vague prior on mu0
  MD1 ~ normal(  exp(-beta * mu0 + alpha) + gamma, sigma );
  MD2 ~ normal(  exp(-beta * mu0 + alpha) + gamma, sigma );
}
