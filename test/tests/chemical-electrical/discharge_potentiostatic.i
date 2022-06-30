[GlobalParams]
  energy_densities = 'psi_c psi_e'
  dissipation_densities = 'delta_c_vis'
[]

[Mesh]
  [fmg]
    type = FileMeshGenerator
    file = discharge_galvanostatic.e
    use_for_exodus_restart = true
  []
[]

[Variables]
  [c]
    initial_from_file_var = c
  []
  [Phi]
    initial_from_file_var = Phi
  []
[]

[BCs]
  [Phi_left]
    type = DirichletBC
    variable = Phi
    boundary = 'left'
    value = 0.032
  []
  [Phi_right]
    type = DirichletBC
    variable = Phi
    boundary = 'right'
    value = 0
  []
  [c_left]
    type = DirichletBC
    variable = c
    boundary = 'left'
    value = 0
  []
[]

[UserObjects]
  [terminator]
    type = Terminator
    expression = 'soc <= 0.001'
  []
[]

[Executioner]
  type = Transient
  solve_type = NEWTON
  petsc_options_iname = '-pc_type'
  petsc_options_value = 'lu'
  dt = 10
  end_time = 10000
[]

[Outputs]
  file_base = discharge_potentiostatic
  csv = true
  exodus = true
[]