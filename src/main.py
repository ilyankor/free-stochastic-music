from scipy.special import erfinv
import numpy as np
import matplotlib.pyplot as plt



# PROCESS IS TO DRAW FROM NORMAL DISTRIBUTION WITH MEAN 0 and STD 1/sqrt(2) (then take abs)

rng = np.random.default_rng()
# x = rng.random(size=10000)
# y = erfinv(x)
# plt.hist(y, bins=100, density=True)

# z = rng.normal(scale=1.0/np.sqrt(2.0), size=10000)
# plt.hist(np.abs(z), bins=100, density=True, color=(0.1, 0.2, 0.5, 0.3))

# plt.show()
# print(f"x1 = {x}\txlambda = {y}")


y = np.loadtxt("sampling.txt")
plt.hist(y, bins=100, density=True) 
plt.show()
# compiling
# gfortran -std=legacy -ffixed-form src/test.f -o testog; ./testog < ex/input.txt
# gfortran src/test.f90 -o testnew; ./testnew < ex/input.txt

jw = 1


# part 1: choose a duration
# reciprocal_avg_density = 40.0
# max_duration = 120.0

# rng = np.random.default_rng()

# while True:
#     a = rng.exponential(scale=reciprocal_avg_density)
#     if a <= max_duration:
#         break
# print(a)

# r = 6
# if jw == 1:
#     u = rng.uniform(0.0, r)
# else:
#     u = rng.triangular(0.0, 0.0, r)
# v3 = 0.050
# da = v3 * np.exp(u)
# na = 
# print(da)
