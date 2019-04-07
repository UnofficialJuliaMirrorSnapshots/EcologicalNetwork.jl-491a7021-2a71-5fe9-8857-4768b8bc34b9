module TestPaths
  using Test
  using EcologicalNetworks

  # Generate some data

  A = UnipartiteProbabilisticNetwork([0.0 0.1; 0.2 0.8])

  P = number_of_paths(A, n=2)

  @test P[1,1] ≈ 0.02
  @test P[1,2] ≈ 0.08
  @test P[2,2] ≈ 0.66

  m = rand([0,1], (5,5))
  U = UnipartiteQuantitativeNetwork(m)
  @test number_of_paths(U) == number_of_paths(UnipartiteNetwork(m.>0))
  @test shortest_path(U) == shortest_path(UnipartiteNetwork(m.>0))

  N = unipartitemotifs()[:S1]
  b = bellman_ford(N)
  @test length(b) == 3
  @test length(filter(x -> x.to == :c, b)) == 2

end
