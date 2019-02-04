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
  	!$omp parallel do 
  	do nn=1,N
  	   do kk=1,K
  	      CALL do_something(i=DBLE(nn),k=DBLE(kk), ik= A(nn,kk))
  	   end do
  	   !print *, A(nn, :)
  	end do
  	!$omp end parallel do
end subroutine fill_matrix

 
 subroutine do_something(i,k, ik)
    double precision, intent(in)                       :: i, k 
    double precision, intent(out)                      :: ik 
      ik = 1 / (1 + exp(i**2 + i**3 + k**2 + k**3))
 end subroutine do_something



end module im_f_module
