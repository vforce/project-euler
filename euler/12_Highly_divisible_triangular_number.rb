require 'pp'
min_n = 2235**2
sieve_length = 2235/2
sieve = Array.new(sieve_length, false)
primes = [2]
(1..sieve_length-1).each do |d|
  if !sieve[d]
    primes.push(2*d+1)
    k = 2*d*(d+1)
    while k<min_n
      sieve[k] = true
      k += (2*d+1)
    end
  end
end

$primes = primes

def factorization(n)
  number_of_factors = 1
  $primes.each do |p|
    if p > n
      break
    end
    if n%p==0
      prime_exponential = 0
      m = n
      while m%p==0
        m = m/p
        prime_exponential += 1
      end
      number_of_factors *= (prime_exponential+1)
    end
  end
  number_of_factors
end

factors_by_number = {}
# NOTE: n and n+1 are co-prime, therefore if D(n) is the number of divisors of n
# then D(n) = D(k)*D(2k+1) if n = 2k
# or D(n) = D(k+1) * D(2k+1) if n = 2k+1
(1..min_n).each do |k|
  n = k*(k+1)/2
  if k%2==0
    n1 = k%2
    n2 = k+1
  else
    n1 = (k+1)/2
    n2 = k
  end

  if !factors_by_number.has_key?(n1)
    factors_by_number[n1] = factorization(n1)
  end
  if !factors_by_number.has_key?(n2)
    factors_by_number[n2] = factorization(n2)
  end

  number_of_factors = 
    factors_by_number[n] = factors_by_number[n1] * factors_by_number[n2]

  if number_of_factors > 500
    puts n
    break
  end
end
