#!/bin/sh

#latex=""pdflatex" -synctex=1 -interaction=nonstopmode"
latex=""pdflatex" -synctex=1"

#arr=("fem_outline" "fem_poisson" "fem_advection" "fem_linearsolid" "fem_helmholtz")
#arr+=("fem_diffusion" "fem_hyper" "fem_largedeformation" "fem_stvenant" "fem_timeintegration")
#arr+=("mech_rotation" "mech_fluidgoverning" "mech_fluidcontinuum" "mech_rigidbody" "mech_rigidbodyjoint")
#arr+=("linsol_conjgrad" "linsol_cgprecond" "linsol_cgconv" "linsol_bicgstab" "linsol_gmres")
#arr+=("linsol_ludecomp" "linsol_amg" "linsol_bicg" "linsol_arnoldi" "linsol_twosidelanczos")
#arr+=("math_linope" "math_hilbert")
unset arr
arr+=("fem_outline" "fem_poisson" "fem_linearsolid" "fem_advection" "fem_diffusion" "fem_helmholtz")
arr+=("linsol_cg" "linsol_cgprecond" "linsol_ludecomp" "linsol_gmres")
arr+=("mech_rotation" "mech_rigidbody" "mech_fluidgoverning" "mech_fluidcontinuum")
arr+=("bem_helmholtz")
arr+=("cg_paramgeo")

for name in ${arr[*]}; do
	cd ${name}
	${latex} main_en.tex
	cd ..
done

echo ${arr[*]}

mkdir "bin"

for name in ${arr[*]}; do
  mv ${name}/main_en.pdf bin/${name}.pdf
done
