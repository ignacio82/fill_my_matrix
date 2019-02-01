module im_f_module
   use omp_lib
   implicit none
   contains

subroutine fill_matrix(N,K,A,ncores) bind(C, name="fill_")
   use, intrinsic                                         :: iso_c_binding, only : c_double, c_int
   integer(c_int), intent(in)                             :: N,K, ncores
   real(c_double), DIMENSION(N, K), intent(out)	          :: A
   integer                                                :: nn, kk
   ! Specify number of threads to use:
	!$ call omp_set_num_threads(ncores)
	!$omp parallel do
	do nn=1,N
	   do kk=1,K
	      CALL SLEEP(1)
	      A(nn,kk) = nn + kk
	   end do
	   !print *, A(nn, :)
	end do
	!$omp end parallel do
end subroutine fill_matrix



end module im_f_module
