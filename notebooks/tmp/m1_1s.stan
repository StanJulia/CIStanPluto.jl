data {
	int N;
	vector[N] x;
	vector[N] y;
}
parameters {
	real a_hat;
	real b_hat;
	real<lower=0> sigma_hat;
}
transformed parameters {
	vector[N] mu;
	mu = a_hat + b_hat * x;
}
model {
	a_hat ~ normal(0, 10);
	b_hat ~ normal(0, 10);
	sigma_hat ~ exponential(1);
	y ~ normal(mu, sigma_hat);
}