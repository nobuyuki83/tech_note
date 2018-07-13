#!/bin/sh

latex=""pdflatex" -synctex=1 -interaction=nonstopmode"

#arr=("fem_outline" "fem_poisson" "fem_advection" "fem_linearsolid" "fem_helmholtz")
#arr+=("fem_diffusion" "fem_hyper" "fem_largedeformation" "fem_stvenant" "fem_timeintegration")
#arr+=("mech_rotation" "mech_fluidgoverning" "mech_fluidcontinuum" "mech_rigidbody" "mech_rigidbodyjoint")
#arr+=("linsol_conjgrad" "linsol_cgprecond" "linsol_cgconv" "linsol_bicgstab" "linsol_gmres")
#arr+=("linsol_ludecomp" "linsol_amg" "linsol_bicg" "linsol_arnoldi" "linsol_twosidelanczos")
#arr+=("math_linope" "math_hilbert")
arr+="linsol_cg"

for i in ${arr[*]}; do
	cd ${arr[i]}
	${latex} main_en.tex
	cd ..
done

for i in ${arr[*]}; do
	mv ${arr[i]}/main_en.pdf ${arr[i]}.pdf
done
