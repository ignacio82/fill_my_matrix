module im_f_module
   use omp_lib
   implicit none
   contains

subroutine fill_matrix(N,K,A,nthreads) bind(C, name="fill_")
   use, intrinsic                                         :: iso_c_binding, only : c_double, c_int
   integer(c_int), intent(in)                             :: N,K, nthreads
   integer                                                :: nn, kk, thread_num
   real(c_double), DIMENSION(N, K), intent(out)	          :: A
    ! Specify number of threads to use:
  	!$ call omp_set_num_threads(nthreads)
  	!$omp parallel do private(thread_num)
  	do nn=1,N
  	   do kk=1,K
  	      !$ thread_num = omp_get_thread_num()
  	      A(nn,kk) = thread_num
  	   end do
  	   !print *, A(nn, :)
  	end do
  	!$omp end parallel do
end subroutine fill_matrix



end module im_f_module
