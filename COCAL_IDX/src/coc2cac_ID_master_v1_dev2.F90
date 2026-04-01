!_____________________________________________________________________________
!
!    CACTUS READER OF COCAL ROTATING STAR IN WAVELESS FORMALISM 
!_____________________________________________________________________________
!

#define module_use use

#include "Cocal/phys_constant.f90"
#include "Cocal/def_matter_parameter.f90"
#include "Cocal/def_quantities.f90"
#include "Cocal/def_bh_parameter.f90"

#include "Cocal/def_bht_parameter.f90" 

#include "Cocal/def_peos_parameter.f90"

#include "Cocal/def_binary_parameter.f90" 
#include "Cocal/def_matter_parameter_mpt.f90"
#include "Cocal/def_binary_parameter_mpt.f90"
#include "Cocal/def_peos_parameter_mpt.f90"
#include "Cocal/make_char1_array_2d.f90"
#include "Cocal/make_char2_array_2d.f90"
#include "Cocal/make_int_array_2d.f90"
#include "Cocal/make_array_1d.f90"

#include "Cocal/make_array_2d.f90"
#include "Cocal/make_array_3d.f90"
#include "Cocal/grid_parameter.f90"
#include "Cocal/interface_modules_cartesian.f90"
#include "Cocal/coordinate_grav_r.f90"
#include "Cocal/coordinate_grav_phi.f90"
#include "Cocal/coordinate_grav_theta.f90"
#include "Cocal/coordinate_grav_extended.f90"
#include "Cocal/trigonometry_grav_theta.f90"
#include "Cocal/trigonometry_grav_phi.f90"

#include "Cocal/grid_parameter_binary_excision.f90"

#include "Cocal/interface_IO_input_CF_grav_export.f90"
#include "Cocal/interface_IO_input_WL_grav_export_hij.f90"
#include "Cocal/interface_IO_input_grav_export_Kij.f90"
#include "Cocal/interface_IO_input_CF_star_export.f90"
#include "Cocal/interface_invhij_WL_export.f90"
#include "Cocal/interface_index_vec_down2up_export.f90"
#include "Cocal/interface_interpo_gr2fl_metric_CF_export.f90"
#include "Cocal/interface_IO_input_grav_export_Ai.f90"
#include "Cocal/interface_IO_input_grav_export_Faraday.f90"
#include "Cocal/interface_IO_input_star4ve_export.f90"
#include "Cocal/interface_interpo_gr2fl_export.f90"
#include "Cocal/interface_interpo_lag4th_2Dsurf.f90"

#include "Cocal/interface_IO_input_CF_surf_export.f90"
#include "Cocal/interface_IO_input_CF_flco_export.f90"
#include "Cocal/interface_IO_input_CF_flir_export.f90"
#include "Cocal/interface_IO_input_CF_flsp_export.f90"
#include "Cocal/interface_IO_input_gradvep_export.f90"

#include "Cocal/IO_input_CF_grav_export.f90"
#include "Cocal/IO_input_WL_grav_export_hij.f90"
#include "Cocal/IO_input_grav_export_Kij.f90"
#include "Cocal/IO_input_CF_star_export.f90"
#include "Cocal/invhij_WL_export.f90"
#include "Cocal/index_vec_down2up_export.f90"
#include "Cocal/interpo_gr2fl_metric_CF_export.f90"
#include "Cocal/IO_input_grav_export_Ai.f90"
#include "Cocal/IO_input_grav_export_Faraday.f90"
#include "Cocal/IO_input_star4ve_export.f90"
#include "Cocal/interpo_gr2fl_export.f90"
#include "Cocal/interpo_gr2cgr_4th.f90"
#include "Cocal/interpo_fl2cgr_4th_export.f90"
#include "Cocal/interpo_lag4th_2Dsurf.f90"
#include "Cocal/lagint_4th.f90"
#include "Cocal/peos_initialize.f90"
#include "Cocal/peos_q2hprho.f90"
#include "Cocal/peos_lookup.f90"

#include "Cocal/copy_array_static_1dto2d_mpt.f90"
#include "Cocal/copy_int_array_static_1dto2d_mpt.f90"
#include "Cocal/copy_int_array_static_2dto3d_mpt.f90"
#include "Cocal/copy_array_static_2dto1d_mpt.f90"
#include "Cocal/copy_int_array_static_2dto1d_mpt.f90"
#include "Cocal/copy_int_array_static_3dto2d_mpt.f90"
#include "Cocal/copy_array_2dto3d_mpt.f90"
#include "Cocal/copy_array_3dto2d_mpt.f90"
#include "Cocal/copy_array_static_0dto1d_mpt.f90"
#include "Cocal/copy_array_static_1dto0d_mpt.f90"
#include "Cocal/grid_parameter_mpt.f90"
#include "Cocal/grid_parameter_binary_excision_mpt.f90"
#include "Cocal/allocate_grid_parameter_mpt.f90"
#include "Cocal/allocate_grid_parameter_binary_excision_mpt.f90"
#include "Cocal/allocate_def_matter_parameter_mpt.f90"
#include "Cocal/trigonometry_grav_phi_mpt.f90"
#include "Cocal/trigonometry_grav_theta_mpt.f90"
#include "Cocal/coordinate_grav_r_mpt.f90"
#include "Cocal/coordinate_grav_phi_mpt.f90"
#include "Cocal/coordinate_grav_theta_mpt.f90"
#include "Cocal/read_parameter_mpt.f90"
#include "Cocal/read_parameter_binary_excision_mpt.f90"
#include "Cocal/read_surf_parameter_mpt.f90"
#include "Cocal/coordinate_grav_extended_mpt.f90"
#include "Cocal/copy_grid_parameter_to_mpt.f90"
#include "Cocal/copy_grid_parameter_from_mpt.f90"
#include "Cocal/copy_grid_parameter_binary_excision_from_mpt.f90"
#include "Cocal/copy_grid_parameter_binary_excision_to_mpt.f90"
#include "Cocal/copy_coordinate_grav_extended_to_mpt.f90"
#include "Cocal/copy_coordinate_grav_extended_from_mpt.f90"
#include "Cocal/copy_coordinate_grav_phi_to_mpt.f90"
#include "Cocal/copy_coordinate_grav_phi_from_mpt.f90"
#include "Cocal/copy_coordinate_grav_r_to_mpt.f90"
#include "Cocal/copy_coordinate_grav_r_from_mpt.f90"
#include "Cocal/copy_coordinate_grav_theta_to_mpt.f90"
#include "Cocal/copy_coordinate_grav_theta_from_mpt.f90"
#include "Cocal/copy_trigonometry_grav_phi_to_mpt.f90"
#include "Cocal/copy_trigonometry_grav_phi_from_mpt.f90"
#include "Cocal/copy_trigonometry_grav_theta_to_mpt.f90"
#include "Cocal/copy_trigonometry_grav_theta_from_mpt.f90"
#include "Cocal/copy_def_binary_parameter_to_mpt.f90"
#include "Cocal/copy_def_peos_parameter_to_mpt.f90"
#include "Cocal/copy_def_peos_parameter_from_mpt.f90"
#include "Cocal/copy_def_binary_parameter_from_mpt.f90"
#include "Cocal/IO_input_CF_surf_export.f90"
#include "Cocal/IO_input_CF_flco_export.f90"
#include "Cocal/IO_input_CF_flir_export.f90"
#include "Cocal/IO_input_CF_flsp_export.f90"
#include "Cocal/peos_initialize_mpt.f90" 
#include "Cocal/coordinate_patch_kit_grav_grid_coc2cac_mpt.f90" 
#include "Cocal/set_allocate_size_mpt.f90" 
#include "Cocal/IO_input_gradvep_export.f90"
#include "Cocal/allocate_trigonometry_grav_phi_mpt.f90"

#include "Cocal/interface_IO_input_matter_BHT_export.f90"
#include "Cocal/read_bht_parameter.f90" 
#include "Cocal/calc_bht_excision_radius.f90"
#include "Cocal/IO_input_matter_BHT_export.f90"


#include "cctk.h"
#include "cctk_Arguments.h"
#include "cctk_Functions.h"
#include "cctk_Parameters.h"

!#include <mpi.h>
!
!________________________
!subroutine coc2cac_main(CCTK_ARGUMENTS)
!  DECLARE_CCTK_ARGUMENTS
!  DECLARE_CCTK_FUNCTIONS
!  DECLARE_CCTK_PARAMETERS
!  if ((CCTK_EQUALS(initial_data, "CocalRNS")) & 
!      & .or. ((CCTK_EQUALS(initial_data,"Exact")) .and. (CCTK_EQUALS(coc2cac_rnstype,"BHT_WL")))) then
!    call CCTK_INFO("Executing Main Cocal RNS Reader")
!    call coc2cac_rns(CCTK_PASS_FTOF)
!  else if (CCTK_EQUALS(initial_data, "CocalBNS")) then
!    call CCTK_INFO("Executing Main Cocal BNS Reader")
!    call coc2cac_bns(CCTK_PASS_FTOF)
!  end if
!end subroutine coc2cac_main

module cocal_data_rns
  implicit none

  real(8), save :: ome, ber, radi
  real(8), save :: rexc

  real(8), pointer, save :: utf(:,:,:) => NULL() ,  uxf(:,:,:) => NULL() ,  uyf(:,:,:) => NULL() ,  uzf(:,:,:) => NULL()
!
  real(8), pointer, save :: emd(:,:,:) => NULL(), omef(:,:,:) => NULL(), rs(:,:) => NULL()
  real(8), pointer, save :: psi(:,:,:) => NULL() , alph(:,:,:) => NULL()
  real(8), pointer, save :: psif(:,:,:) => NULL() , alphf(:,:,:) => NULL()
  real(8), pointer, save :: bvxuf(:,:,:) => NULL() , bvyuf(:,:,:) => NULL() , bvzuf(:,:,:) => NULL() 
  real(8), pointer, save :: bvxd(:,:,:) => NULL() , bvyd(:,:,:) => NULL() , bvzd(:,:,:) => NULL()
  real(8), pointer, save :: bvxu(:,:,:) => NULL() , bvyu(:,:,:) => NULL() , bvzu(:,:,:) => NULL() 
  real(8), pointer, save :: hxxd(:,:,:) => NULL() , hxyd(:,:,:) => NULL() , hxzd(:,:,:) => NULL() , hyyd(:,:,:) => NULL() , &
                            hyzd(:,:,:) => NULL(), hzzd(:,:,:) => NULL()
  real(8), pointer, save :: hxxu(:,:,:) => NULL() , hxyu(:,:,:) => NULL() , hxzu(:,:,:) => NULL() , hyyu(:,:,:)  => NULL() , &
                            hyzu(:,:,:) => NULL() , hzzu(:,:,:) => NULL() 
  real(8), pointer, save :: kxxa(:,:,:) => NULL()  , kxya(:,:,:) => NULL()  , kxza(:,:,:) => NULL()  , kyya(:,:,:) => NULL(), &
                            kyza(:,:,:) => NULL() , kzza(:,:,:) => NULL()

  real(8), pointer, save ::  va(:,:,:) => NULL()  , vaxd(:,:,:) => NULL() , vayd(:,:,:) => NULL() , vazd(:,:,:) => NULL()                           ! (phi,A)
  real(8), pointer, save :: fxd(:,:,:) => NULL()  ,  fyd(:,:,:) => NULL() ,  fzd(:,:,:) => NULL() , fxyd(:,:,:) => NULL(), &
                            fxzd(:,:,:) => NULL(), fyzd(:,:,:) => NULL() ! Faraday tensor

  logical, save :: have_read_data = .false.
end module cocal_data_rns

module cocal_data_bns
   implicit none
   character*400, save :: dir_path, coc2cac_readformatf
   integer, save        :: dir_path_len, iAB, coc2cac_bnstypelen, coc2cac_readformatlen
   character(2), save   :: id_type
   integer, save        :: ierr=0
   real(8), save :: rr3, dis_cm

   real(8), save :: ome_p1, ber_p1, radi_p1, r_surf_p1
   real(8), save :: ome_p2, ber_p2, radi_p2, r_surf_p2
   integer, save :: nrg_p1,  ntg_p1, npg_p1, nrf_p1, ntf_p1, npf_p1
   integer, save :: nrg_p2,  ntg_p2, npg_p2, nrf_p2, ntf_p2, npf_p2
   integer, save :: nrg_p3,  ntg_p3, npg_p3, nrf_p3, ntf_p3, npf_p3

   !
   real(8), pointer, save :: rg_p1(:), rgex_p1(:), thgex_p1(:), phigex_p1(:)
   integer, pointer, save :: irgex_r_p1(:), itgex_th_p1(:), ipgex_phi_p1(:)
   integer, pointer, save :: itgex_r_p1(:,:), ipgex_r_p1(:,:), ipgex_th_p1(:,:)
   real(8), pointer, save :: emd_p1(:,:,:), rs_p1(:,:)
   real(8), pointer, save :: psif_p1(:,:,:), alphf_p1(:,:,:), bvxdf_p1(:,:,:), bvydf_p1(:,:,:), bvzdf_p1(:,:,:)
   real(8), pointer, save :: psi_p1(:,:,:), alph_p1(:,:,:), bvxd_p1(:,:,:), bvyd_p1(:,:,:), bvzd_p1(:,:,:)
   real(8), pointer, save :: axx_p1(:,:,:), axy_p1(:,:,:) , axz_p1(:,:,:) , ayy_p1(:,:,:) , ayz_p1(:,:,:), azz_p1(:,:,:)
 !
   real(8), pointer, save :: rg_p2(:), rgex_p2(:), thgex_p2(:), phigex_p2(:)
   integer, pointer, save :: irgex_r_p2(:), itgex_th_p2(:), ipgex_phi_p2(:)
   integer, pointer, save :: itgex_r_p2(:,:), ipgex_r_p2(:,:), ipgex_th_p2(:,:)
   real(8), pointer, save :: emd_p2(:,:,:), rs_p2(:,:)
   real(8), pointer, save :: psif_p2(:,:,:), alphf_p2(:,:,:), bvxdf_p2(:,:,:), bvydf_p2(:,:,:), bvzdf_p2(:,:,:)
   real(8), pointer, save :: psi_p2(:,:,:), alph_p2(:,:,:), bvxd_p2(:,:,:), bvyd_p2(:,:,:), bvzd_p2(:,:,:)
   real(8), pointer, save :: axx_p2(:,:,:), axy_p2(:,:,:) , axz_p2(:,:,:) , ayy_p2(:,:,:) , ayz_p2(:,:,:), azz_p2(:,:,:)
 !
   real(8), pointer, save :: rg_p3(:), rgex_p3(:), thgex_p3(:), phigex_p3(:)
   integer, pointer, save :: irgex_r_p3(:), itgex_th_p3(:), ipgex_phi_p3(:)
   integer, pointer, save :: itgex_r_p3(:,:), ipgex_r_p3(:,:), ipgex_th_p3(:,:)
   real(8), pointer, save :: psi_p3(:,:,:), alph_p3(:,:,:), bvxd_p3(:,:,:), bvyd_p3(:,:,:), bvzd_p3(:,:,:)
   real(8), pointer, save :: axx_p3(:,:,:), axy_p3(:,:,:) , axz_p3(:,:,:) , ayy_p3(:,:,:) , ayz_p3(:,:,:), azz_p3(:,:,:)
 !
 
   real(8), pointer, save :: wxspf_p1(:,:,:) => NULL() , wyspf_p1(:,:,:) => NULL() , wzspf_p1(:,:,:) => NULL()  !unique to SP
   real(8), pointer, save :: wxspf_p2(:,:,:) => NULL() , wyspf_p2(:,:,:) => NULL() , wzspf_p2(:,:,:) => NULL()  !unique to SP

   real(8), pointer, save :: vep_p1(:,:,:) => NULL()                 !unique to IR/SP
   real(8), pointer, save :: vepxf_p1(:,:,:) => NULL() , vepyf_p1(:,:,:) => NULL() , vepzf_p1(:,:,:) => NULL()  !unique to IR/SP, SP has more
   real(8), pointer, save :: vep_p2(:,:,:) => NULL()                  !unique to IR/SP
   real(8), pointer, save :: vepxf_p2(:,:,:) => NULL() , vepyf_p2(:,:,:) => NULL() , vepzf_p2(:,:,:) => NULL()  !unique to IR/SP
 
   logical, save :: have_read_data = .false.
 end module cocal_data_bns

subroutine coc2cac_main(CCTK_ARGUMENTS)
  DECLARE_CCTK_ARGUMENTS
  DECLARE_CCTK_FUNCTIONS
  DECLARE_CCTK_PARAMETERS

  interface
  subroutine coc2cac_rns(cctk_lsh, cctk_ash, cctk_tile_min, cctk_tile_max, &
        alp, betax, betay, betaz, &
        gxx, gxy, gxz, gyy, gyz, gzz, &
        kxx, kxy, kxz, kyy, kyz, kzz, &
        rho, eps, press, velx, vely, velz, &
        Bvecx, Bvecy, Bvecz, Avecx, Avecy, Avecz, &
        vcoordx, vcoordy , vcoordz, ccoordx, ccoordy , ccoordz)

    use phys_constant
    use grid_parameter, eps_cocal => eps
    use interface_modules_cartesian
    use coordinate_grav_r
    use coordinate_grav_phi
    use coordinate_grav_theta
    use coordinate_grav_extended
    use trigonometry_grav_theta
    use trigonometry_grav_phi
    use interface_IO_input_CF_grav_export
    use interface_IO_input_WL_grav_export_hij
    use interface_IO_input_grav_export_Kij
    use interface_IO_input_CF_star_export
    use interface_invhij_WL_export
    use interface_index_vec_down2up_export
    use interface_interpo_gr2fl_metric_CF_export

    use interface_IO_input_matter_BHT_export ! Unique to BHT


    use interface_IO_input_grav_export_Ai            ! only used in MRNS_WL
    use interface_IO_input_grav_export_Faraday       !
    use interface_IO_input_star4ve_export            !
    use cocal_data_rns



    implicit none

    integer, dimension(3) :: cctk_lsh, cctk_ash, cctk_tile_min, cctk_tile_max
    CCTK_REAL, dimension(cctk_ash(1), cctk_ash(2), cctk_ash(3)) :: &
        alp, betax, betay, betaz, &
        gxx, gxy, gxz, gyy, gyz, gzz, &
        kxx, kxy, kxz, kyy, kyz, kzz

    CCTK_REAL, dimension(cctk_ash(1)-1, cctk_ash(2)-1, cctk_ash(3)-1) :: &
        rho, eps, press, velx, vely, velz

    CCTK_REAL, dimension(cctk_ash(1)-1, cctk_ash(2)-1, cctk_ash(3)-1) :: &
        Bvecx, Bvecy, Bvecz

    CCTK_REAL, dimension(cctk_ash(1)-1, cctk_ash(2), cctk_ash(3)) :: &
        Avecx
    CCTK_REAL, dimension(cctk_ash(1), cctk_ash(2)-1, cctk_ash(3)) :: &
        Avecy
    CCTK_REAL, dimension(cctk_ash(1), cctk_ash(2), cctk_ash(3)-1) :: &
        Avecz

    CCTK_REAL, dimension(cctk_ash(1), cctk_ash(2), cctk_ash(3)), target :: &
        vcoordx, vcoordy, vcoordz

    CCTK_REAL, dimension(cctk_ash(1)-1, cctk_ash(2)-1, cctk_ash(3)-1), target :: &
        ccoordx, ccoordy, ccoordz
  end subroutine

  subroutine coc2cac_bns(cctk_lsh, cctk_ash, &
        alp, betax, betay, betaz, &
        gxx, gxy, gxz, gyy, gyz, gzz, &
        kxx, kxy, kxz, kyy, kyz, kzz, &
        rho, eps, press, velx, vely, velz, &
        Bvecx, Bvecy, Bvecz, Avecx, Avecy, Avecz, &
        vcoordx, vcoordy , vcoordz, ccoordx, ccoordy , ccoordz)
      
       use grid_parameter_binary_excision
       use phys_constant
       use grid_parameter, eps_cocal => eps
       use coordinate_grav_r
       use coordinate_grav_extended
       use interface_modules_cartesian
 !      use interface_calc_gradvep_export
       use trigonometry_grav_phi
       use def_binary_parameter, only : dis
       use def_matter_parameter_mpt
       use interface_interpo_lag4th_2Dsurf
       use interface_IO_input_CF_grav_export
       use interface_IO_input_CF_flir_export !IR
       use interface_IO_input_CF_flco_export !CO
       use interface_IO_input_CF_flsp_export !SP
       use interface_IO_input_CF_surf_export
 !      use interface_excurve_CF_gridpoint_export
       use interface_IO_input_grav_export_Kij
       use interface_interpo_gr2fl_metric_CF_export
       use interface_IO_input_gradvep_export !unique to IR/SP
       use cocal_data_bns
         
    implicit none

    integer, dimension(3) :: cctk_lsh, cctk_ash
    CCTK_REAL, dimension(cctk_ash(1), cctk_ash(2), cctk_ash(3)) :: &
        alp, betax, betay, betaz, &
        gxx, gxy, gxz, gyy, gyz, gzz, &
        kxx, kxy, kxz, kyy, kyz, kzz

    CCTK_REAL, dimension(cctk_ash(1)-1, cctk_ash(2)-1, cctk_ash(3)-1) :: &
        rho, eps, press, velx, vely, velz

    CCTK_REAL, dimension(cctk_ash(1)-1, cctk_ash(2)-1, cctk_ash(3)-1) :: &
        Bvecx, Bvecy, Bvecz

    CCTK_REAL, dimension(cctk_ash(1)-1, cctk_ash(2), cctk_ash(3)) :: &
        Avecx
    CCTK_REAL, dimension(cctk_ash(1), cctk_ash(2)-1, cctk_ash(3)) :: &
        Avecy
    CCTK_REAL, dimension(cctk_ash(1), cctk_ash(2), cctk_ash(3)-1) :: &
        Avecz

    CCTK_REAL, dimension(cctk_ash(1), cctk_ash(2), cctk_ash(3)), target :: &
        vcoordx, vcoordy, vcoordz

    CCTK_REAL, dimension(cctk_ash(1)-1, cctk_ash(2)-1, cctk_ash(3)-1), target :: &
        ccoordx, ccoordy, ccoordz
  end subroutine

  end interface


  if ((CCTK_EQUALS(initial_data, "CocalRNS")) & 
      & .or. ((CCTK_EQUALS(initial_data,"Exact")) .and. (CCTK_EQUALS(coc2cac_rnstype,"BHT_WL")))) then
    call CCTK_INFO("Executing Main Cocal RNS Reader")
    call coc2cac_rns(cctk_lsh, cctk_ash, cctk_tile_min, cctk_tile_max, &
      alp, betax, betay, betaz, &
      gxx, gxy, gxz, gyy, gyz, gzz, &
      kxx, kxy, kxz, kyy, kyz, kzz, &
      rho, eps, press, velx, vely, velz, &
      Bvecx, Bvecy, Bvecz, Avecx, Avecy, Avecz, &
      vcoordx, vcoordy , vcoordz, ccoordx, ccoordy , ccoordz)
  else if (CCTK_EQUALS(initial_data, "CocalBNS")) then
    call CCTK_INFO("Executing Main Cocal BNS Reader")
    
    call coc2cac_bns(cctk_lsh, cctk_ash, &
      alp, betax, betay, betaz, &
      gxx, gxy, gxz, gyy, gyz, gzz, &
      kxx, kxy, kxz, kyy, kyz, kzz, &
      rho, eps, press, velx, vely, velz, &
      Bvecx, Bvecy, Bvecz, Avecx, Avecy, Avecz, &
      vcoordx, vcoordy , vcoordz, ccoordx, ccoordy , ccoordz)
  end if
end subroutine coc2cac_main


subroutine coc2cac_deallocate_rns(CCTK_ARGUMENTS)

     use cocal_data_rns

     implicit none

     DECLARE_CCTK_ARGUMENTS
     DECLARE_CCTK_FUNCTIONS
     DECLARE_CCTK_PARAMETERS

     if (verbose == 1) then 
        call CCTK_INFO("Deallocating...")
     end if
     
     if (CCTK_EQUALS(coc2cac_rnstype,"MRNS_WL")) then
         deallocate(utf ,  uxf ,  uyf ,  uzf)
         if ((coc2cac_readpot == 1)) then
            deallocate( va  , vaxd , vayd , vazd)! (phi,A)
         else
            deallocate(fxd  ,  fyd ,  fzd , fxyd, fxzd, fyzd) ! Faraday tensor
         end if
     end if
   !
     deallocate(emd, omef, rs)
     deallocate(psi  , alph)
     deallocate(psif, alphf)
     deallocate(bvxuf, bvyuf, bvzuf)
     deallocate(bvxd , bvyd , bvzd)
     deallocate(bvxu , bvyu , bvzu)
     deallocate(hxxd , hxyd , hxzd , hyyd , hyzd, hzzd)
     deallocate(hxxu , hxyu , hxzu , hyyu , hyzu , hzzu)
     deallocate(kxxa  , kxya  , kxza  , kyya, kyza , kzza)

     have_read_data = .false.
     if (verbose == 1) then 
        call CCTK_INFO("Done Deallocating...")
     end if
end subroutine

subroutine coc2cac_deallocate_bns(CCTK_ARGUMENTS)

   use cocal_data_bns

   implicit none

   DECLARE_CCTK_ARGUMENTS
   DECLARE_CCTK_FUNCTIONS
   DECLARE_CCTK_PARAMETERS

   if (verbose == 1) then 
      call CCTK_INFO("Deallocating...")
   end if
   
   deallocate(       rg_p1);  deallocate(       rg_p2);  deallocate(       rg_p3)
   deallocate(     rgex_p1);  deallocate(     rgex_p2);  deallocate(     rgex_p3)
   deallocate(    thgex_p1);  deallocate(    thgex_p2);  deallocate(    thgex_p3)
   deallocate(   phigex_p1);  deallocate(   phigex_p2);  deallocate(   phigex_p3)
   deallocate(  irgex_r_p1);  deallocate(  irgex_r_p2);  deallocate(  irgex_r_p3)
   deallocate( itgex_th_p1);  deallocate( itgex_th_p2);  deallocate( itgex_th_p3)
   deallocate(ipgex_phi_p1);  deallocate(ipgex_phi_p2);  deallocate(ipgex_phi_p3)
   deallocate(  itgex_r_p1);  deallocate(  itgex_r_p2);  deallocate(  itgex_r_p3)
   deallocate(  ipgex_r_p1);  deallocate(  ipgex_r_p2);  deallocate(  ipgex_r_p3)
   deallocate( ipgex_th_p1);  deallocate( ipgex_th_p2);  deallocate( ipgex_th_p3)
   
   deallocate(  emd_p1);  deallocate(  emd_p2);
   select case (trim(id_type))
      case ("IR","SP")
         deallocate(vep_p1);    deallocate(vep_p2);
         deallocate(vepxf_p1);  deallocate(vepxf_p2); 
         deallocate(vepyf_p1);  deallocate(vepyf_p2); 
         deallocate(vepzf_p1);  deallocate(vepzf_p2); 
         select case (trim(id_type))
            case ("SP")
               deallocate(wxspf_p1);  deallocate(wxspf_p2); 
               deallocate(wyspf_p1);  deallocate(wyspf_p2); 
               deallocate(wzspf_p1);  deallocate(wzspf_p2); 
         end select
   end select
   deallocate( psif_p1);  deallocate( psif_p2);
   deallocate(alphf_p1);  deallocate(alphf_p2);
   deallocate(bvxdf_p1);  deallocate(bvxdf_p2);
   deallocate(bvydf_p1);  deallocate(bvydf_p2);
   deallocate(bvzdf_p1);  deallocate(bvzdf_p2);
   deallocate(   rs_p1);  deallocate(   rs_p2);
   deallocate(  psi_p1);  deallocate(  psi_p2);  deallocate(psi_p3)
   deallocate( alph_p1);  deallocate( alph_p2);  deallocate(alph_p3)
   deallocate( bvxd_p1);  deallocate( bvxd_p2);  deallocate(bvxd_p3)
   deallocate( bvyd_p1);  deallocate( bvyd_p2);  deallocate(bvyd_p3)
   deallocate( bvzd_p1);  deallocate( bvzd_p2);  deallocate(bvzd_p3)
   deallocate(  axx_p1);  deallocate(  axx_p2);  deallocate(axx_p3)
   deallocate(  axy_p1);  deallocate(  axy_p2);  deallocate(axy_p3)
   deallocate(  axz_p1);  deallocate(  axz_p2);  deallocate(axz_p3)
   deallocate(  ayy_p1);  deallocate(  ayy_p2);  deallocate(ayy_p3)
   deallocate(  ayz_p1);  deallocate(  ayz_p2);  deallocate(ayz_p3)
   deallocate(  azz_p1);  deallocate(  azz_p2);  deallocate(azz_p3)

   have_read_data = .false.
   if (verbose == 1) then 
      call CCTK_INFO("Done Deallocating...")
   end if
end subroutine

!RNS Routine
  subroutine coc2cac_rns(cctk_lsh, cctk_ash, cctk_tile_min, cctk_tile_max,&
      alp, betax, betay, betaz, &
      gxx, gxy, gxz, gyy, gyz, gzz, &
      kxx, kxy, kxz, kyy, kyz, kzz, &
      rho, eps, press, velx, vely, velz, &
      Bvecx, Bvecy, Bvecz, Avecx, Avecy, Avecz, &
      vcoordx, vcoordy , vcoordz, ccoordx, ccoordy , ccoordz)

  use phys_constant
  use grid_parameter, eps_cocal => eps
  use interface_modules_cartesian
  use coordinate_grav_r
  use coordinate_grav_phi
  use coordinate_grav_theta
  use coordinate_grav_extended
  use trigonometry_grav_theta
  use trigonometry_grav_phi
  use interface_IO_input_CF_grav_export
  use interface_IO_input_WL_grav_export_hij
  use interface_IO_input_grav_export_Kij
  use interface_IO_input_CF_star_export
  use interface_invhij_WL_export
  use interface_index_vec_down2up_export
  use interface_interpo_gr2fl_metric_CF_export

  use interface_IO_input_matter_BHT_export ! Unique to BHT
 

  use interface_IO_input_grav_export_Ai            ! only used in MRNS_WL
  use interface_IO_input_grav_export_Faraday       !
  use interface_IO_input_star4ve_export            !
  use cocal_data_rns
  


  implicit none

  integer, dimension(3) :: cctk_lsh, cctk_ash, cctk_tile_min, cctk_tile_max
  CCTK_REAL, dimension(cctk_ash(1), cctk_ash(2), cctk_ash(3)) :: &
      alp, betax, betay, betaz, &
      gxx, gxy, gxz, gyy, gyz, gzz, &
      kxx, kxy, kxz, kyy, kyz, kzz

  CCTK_REAL, dimension(cctk_ash(1)-1, cctk_ash(2)-1, cctk_ash(3)-1) :: &
      rho, eps, press, velx, vely, velz

  CCTK_REAL, dimension(cctk_ash(1)-1, cctk_ash(2)-1, cctk_ash(3)-1) :: &
      Bvecx, Bvecy, Bvecz

  CCTK_REAL, dimension(cctk_ash(1)-1, cctk_ash(2), cctk_ash(3)) :: &
      Avecx
  CCTK_REAL, dimension(cctk_ash(1), cctk_ash(2)-1, cctk_ash(3)) :: &
      Avecy
  CCTK_REAL, dimension(cctk_ash(1), cctk_ash(2), cctk_ash(3)-1) :: &
      Avecz

  CCTK_REAL, dimension(cctk_ash(1), cctk_ash(2), cctk_ash(3)), target :: &
      vcoordx, vcoordy, vcoordz

  CCTK_REAL, dimension(cctk_ash(1)-1, cctk_ash(2)-1, cctk_ash(3)-1), target :: &
      ccoordx, ccoordy, ccoordz

  DECLARE_CCTK_FUNCTIONS
  DECLARE_CCTK_PARAMETERS
  !call CCTK_INFO("Imported modules and CCTK stuff")
  integer :: iAB 
  !character(30) :: char1
  character*400 :: dir_path, outstr, coc2cac_readformatf !,cocout_dir
  

  integer :: dir_path_len,coc2cac_readformatlen !, cocout_dir_len
  integer :: i, j, k, imin, imax, jmin, jmax, kmin, kmax, l, ns, rank, mpierr

  logical :: bool_hydro, bool_lapse, bool_shift, bool_Bvec
  
  real(8) :: xcac, ycac, zcac
  real(8) :: xcoc, ycoc, zcoc, rcoc, expnr, expnv
  real(8) :: emdca,  omefca, psica,  alphca, psi4ca, psif4ca
  real(8) :: bvxdca, bvydca, bvzdca, bvxuca, bvyuca, bvzuca
  real(8) :: hxxdca, hxydca, hxzdca, hyydca, hyzdca, hzzdca
  real(8) :: hxxuca, hxyuca, hxzuca, hyyuca, hyzuca, hzzuca
  real(8) :: hca, preca, rhoca, eneca, epsca
  real(8) :: kxxca, kxyca, kxzca, kyyca, kyzca, kzzca
  real(8) :: vxu, vyu, vzu
  real(8) :: bxcor, bycor, bzcor, bvxufca, bvyufca, bvzufca, psifca, alphfca
  real(8) :: gxx1, gxy1, gxz1, gyy1, gyz1, gzz1, kxx1, kxy1, kxz1, kyy1, kyz1, kzz1

  real(8) :: va1, vaxd1, vayd1, vazd1, fxd1, fyd1, fzd1, fxyd1, fxzd1, fyzd1!
  real(8) :: vaca, vaxdca, vaydca, vazdca, fxdca, fydca, fzdca, fxydca, fxzdca, fyzdca!
  real(8) :: utfca, uxfca, uyfca, uzfca ! Fluid 4 vel

  real(8), pointer :: alphN(:,:,:,:), betaxdN(:,:,:,:), betaydN(:,:,:,:), betazdN(:,:,:,:) ! New stuff
  real(8), pointer :: gxxN(:,:,:,:), gxyN(:,:,:,:), gxzN(:,:,:,:), gyyN(:,:,:,:), gyzN(:,:,:,:), gzzN(:,:,:,:)
  real(8), pointer :: kxxN(:,:,:,:), kxyN(:,:,:,:), kxzN(:,:,:,:), kyyN(:,:,:,:), kyzN(:,:,:,:), kzzN(:,:,:,:)
  real(8), pointer :: rhoN(:,:,:,:), pressN(:,:,:,:), epsN(:,:,:,:)
  real(8), pointer :: veluxN(:,:,:,:), veluyN(:,:,:,:), veluzN(:,:,:,:), BvecuxN(:,:,:,:), BvecuyN(:,:,:,:), BvecuzN(:,:,:,:)

  integer :: cent
  real(8), pointer :: x(:,:,:), y(:,:,:), z(:,:,:)
  ! 0 -> vertex, 1 -> cell
  integer, parameter, dimension(3,5) :: centering =  reshape( (/0,0,0, 1,1,1, 1,0,0, 0,1,0, 0,0,1/), shape=(/3,5/))
  !call MPI_Init(mpierr)
  !call MPI_Comm_rank(MPI_COMM_WORLD, rank, mpierr)
  !call MPI_Finalize(mpierr)

  do cent = 1,5
  if (centering(1,cent) .eq. 0) then
    x => vcoordx
  else
    x => ccoordx
  endif
  if (centering(2,cent) .eq. 0) then
    y => vcoordy
  else
    y => ccoordy
  endif
  if (centering(3,cent) .eq. 0) then
    z => vcoordz
  else
    z => ccoordz
  endif
  if (verbose == 1) then 
    call CCTK_INFO("Cocal matrices and points declared")
  end if
!
  gxx1=0.0d0; gxy1=0.0d0; gxz1=0.0d0; gyy1=0.0d0; gyz1=0.0d0; gzz1=0.0d0
  kxx1=0.0d0; kxy1=0.0d0; kxz1=0.0d0; kyy1=0.0d0; kyz1=0.0d0; kzz1=0.0d0
  kxxca=0.0d0; kxyca=0.0d0; kxzca=0.0d0; kyyca=0.0d0; kyzca=0.0d0; kzzca=0.0d0

!   alphN = 0.0d0; betaxdN = 0.0d0; betaydN = 0.0d0; betazdN = 0.0d0
!   gxxN = 0.0d0; gxyN = 0.0d0; gxzN = 0.0d0; gyyN = 0.0d0; gyzN = 0.0d0; gzzN = 0.0d0
!   kxxN = 0.0d0; kxyN = 0.0d0; kxzN = 0.0d0; kyyN = 0.0d0; kyzN = 0.0d0; kzzN = 0.0d0
!   rhoN = 0.0d0; pressN = 0.0d0; epsN = 0.0d0
!   veluxN = 0.0d0; veluyN = 0.0d0; veluzN = 0.0d0; BvecuxN = 0.0d0; BvecuyN = 0.0d0; BvecuzN = 0.0d0

  vaca=0.0d0;  vaxdca=0.0d0;  vaydca=0.0d0;  vazdca=0.0d0;                              ! (phi,A)
  fxdca=0.0d0; fydca=0.0d0; fzdca=0.0d0; fxydca=0.0d0; fxzdca=0.0d0; fyzdca=0.0d0;     ! Faraday Tensor
  fxd1=0.0d0;  fyd1=0.0d0;  fzd1=0.0d0;  fxyd1=0.0d0;  fxzd1=0.0d0; fyzd1=0.0d0;          !
  va1=0.0d0;  vaxd1=0.0d0; vayd1=0.0d0; vazd1=0.0d0;                                      !(phi,A) (Aphi, Avec[3]) & (Bvec[3])
  utfca=0.0d0;  uxfca=0.0d0;  uyfca=0.0d0;  uzfca=0.0d0;                                  ! Fluid 4 vel (vel[3])

  expnr=0.0d0; expnv=0.0d0

  ! 1 less data element in the cell centered arrays along respective dimension
  imin = max(1, 1+cctk_tile_min(1)) ! +1 for Fortran counting
  jmin = max(1, 1+cctk_tile_min(2))
  kmin = max(1, 1+cctk_tile_min(3))
  imax = min(cctk_lsh(1) - centering(1, cent), cctk_tile_max(1))
  jmax = min(cctk_lsh(2) - centering(2, cent), cctk_tile_max(2))
  kmax = min(cctk_lsh(3) - centering(3, cent), cctk_tile_max(3))
  ns = coc2cac_Nstars
  if (CCTK_EQUALS(initial_hydro, "Cocal")) then
    bool_hydro = .true.
  else
    bool_hydro = .false.
  end if
  if (CCTK_EQUALS(initial_lapse, "Cocal")) then
     bool_lapse = .true.
  else
     bool_lapse = .false.
  end if
  if (CCTK_EQUALS(initial_shift, "Cocal")) then
     bool_shift = .true.
  else
     bool_shift = .false.
  end if
  if (CCTK_EQUALS(initial_hydro, "Cocal")) then
     bool_Bvec = .true.
  else
     bool_Bvec = .false.
  end if

  if (ns > 1) then 
    if (verbose == 1) then
       call CCTK_INFO("Beginning multiple star reader... ")
       write(outstr,'(I5)') ns
       call CCTK_INFO("Number of stars to read: "//outstr)
    end if
    allocate(alphN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
    allocate(betaxdN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
    allocate(betaydN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
    allocate(betazdN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
    allocate(gxxN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
    allocate(gxyN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
    allocate(gxzN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
    allocate(gyyN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
    allocate(gyzN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
    allocate(gzzN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
    allocate(kxxN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
    allocate(kxyN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
    allocate(kxzN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
    allocate(kyyN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
    allocate(kyzN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
    allocate(kzzN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
    allocate(rhoN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
    allocate(pressN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
    allocate(epsN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
    allocate(veluxN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
    allocate(veluyN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
    allocate(veluzN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
    allocate(BvecuxN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
    allocate(BvecuyN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
    allocate(BvecuzN(imin:imax,jmin:jmax,kmin:kmax,1:ns))
  end if
  do l = 1, ns
      call CCTK_FortranString(dir_path_len,coc2cac_dir_path_ID,dir_path)  !For reading initial data

      !call CCTK_FortranString(cocout_dir_len,out_dir,cocout_dir) !For copy to output directory
      if (verbose == 1) then
         call CCTK_INFO("Beginning COCAL RNS reader...")
      
      !write(outstr,'(5A)') coc2cac_rnstype
         call CCTK_INFO("Executing Reader: "); call CCTK_PrintString(coc2cac_rnstype);
      end if 

      call CCTK_FortranString(coc2cac_readformatlen,coc2cac_readformat,coc2cac_readformatf)

      ! -- Read parameters
      !$OMP critical(coc2cac_rns_read)
      if (.not. have_read_data) then
         if (verbose == 1) then
            call CCTK_INFO("Reading data...")
            call CCTK_INFO("Reading format: " // coc2cac_readformatf)
            ! -- Read parameters
            call CCTK_INFO("Cocal: Reading parameters...")
         end if
         call read_parameter_cactus(dir_path)
         call peos_initialize_cactus(dir_path)
         if (CCTK_EQUALS(coc2cac_rnstype, "BHT_WL")) then
            call read_bht_parameter_cactus(dir_path) ! Unique to BHT
            call calc_bht_excision_radius ! Unique to BHT
            call grid_r_bht('eBH') ! Dfferent naming
            rexc = rg(0)
            write(outstr,'(F4.2)') rexc
            if (verbose == 1) then
               call CCTK_INFO("Excision at r="//outstr)
            end if
         else
            call grid_r
         end if
         call grid_theta
         call trig_grav_theta
         call grid_phi
         call allocate_trig_grav_mphi
         call trig_grav_phi
         call grid_extended
      
         ! -- Allocate arrays
         if (verbose == 1) then 
            call CCTK_INFO("Cocal: Allocating local arrays...")

            write(outstr,'(6i5)') nrg, ntg, npg, nrf, ntf, npf
            call CCTK_INFO("Cocal Grav grid, Fluid Grid Sizes: "//outstr)
         end if
         !
         !    write(6,'(6i5)') nrg, ntg, npg, nrf, ntf, npf
         !  rr3 = 0.7d0*(rgout - rgmid)
         !  dis_cm = dis
         allocate ( psif(0:nrf,0:ntf,0:npf))
         allocate (alphf(0:nrf,0:ntf,0:npf))
         allocate (bvxuf(0:nrf,0:ntf,0:npf))
         allocate (bvyuf(0:nrf,0:ntf,0:npf))
         allocate (bvzuf(0:nrf,0:ntf,0:npf))
         if (verbose == 1) then 
            call CCTK_INFO("Fluid Grid Allocated...")
         end if
         allocate ( bvxu(0:nrg,0:ntg,0:npg))
         allocate ( bvyu(0:nrg,0:ntg,0:npg))
         allocate ( bvzu(0:nrg,0:ntg,0:npg))
         allocate ( hxxu(0:nrg,0:ntg,0:npg))
         allocate ( hxyu(0:nrg,0:ntg,0:npg))
         allocate ( hxzu(0:nrg,0:ntg,0:npg))
         allocate ( hyyu(0:nrg,0:ntg,0:npg))
         allocate ( hyzu(0:nrg,0:ntg,0:npg))
         allocate ( hzzu(0:nrg,0:ntg,0:npg))
         if (verbose == 1) then 
            call CCTK_INFO("Gravitational Grid Allocated...")

            call CCTK_INFO("Done Allocating...")
         end if
         psif=0.0d0; alphf=0.0d0; bvxuf=0.0d0; bvyuf=0.0d0; bvzuf=0.0d0 !

         bvxu=0.0d0; bvyu=0.0d0;  bvzu=0.0d0
         hxxu=0.0d0; hxyu=0.0d0;  hxzu=0.0d0;  hyyu=0.0d0;  hyzu=0.0d0;  hzzu=0.0d0;
         if (verbose == 1) then 
            call CCTK_INFO("Done initializing Varriables...")
         end if 

         allocate (  psi(0:nrg,0:ntg,0:npg))
         allocate ( alph(0:nrg,0:ntg,0:npg))
         allocate ( bvxd(0:nrg,0:ntg,0:npg))
         allocate ( bvyd(0:nrg,0:ntg,0:npg))
         allocate ( bvzd(0:nrg,0:ntg,0:npg))
         psi=0.0d0;  alph=0.0d0;  bvxd=0.0d0;  bvyd=0.0d0;  bvzd=0.0d0

         ! ome,ber,radi
         allocate (   rs(0:ntf,0:npf))
         if (.not. CCTK_EQUALS(coc2cac_rnstype, "BHT_WL")) then
            allocate (  emd(0:nrf,0:ntf,0:npf))
            allocate ( omef(0:nrf,0:ntf,0:npf))
         else
            allocate (  emd(0:nrg,0:ntg,0:npg))
            allocate ( omef(0:nrg,0:ntg,0:npg))
         end if
         emd=0.0d0;  rs  =0.0d0;  omef=0.0d0

         allocate (  kxxa(0:nrg,0:ntg,0:npg))
         allocate (  kxya(0:nrg,0:ntg,0:npg))
         allocate (  kxza(0:nrg,0:ntg,0:npg))
         allocate (  kyya(0:nrg,0:ntg,0:npg))
         allocate (  kyza(0:nrg,0:ntg,0:npg))
         allocate (  kzza(0:nrg,0:ntg,0:npg))
         kxxa=0.0d0;  kxya =0.0d0;  kxza =0.0d0;   kyya=0.0d0;   kyza=0.0d0;   kzza=0.0d0

         allocate ( hxxd(0:nrg,0:ntg,0:npg))
         allocate ( hxyd(0:nrg,0:ntg,0:npg))
         allocate ( hxzd(0:nrg,0:ntg,0:npg))
         allocate ( hyyd(0:nrg,0:ntg,0:npg))
         allocate ( hyzd(0:nrg,0:ntg,0:npg))
         allocate ( hzzd(0:nrg,0:ntg,0:npg))
         hxxd=0.0d0; hxyd=0.0d0;  hxzd=0.0d0;  hyyd=0.0d0;  hyzd=0.0d0;  hzzd=0.0d0;

         if (CCTK_EQUALS(coc2cac_rnstype,"MRNS_WL")) then
            allocate (  utf(0:nrf,0:ntf,0:npf)) ! fluid 4vel
            allocate (  uxf(0:nrf,0:ntf,0:npf)) !
            allocate (  uyf(0:nrf,0:ntf,0:npf)) !
            allocate (  uzf(0:nrf,0:ntf,0:npf)) !
            utf=0.0d0;  uxf=0.0d0;   uyf=0.0d0;   uzf=0.0d0;     !fluid 4 vel init
            if (coc2cac_readpot == 1) then
               allocate (   va(0:nrg,0:ntg,0:npg)) !(phi,A)
               allocate ( vaxd(0:nrg,0:ntg,0:npg))
               allocate ( vayd(0:nrg,0:ntg,0:npg))
               allocate ( vazd(0:nrg,0:ntg,0:npg))
               va=0.0d0;    vaxd=0.0d0;  vayd=0.0d0;   vazd=0.0d0;
            else if (coc2cac_readpot == 0) then
               allocate (  fxd(0:nrg,0:ntg,0:npg)) !Faraday tensor
               allocate (  fyd(0:nrg,0:ntg,0:npg))
               allocate (  fzd(0:nrg,0:ntg,0:npg))
               allocate ( fxyd(0:nrg,0:ntg,0:npg))
               allocate ( fxzd(0:nrg,0:ntg,0:npg))
               allocate ( fyzd(0:nrg,0:ntg,0:npg))
               fxd=0.0d0;   fyd=0.0d0;   fzd=0.0d0;    fxyd=0.0d0;   fxzd=0.0d0;  fyzd=0.0d0;
            end if
         end if

         call IO_input_CF_grav_export(trim(dir_path)//"/rnsgra_3D.las",coc2cac_readformatf,psi,alph,bvxd,bvyd,bvzd)

         if (CCTK_EQUALS(coc2cac_rnstype, "BHT_WL")) then
            call IO_input_matter_BHT_export(trim(dir_path)//"/rnsflu_3D.las",coc2cac_readformatf,emd,omef,ome,ber,radi)
         else
            call IO_input_CF_star_export(trim(dir_path)//"/rnsflu_3D.las",coc2cac_readformatf,emd,rs,omef,ome,ber,radi)
         end if

         call IO_input_grav_export_Kij(trim(dir_path)//"/rnsgra_Kij_3D.las",kxxa,kxya,kxza,kyya,kyza,kzza)

         ! LET CF h_ij's remain initialized to zero.
         ! Only CF change is that h_ij = 0, everything else remains the same.
         ! Only non-trivial change between CF and WL
         if (CCTK_EQUALS(coc2cac_rnstype, "RNS_WL") .or. CCTK_EQUALS(coc2cac_rnstype,"MRNS_WL") .or. (CCTK_EQUALS(coc2cac_rnstype, "BHT_WL"))) then
            call IO_input_WL_grav_export_hij(trim(dir_path)//"/rnsgra_hij_3D.las",coc2cac_readformatf,hxxd,hxyd,hxzd,hyyd,hyzd,hzzd)
         else if (CCTK_EQUALS(coc2cac_rnstype, "RNS_CF")) then
            continue
         else
            call CCTK_WARN(CCTK_WARN_ABORT, "Invalid coc2cac_rnstype specified.")
         end if


         if (CCTK_EQUALS(coc2cac_rnstype,"MRNS_WL")) then
            if (coc2cac_readpot == 1) then
               call IO_input_grav_export_Ai(trim(dir_path)//"/rnsEMF_3D.las",coc2cac_readformatf,va,vaxd,vayd,vazd)
            else if (coc2cac_readpot == 0) then
               call IO_input_grav_export_Faraday(trim(dir_path)//"/rnsEMF_faraday_3D.las",coc2cac_readformatf,fxd,fyd,fzd,fxyd,fxzd,fyzd)
            end if
            call IO_input_star4ve_export(trim(dir_path)//"/rns4ve_3D.las",coc2cac_readformatf,utf,uxf,uyf,uzf) ! fluid 4vel
         end if

         if (verbose ==1) then
            write(outstr,'(2e20.12)') emd(0,0,0), omef(0,0,0)
            call CCTK_INFO("Cocal: Central values of emd, omef: "//outstr)
            write(outstr,'(3e20.12)') ome, ber, radi
            call CCTK_INFO("Cocal: Global values of ome, ber, radi: "//outstr)
            call CCTK_INFO("Cocal: Beginning Internal Aux. Grid Construction...")
         end if
         
         call invhij_WL_export(hxxd,hxyd,hxzd,hyyd,hyzd,hzzd,hxxu,hxyu,hxzu,hyyu,hyzu,hzzu) !trivial for CF 0=0

         call index_vec_down2up_export(hxxu,hxyu,hxzu,hyyu,hyzu,hzzu,bvxu,bvyu,bvzu,bvxd,bvyd,bvzd) !trivial for CF, u=d

         if (.not. CCTK_EQUALS(coc2cac_rnstype, "BHT_WL")) then
            call interpo_gr2fl_metric_CF_export(alph, psi, bvxu, bvyu, bvzu, alphf, psif, bvxuf, bvyuf, bvzuf, rs) !Main Interpolation
         end if
         

         !  call excurve_CF_gridpoint_export(alph,bvxd,bvyd,bvzd, & 
         !     &    axx, axy, axz, ayy, ayz, azz)
         
         if (verbose == 1) then
            call CCTK_INFO("Cocal: Finished Internal Aux. Grid Construction")
            call CCTK_INFO("Done reading data...")
            call CCTK_INFO("Cocal: Looping over local cartesian grid:")
         end if

         have_read_data = .true.
      end if
      !$OMP END CRITICAL(coc2cac_rns_read)
      
         do k = kmin, kmax
            do j = jmin, jmax
               do i = imin, imax
               if (l == 1) then
                 ! TODO: fix vertex / cell issues
                  xcac = x(i,j,k) - coc2cac_cen_x1
                  ycac = y(i,j,k) - coc2cac_cen_y1
                  zcac = z(i,j,k) - coc2cac_cen_z1
               else if (l == 2) then
                  xcac = x(i,j,k) - coc2cac_cen_x2
                  ycac = y(i,j,k) - coc2cac_cen_y2
                  zcac = z(i,j,k) - coc2cac_cen_z2
               else if (l == 3) then
                  xcac = x(i,j,k) - coc2cac_cen_x3
                  ycac = y(i,j,k) - coc2cac_cen_y3
                  zcac = z(i,j,k) - coc2cac_cen_z3
               end if
               !vcordx in carpetx for cell vertex
               !ccordx in carpetx for cell center
         !        write(6,*)' i, j, k, xcac, ycac, zcac', i, j, k, xcac, ycac, zcac

               xcoc = xcac/(radi)
               ycoc = ycac/(radi)
               zcoc = zcac/(radi)
               rcoc = sqrt(xcoc**2 + ycoc**2 + zcoc**2)

               if (CCTK_EQUALS(coc2cac_rnstype, "BHT_WL")) then
                  if ((rcoc < rexc) .and. (bool_hydro)) then
                    if (cent .eq. 2) then
                     press(i,j,k) = 0.0
                     eps(i,j,k)   = 0.0
                     velx(i,j,k)  = 0.0
                     vely(i,j,k)  = 0.0
                     velz(i,j,k)  = 0.0
                     Bvecx(i,j,k) = 0.0
                     Bvecy(i,j,k) = 0.0
                     Bvecz(i,j,k) = 0.0
                    end if
                  end if
               end if
         !        write(6,'(a23,3e20.12)') "Point given wrt COCAL:", xcoc,ycoc,zcoc

               call interpo_gr2cgr_4th(psi , psica , xcoc, ycoc, zcoc)
               call interpo_gr2cgr_4th(alph, alphca, xcoc, ycoc, zcoc)

               call interpo_gr2cgr_4th(bvxd, bvxdca, xcoc, ycoc, zcoc)
               call interpo_gr2cgr_4th(bvyd, bvydca, xcoc, ycoc, zcoc)
               call interpo_gr2cgr_4th(bvzd, bvzdca, xcoc, ycoc, zcoc)

               call interpo_gr2cgr_4th(bvxu, bvxuca, xcoc, ycoc, zcoc) !Repeats itself for CF
               call interpo_gr2cgr_4th(bvyu, bvyuca, xcoc, ycoc, zcoc)
               call interpo_gr2cgr_4th(bvzu, bvzuca, xcoc, ycoc, zcoc) 
         
               call interpo_gr2cgr_4th(hxxd, hxxdca, xcoc, ycoc, zcoc) !Trivial for CF, 0 = 0
               call interpo_gr2cgr_4th(hxyd, hxydca, xcoc, ycoc, zcoc)
               call interpo_gr2cgr_4th(hxzd, hxzdca, xcoc, ycoc, zcoc)
               call interpo_gr2cgr_4th(hyyd, hyydca, xcoc, ycoc, zcoc)
               call interpo_gr2cgr_4th(hyzd, hyzdca, xcoc, ycoc, zcoc)
               call interpo_gr2cgr_4th(hzzd, hzzdca, xcoc, ycoc, zcoc)
               
               
               call interpo_gr2cgr_4th(kxxa , kxxca , xcoc, ycoc, zcoc)
               call interpo_gr2cgr_4th(kxya , kxyca , xcoc, ycoc, zcoc)
               call interpo_gr2cgr_4th(kxza , kxzca , xcoc, ycoc, zcoc)
               call interpo_gr2cgr_4th(kyya , kyyca , xcoc, ycoc, zcoc)
               call interpo_gr2cgr_4th(kyza , kyzca , xcoc, ycoc, zcoc)
               call interpo_gr2cgr_4th(kzza , kzzca , xcoc, ycoc, zcoc)

               
               if (CCTK_EQUALS(coc2cac_rnstype, "BHT_WL")) then
                  call interpo_gr2cgr_4th(emd  , emdca   , xcoc, ycoc, zcoc)
                  call interpo_gr2cgr_4th(omef , omefca  , xcoc, ycoc, zcoc)
               else
                  call interpo_fl2cgr_4th_export(emd  , emdca   , xcoc, ycoc, zcoc, rs)
                  call interpo_fl2cgr_4th_export(omef , omefca  , xcoc, ycoc, zcoc, rs)

                  call interpo_fl2cgr_4th_export(bvxuf, bvxufca , xcoc, ycoc, zcoc, rs)
                  call interpo_fl2cgr_4th_export(bvyuf, bvyufca , xcoc, ycoc, zcoc, rs)
                  call interpo_fl2cgr_4th_export(bvzuf, bvzufca , xcoc, ycoc, zcoc, rs)

                  call interpo_fl2cgr_4th_export(psif , psifca  , xcoc, ycoc, zcoc, rs)
                  call interpo_fl2cgr_4th_export(alphf, alphfca , xcoc, ycoc, zcoc, rs)
               end if

               if (CCTK_EQUALS(coc2cac_rnstype,"MRNS_WL")) then
                  call interpo_fl2cgr_4th_export(utf, utfca , xcoc, ycoc, zcoc, rs)!4vel
                  call interpo_fl2cgr_4th_export(uxf, uxfca , xcoc, ycoc, zcoc, rs)!
                  call interpo_fl2cgr_4th_export(uyf, uyfca , xcoc, ycoc, zcoc, rs)!
                  call interpo_fl2cgr_4th_export(uzf, uzfca , xcoc, ycoc, zcoc, rs)!
                  if (coc2cac_readpot == 1) then
                     call interpo_gr2cgr_4th(  va,   vaca, xcoc, ycoc, zcoc)!potentials
                     call interpo_gr2cgr_4th(vaxd, vaxdca, xcoc, ycoc, zcoc)
                     call interpo_gr2cgr_4th(vayd, vaydca, xcoc, ycoc, zcoc)
                     call interpo_gr2cgr_4th(vazd, vazdca, xcoc, ycoc, zcoc)
                  else if (coc2cac_readpot == 0) then
                     call interpo_gr2cgr_4th(fxd,   fxdca, xcoc, ycoc, zcoc) !Faraday/fields
                     call interpo_gr2cgr_4th(fyd,   fydca, xcoc, ycoc, zcoc)
                     call interpo_gr2cgr_4th(fzd,   fzdca, xcoc, ycoc, zcoc)
                     call interpo_gr2cgr_4th(fxyd, fxydca, xcoc, ycoc, zcoc)
                     call interpo_gr2cgr_4th(fxzd, fxzdca, xcoc, ycoc, zcoc)
                     call interpo_gr2cgr_4th(fyzd, fyzdca, xcoc, ycoc, zcoc)
                  end if
               end if
               
               if ( CCTK_EQUALS(coc2cac_rnstype, "BHT_WL")) then
                  bxcor = bvxuca + omefca*(-ycoc)
                  bycor = bvyuca + omefca*(xcoc)
                  bzcor = bvzuca
               else
                  bxcor = bvxufca + omefca*(-ycoc)
                  bycor = bvyufca + omefca*(xcoc)
                  bzcor = bvzufca
                  psif4ca = psifca**4
               end if
               
               psi4ca = psica**4
               

               if (dabs(emdca) > 1.0d-14) then
                  if (CCTK_EQUALS(coc2cac_rnstype, "RNS_WL") .or. CCTK_EQUALS(coc2cac_rnstype,"RNS_CF")) then
                     vxu = bxcor/alphfca 
                     vyu = bycor/alphfca
                     vzu = bzcor/alphfca
                  else if  (CCTK_EQUALS(coc2cac_rnstype, "BHT_WL")) then
                     vxu = bxcor/alphca
                     vyu = bycor/alphca
                     vzu = bzcor/alphca
                  else if (CCTK_EQUALS(coc2cac_rnstype, "MRNS_WL")) then
                     vxu = (uxfca/utfca + bvxufca)/alphfca     !
                     vyu = (uyfca/utfca + bvyufca)/alphfca     !
                     vzu = (uzfca/utfca + bvzufca)/alphfca     !
                  end if
               else
                  emdca=0.0d0
                  vxu=0.0d0; vyu=0.0d0; vzu=0.0d0
               end if


               
               gxx1 = psi4ca*(1.0d0+hxxdca)
               gxy1 = psi4ca*(0.0d0+hxydca)
               gxz1 = psi4ca*(0.0d0+hxzdca)
               gyy1 = psi4ca*(1.0d0+hyydca)
               gyz1 = psi4ca*(0.0d0+hyzdca)
               gzz1 = psi4ca*(1.0d0+hzzdca)

               kxx1 = psi4ca*kxxca/(radi)
               kxy1 = psi4ca*kxyca/(radi)
               kxz1 = psi4ca*kxzca/(radi)
               kyy1 = psi4ca*kyyca/(radi)
               kyz1 = psi4ca*kyzca/(radi)
               kzz1 = psi4ca*kzzca/(radi)
               if (emdca .ne. emdca) then
                  emdca = 0.0d0 !NaN fixing condition, pray atmospheric reset fixes things afterwards.
               end if

               call peos_q2hprho(emdca, hca, preca, rhoca, eneca)
               !

               if (ns ==1) then
                  if (bool_Bvec) then
                     if (CCTK_EQUALS(coc2cac_rnstype, "MRNS_WL")) then
                        if (coc2cac_readpot == 1) then
                           !Aphi(i,j,k)   = vaca
                           if (cent .eq. 3) then
                              Avecx(i,j,k) = vaxdca
                           end if
                           if (cent .eq. 4) then
                              Avecy(i,j,k) = vaydca
                           end if
                           if (cent .eq. 5) then
                              Avecz(i,j,k) = vazdca
                           end if
                        else if (coc2cac_readpot == 0) then
                           fxd1  = fxdca/radi
                           fyd1  = fydca/radi
                           fzd1  = fzdca/radi
                           fxyd1 = fxydca/radi
                           fxzd1 = fxzdca/radi
                           fyzd1 = fyzdca/radi
                           
                           if (cent .eq. 2) then
                              Bvecx(i,j,k) = fxyd1 ! Probably not right
                              Bvecy(i,j,k) = fxzd1
                              Bvecz(i,j,k) = fyzd1
                           end if
                           
                        end if
                     else 
                        if (cent .eq. 2) then
                           Bvecx(i,j,k) = 0.0d0
                           Bvecy(i,j,k) = 0.0d0
                           Bvecz(i,j,k) = 0.0d0
                        end if
                     end if 
                  end if
            
                    

                  !SET ETK VARIABLES HERE
                  if (bool_lapse) then
                     if (alphca == alphca) then
                        if(cent .eq. 1) then
                           alp(i,j,k) = alphca
                        end if
                     else 
                        if(cent .eq. 1) then
                           alp(i,j,k) = 1.0d0
                        end if
                     end if
                  end if
                 
                  if (bool_shift) then
                     if (bvxdca == bvxdca) then
                        if(cent .eq. 1) then
                           betax(i,j,k) = bvxdca
                        end if
                     else 
                        if(cent .eq. 1) then
                           betax(i,j,k) = 0.0d0
                        end if
                     end if
                     if (bvydca == bvydca) then
                        if(cent .eq. 1) then
                           betay(i,j,k) = bvydca
                        end if
                     else 
                        if(cent .eq. 1) then
                           betay(i,j,k) = 0.0d0
                        end if
                     end if
                     if (bvzdca == bvzdca) then
                        if(cent .eq. 1) then
                           betaz(i,j,k) = bvzdca
                        end if
                     else 
                        if(cent .eq. 1) then
                           betaz(i,j,k) = 0.0d0
                        end if
                     end if
                  end if
                  if (bool_hydro) then
                    if(cent .eq. 2) then
                     rho(i,j,k) = rhoca
                     press(i,j,k) = preca
                     eps(i,j,k) = eneca/rhoca - 1.0d0
                     velx(i,j,k) = vxu
                     vely(i,j,k) = vyu
                     velz(i,j,k) = vzu
                    end if
                  end if


                  if(cent .eq. 1) then
                     gxx(i,j,k) = gxx1
                     gxy(i,j,k) = gxy1
                     gxz(i,j,k) = gxz1
                     gyy(i,j,k) = gyy1
                     gyz(i,j,k) = gyz1
                     gzz(i,j,k) = gzz1
                     !dtalp(i,j,k) = 0.0d0
                     !dtbetax(i,j,k) = 0.0d0
                     !dtbetay(i,j,k) = 0.0d0
                     !dtbetaz(i,j,k) = 0.0d0
                  end if
                  if (gxx1 == gxx1) then
                     continue
                  else 
                     call CCTK_WARN(CCTK_WARN_ABORT, "NaN in gxx")
                  end if 
                  
                  if(cent .eq. 1) then
                     kxx(i,j,k) = kxx1
                     kxy(i,j,k) = kxy1
                     kxz(i,j,k) = kxz1
                     kyy(i,j,k) = kyy1
                     kyz(i,j,k) = kyz1
                     kzz(i,j,k) = kzz1
                  end if
               else if (ns>1) then
                                       !ETK variables set here
                  alphn(i,j,k,l) = alphca
                  betaxdN(i,j,k,l) = bvxdca
                  betaydN(i,j,k,l) = bvydca
                  betazdN(i,j,k,l) = bvzdca

                  rhoN(i,j,k,l) = rhoca
                  pressN(i,j,k,l) = preca
                  epsN(i,j,k,l) = eneca/rhoca - 1.0d0
                  veluxN(i,j,k,l) = vxu
                  veluyN(i,j,k,l) = vyu
                  veluzN(i,j,k,l) = vzu

                  if (CCTK_EQUALS(coc2cac_rnstype, "MRNS_WL")) then

                     BvecuxN(i,j,k,l) = fxyd1 ! Probably not right
                     BvecuyN(i,j,k,l) = fxzd1
                     BvecuzN(i,j,k,l) = fyzd1
                  end if


                  gxxN(i,j,k,l) = gxx1
                  gxyN(i,j,k,l) = gxy1
                  gxzN(i,j,k,l) = gxz1
                  gyyN(i,j,k,l) = gyy1
                  gyzN(i,j,k,l) = gyz1
                  gzzN(i,j,k,l) = gzz1
                  if (gxx1 == gxx1) then
                     continue
                  else 
                     call CCTK_WARN(CCTK_WARN_ABORT, "NaN in gxx")
                  end if 
                  
                  kxxN(i,j,k,l) = kxx1
                  kxyN(i,j,k,l) = kxy1
                  kxzN(i,j,k,l) = kxz1
                  kyyN(i,j,k,l) = kyy1
                  kyzN(i,j,k,l) = kyz1
                  kzzN(i,j,k,l) = kzz1

               end if
               
               end do
            end do
         end do

      if (verbose == 1) then
         call CCTK_INFO("3D Loop 100% Done")
         !call CCTK_INFO("Deallocating....")
      end if 
      ! SAVE variables must not be deallocated
      ! deallocate(  emd);  deallocate( omef);
      ! deallocate( psif);  deallocate(alphf);
      ! deallocate(bvxuf);  deallocate(bvyuf);  deallocate(bvzuf);
      ! deallocate( bvxu);  deallocate( bvyu);  deallocate( bvzu);
      ! deallocate(   rs);
      ! deallocate(  psi);  deallocate( alph);
      ! deallocate( bvxd);  deallocate( bvyd);deallocate( bvzd);  
      ! deallocate( hxxd);  deallocate( hxyd);  deallocate( hxzd);  deallocate( hyyd);
      ! deallocate( hyzd);  deallocate( hzzd);
      ! deallocate( hxxu);  deallocate( hxyu);
      ! deallocate( hxzu);  deallocate( hyyu);  deallocate( hyzu);  deallocate( hzzu);  
      ! deallocate(  kxxa);  deallocate(  kxya);  deallocate(  kxza);  deallocate(  kyya);
      ! deallocate(  kyza);  deallocate(  kzza);

      
      
      if (CCTK_EQUALS(coc2cac_rnstype, "MRNS_WL")) then  
         !deallocate(  utf);  deallocate(  uxf);  deallocate(  uyf);  deallocate(  uzf);!
         if (coc2cac_readpot == 1) then
            ! deallocate(   va);  deallocate( vaxd);  deallocate( vayd);  deallocate( vazd);
         else if (coc2cac_readpot == 0 ) then
            ! deallocate(  fxd);  deallocate(  fyd);  deallocate(  fzd);
            ! deallocate( fxyd);  deallocate( fxzd);  deallocate( fyzd);
         end if
      end if
      !
      if (verbose == 1) then 
         !call CCTK_INFO("Cocal: Done Deallocating...")
      end if
   end do
   if (ns > 1) then
      if (verbose == 1) then 
         call CCTK_INFO("Superimposing multiple solutions onto a single one, weighting by lapse function...")
      end if
      if (bool_lapse) then
        if(cent.eq.1) then
         alp(imin:imax, jmin:jmax, kmin:kmax) = SUM(alphN,4) - 1.0d0*(ns - 1.0d0) ! Whoops, forgot to subtract ns-1
        end if
      end if
      if (bool_shift) then
        if(cent.eq.1) then
         betax(imin:imax, jmin:jmax, kmin:kmax) = SUM(betaxdN,4)
         betay(imin:imax, jmin:jmax, kmin:kmax) = SUM(betaydN,4)
         betaz(imin:imax, jmin:jmax, kmin:kmax) = SUM(betazdN,4)
        end if
      end if

      if (bool_Bvec) then
         if (CCTK_EQUALS(coc2cac_rnstype, "MRNS_WL")) then
           if(cent.eq.2) then
            Bvecx(imin:imax, jmin:jmax, kmin:kmax) = SUM(BvecuxN, 4) ! Probably not right
            Bvecy(imin:imax, jmin:jmax, kmin:kmax) = SUM(BvecuyN, 4)
            Bvecz(imin:imax, jmin:jmax, kmin:kmax) = SUM(BvecuzN, 4)
          end if
         else 
           if(cent.eq.2) then
            Bvecx(imin:imax, jmin:jmax, kmin:kmax) = 0.0d0
            Bvecy(imin:imax, jmin:jmax, kmin:kmax) = 0.0d0
            Bvecz(imin:imax, jmin:jmax, kmin:kmax) = 0.0d0
          end if
         end if
      end if

      if (bool_hydro) then
         if(cent.eq.2) then
            !rho = SUM(rhoN, 4) ! Regular superposition
            rho(imin:imax, jmin:jmax, kmin:kmax) = (alp(imin:imax, jmin:jmax, kmin:kmax)**expnr)*SUM( (alphN**(-expnr))*rhoN, 4) ! Weighted superposition
            press(imin:imax, jmin:jmax, kmin:kmax) = SUM(pressN, 4)
            eps(imin:imax, jmin:jmax, kmin:kmax) = SUM(epsN, 4)
            !vel(:,:,:,1) = SUM(veluxN, 4) !Regular superposition
            !vel(:,:,:,2) = SUM(veluyN, 4) !Regular superposition
            !vel(:,:,:,3) = SUM(veluzN, 4) !Regular superposition
            velx(imin:imax, jmin:jmax, kmin:kmax) = (alp(imin:imax, jmin:jmax, kmin:kmax)**(-expnv))*SUM( (alphN**expnv)*veluxN, 4) !Weighted superposition
            vely(imin:imax, jmin:jmax, kmin:kmax) = (alp(imin:imax, jmin:jmax, kmin:kmax)**(-expnv))*SUM( (alphN**expnv)*veluyN, 4) !Weighted superposition
            velz(imin:imax, jmin:jmax, kmin:kmax) = (alp(imin:imax, jmin:jmax, kmin:kmax)**(-expnv))*SUM( (alphN**expnv)*veluzN, 4) !Weighted superposition
         end if
      end if


      if(cent.eq.1) then
         gxx(imin:imax, jmin:jmax, kmin:kmax) = SUM(gxxN, 4) - 1.0d0*(ns - 1.0d0)
         gxy(imin:imax, jmin:jmax, kmin:kmax) = SUM(gxyN, 4)
         gxz(imin:imax, jmin:jmax, kmin:kmax) = SUM(gxzN, 4)
         gyy(imin:imax, jmin:jmax, kmin:kmax) = SUM(gyyN, 4) - 1.0d0*(ns - 1.0d0)
         gyz(imin:imax, jmin:jmax, kmin:kmax) = SUM(gyzN, 4)
         gzz(imin:imax, jmin:jmax, kmin:kmax) = SUM(gzzN, 4) - 1.0d0*(ns - 1.0d0)
      end if
      if (gxx1 == gxx1) then
         continue
      else 
         call CCTK_WARN(CCTK_WARN_ABORT, "NaN in gxx")
      end if 
      
      if(cent.eq.1) then
         kxx(imin:imax, jmin:jmax, kmin:kmax) = SUM(kxxN,4)
         kxy(imin:imax, jmin:jmax, kmin:kmax) = SUM(kxyN,4)
         kxz(imin:imax, jmin:jmax, kmin:kmax) = SUM(kxzN,4)
         kyy(imin:imax, jmin:jmax, kmin:kmax) = SUM(kyyN,4)
         kyz(imin:imax, jmin:jmax, kmin:kmax) = SUM(kyzN,4)
         kzz(imin:imax, jmin:jmax, kmin:kmax) = SUM(kzzN,4)
      end if

      deallocate(alphN)
      deallocate(betaxdN)
      deallocate(betaydN)
      deallocate(betazdN)
      deallocate(gxxN)
      deallocate(gxyN)
      deallocate(gxzN)
      deallocate(gyyN)
      deallocate(gyzN)
      deallocate(gzzN)
      deallocate(kxxN)
      deallocate(kxyN)
      deallocate(kxzN)
      deallocate(kyyN)
      deallocate(kyzN)
      deallocate(kzzN)
      deallocate(rhoN)
      deallocate(pressN)
      deallocate(epsN)
      deallocate(veluxN)
      deallocate(veluyN)
      deallocate(veluzN)
      deallocate(BvecuxN)
      deallocate(BvecuyN)
      deallocate(BvecuzN)
   end if


! if (coc2cac_copyID == 1) then
!   call CCTK_INFO("Copying Initial Data to Output Directory...")
!   call execute_command_line("cp -r " // trim(dir_path) // " " // trim(cocout_dir) // "/")
! end if
   end do
if (verbose == 1) then
   call CCTK_INFO("Finishing COCAL RNS reader...")
end if

END subroutine coc2cac_rns



!!!BNS ROUTINE NOW
!_____________________________________
 !
 !      MASTER CF BNS COCAL ID READER to CACTUS
 !______________________________________________

SUBROUTINE coc2cac_bns(cctk_lsh, cctk_ash, &
      alp, betax, betay, betaz, &
      gxx, gxy, gxz, gyy, gyz, gzz, &
      kxx, kxy, kxz, kyy, kyz, kzz, &
      rho, eps, press, velx, vely, velz, &
      Bvecx, Bvecy, Bvecz, Avecx, Avecy, Avecz, &
      vcoordx, vcoordy , vcoordz, ccoordx, ccoordy , ccoordz)
 !
   use grid_parameter_binary_excision
   use phys_constant
   use grid_parameter, eps_cocal => eps
   use coordinate_grav_r
   use coordinate_grav_extended
   use interface_modules_cartesian
 !  use interface_calc_gradvep_export
   use trigonometry_grav_phi
   use def_binary_parameter, only : dis
   use def_matter_parameter_mpt
   use interface_interpo_lag4th_2Dsurf
   use interface_IO_input_CF_grav_export
   use interface_IO_input_CF_flir_export !IR
   use interface_IO_input_CF_flco_export !CO
   use interface_IO_input_CF_flsp_export !SP
   use interface_IO_input_CF_surf_export
 !  use interface_excurve_CF_gridpoint_export
   use interface_IO_input_grav_export_Kij
   use interface_interpo_gr2fl_metric_CF_export
   use interface_IO_input_gradvep_export !unique to IR/SP
   use cocal_data_bns
   
   
   

   implicit none

   integer, dimension(3) :: cctk_lsh, cctk_ash
   CCTK_REAL, dimension(cctk_ash(1), cctk_ash(2), cctk_ash(3)) :: &
       alp, betax, betay, betaz, &
       gxx, gxy, gxz, gyy, gyz, gzz, &
       kxx, kxy, kxz, kyy, kyz, kzz
 
   CCTK_REAL, dimension(cctk_ash(1)-1, cctk_ash(2)-1, cctk_ash(3)-1) :: &
       rho, eps, press, velx, vely, velz
 
   CCTK_REAL, dimension(cctk_ash(1)-1, cctk_ash(2)-1, cctk_ash(3)-1) :: &
       Bvecx, Bvecy, Bvecz
 
   CCTK_REAL, dimension(cctk_ash(1)-1, cctk_ash(2), cctk_ash(3)) :: &
       Avecx
   CCTK_REAL, dimension(cctk_ash(1), cctk_ash(2)-1, cctk_ash(3)) :: &
       Avecy
   CCTK_REAL, dimension(cctk_ash(1), cctk_ash(2), cctk_ash(3)-1) :: &
       Avecz
 
   CCTK_REAL, dimension(cctk_ash(1), cctk_ash(2), cctk_ash(3)), target :: &
       vcoordx, vcoordy, vcoordz
 
   CCTK_REAL, dimension(cctk_ash(1)-1, cctk_ash(2)-1, cctk_ash(3)-1), target :: &
       ccoordx, ccoordy, ccoordz

   DECLARE_CCTK_FUNCTIONS
   DECLARE_CCTK_PARAMETERS
   integer :: i, j, k, nx, ny, nz
   integer :: impt, impt_ex, ico, irr, isp, igrid

   logical ::  bool_lapse, bool_shift, bool_hydro, bool_Bvec
   
    
   real(8) :: huta, alphfca2  !unique to IR, SP has this + more
   real(8) :: vepxfca, vepyfca, vepzfca      !Unique to IR/SP
   
   real(8) :: confpow, psifcacp, wxspfca, wyspfca, wzspfca, wdvep, w2, wterm,confpow_p1, confpow_p2 !unique to SP

   real(long) ::  fr4wxspf(4) , ft4wxspf(4) , fp4wxspf(4) !Unique to SP
   real(long) ::  fr4wyspf(4) , ft4wyspf(4) , fp4wyspf(4) !Unique to SP
   real(long) ::  fr4wzspf(4) , ft4wzspf(4) , fp4wzspf(4) !Unique to SP

   real(long) ::  fr4vepxf(4) , ft4vepxf(4) , fp4vepxf(4) !unique to IR/SP
   real(long) ::  fr4vepyf(4) , ft4vepyf(4) , fp4vepyf(4)
   real(long) ::  fr4vepzf(4) , ft4vepzf(4) , fp4vepzf(4)
   
   character(30) :: char1
   character(400) :: outstr
   character(len=1) :: np(5) = (/'1', '2','3', '4', '5'/)
   real(8) :: rrcm, xc,yc,zc, xc_p1, yc_p1, zc_p1, xc_p2, yc_p2, zc_p2
   real(8) :: xc_p3, yc_p3, zc_p3
   real(8) :: xcac, ycac, zcac
   real(8) :: xcoc, ycoc, zcoc
   real(8) :: emdca, vepca, psica, alphca, bvxdca, bvydca, bvzdca, psi4ca, psif4ca
   real(8) :: hca, preca, rhoca, eneca, epsca
   real(8) :: vxu, vyu, vzu, lam_p1, lam_p2 
   real(8) :: bxcor, bycor, bzcor, bvxdfca, bvydfca, bvzdfca, psifca, alphfca
   real(8) :: gxx1, gxy1, gxz1, gyy1, gyz1, gzz1, kxx1, kxy1, kxz1, kyy1, kyz1, kzz1
   real(8) :: axx, axy, axz, ayy, ayz, azz
 !
   real(long) ::  rc_p1, thc_p1, phic_p1, varpic_p1, rcf_p1, rsca_p1
   real(long) ::  rc_p2, thc_p2, phic_p2, varpic_p2, rcf_p2, rsca_p2
   real(long) ::  rc_p3, thc_p3, phic_p3, varpic_p3
   real(long) ::  r4(4), th4(4), phi4(4), fr4(4), ft4(4), fp4(4)
   real(long) ::  fr4psi(4)   , ft4psi(4)   , fp4psi(4)
   real(long) ::  fr4alph(4)  , ft4alph(4)  , fp4alph(4)
   real(long) ::  fr4bvxd(4)  , ft4bvxd(4)  , fp4bvxd(4)
   real(long) ::  fr4bvyd(4)  , ft4bvyd(4)  , fp4bvyd(4)
   real(long) ::  fr4bvzd(4)  , ft4bvzd(4)  , fp4bvzd(4)
   real(long) ::  fr4axx(4)   , ft4axx(4)   , fp4axx(4)
   real(long) ::  fr4axy(4)   , ft4axy(4)   , fp4axy(4)
   real(long) ::  fr4axz(4)   , ft4axz(4)   , fp4axz(4)
   real(long) ::  fr4ayy(4)   , ft4ayy(4)   , fp4ayy(4)
   real(long) ::  fr4ayz(4)   , ft4ayz(4)   , fp4ayz(4)
   real(long) ::  fr4azz(4)   , ft4azz(4)   , fp4azz(4)
   real(long) ::  fr4emd(4)   , ft4emd(4)   , fp4emd(4)
 
   real(long) ::  fr4psif(4)  , ft4psif(4)  , fp4psif(4)
   real(long) ::  fr4alphf(4) , ft4alphf(4) , fp4alphf(4)
   real(long) ::  fr4bvxdf(4) , ft4bvxdf(4) , fp4bvxdf(4)
   real(long) ::  fr4bvydf(4) , ft4bvydf(4) , fp4bvydf(4)
   real(long) ::  fr4bvzdf(4) , ft4bvzdf(4) , fp4bvzdf(4)
 !
   integer :: irg, itg, ipg, irgex, itgex, ipgex
   integer :: ir0, it0, ip0, irg0 , itg0 , ipg0, ii, jj, kk
   real(long), external :: lagint_4th
 !
   integer :: cent
   real(8), pointer :: x(:,:,:), y(:,:,:), z(:,:,:)
   ! 0 -> vertex, 1 -> cell
   integer, parameter, dimension(3,5) :: centering =  reshape( (/0,0,0, 1,1,1, 1,0,0, 0,1,0, 0,0,1/), shape=(/3,5/))
 
   do cent = 1,5
   if (centering(1,cent) .eq. 0) then
     x => vcoordx
   else
     x => ccoordx
   endif
   if (centering(2,cent) .eq. 0) then
     y => vcoordy
   else
     y => ccoordy
   endif
   if (centering(3,cent) .eq. 0) then
     z => vcoordz
   else
     z => ccoordz
   endif
   
   !$OMP critical(coc2cac_bns_read)
   if (.not. have_read_data) then
      if (verbose == 1) then
         call CCTK_INFO("Cocal: Reading data...")
         call CCTK_INFO("Cocal: Reading parameters")
      end if
      call CCTK_FortranString(dir_path_len,coc2cac_dir_path_ID,dir_path)  !For reading initial data

      ierr = read_id_type(trim(dir_path)//"/rnspar_mpt1.dat",id_type)

         ! -- Read ID type
      if (verbose == 1) then
         call CCTK_INFO("COCAL_ID:: Reading BNS Type")
         write(outstr,'(a25,a2)') "COCAL_ID:: BNS Type: ", id_type
         call CCTK_INFO(outstr)
         call CCTK_INFO(trim(id_type))
      end if

      !
      if (ierr.ne.0)     call CCTK_INFO("COCAL_ID:: problem reading file rnspar_mpt1.dat.")
      if (verbose == 1) then 
         select case (trim(id_type))
         case ("CO")
            call CCTK_INFO("COCAL_ID:: Reading corotating BNS ID")
         case ("IR")
            call CCTK_INFO("COCAL_ID:: Reading irrotational BNS ID")
         case ("SP")
            call CCTK_INFO("COCAL_ID:: Reading spinning BNS ID")
         end select
      end if
   !
   ! The coc2cac_ini_sub.F90 subroutine has here option for zero initial shift
   !
      gxx1=0.0d0; gxy1=0.0d0; gxz1=0.0d0; gyy1=0.0d0; gyz1=0.0d0; gzz1=0.0d0
      kxx1=0.0d0; kxy1=0.0d0; kxz1=0.0d0; kyy1=0.0d0; kyz1=0.0d0; kzz1=0.0d0
      axx=0.0d0; axy=0.0d0; axz=0.0d0; ayy=0.0d0; ayz=0.0d0; azz=0.0d0
   
      !TODO remove this
      !dir_path="/home/astro/mundim/tmp/ET_2014_05_wheeler/Cactus/repos/Cocal/standalone/Cocal/ID_BNS"
      !dir_path="../../standalone/Cocal/ID_BNS"
      !dir_path='.'
      if (verbose == 1) then 
         call CCTK_INFO("In coc2cac_ir: dir_path="//dir_path)
      end if 
      call CCTK_FortranString(coc2cac_readformatlen,coc2cac_readformat,coc2cac_readformatf)
   
   !--------------------- Choose gravitational grid -----------------------
   !igrid3  igrid = 3     ! 3:r_surf is used
      igrid = 4     ! 4:r_surf=1.0
   !-----------------------------------------------------------------------

       ! -- Read parameters
      call allocate_grid_parameter_mpt
      call allocate_grid_parameter_binary_excision_mpt
      call allocate_def_matter_parameter_mpt
      do impt = 1, nmpt
         if (verbose == 1) then
            call CCTK_INFO("read_parameter_mpt_cactus")
         end if
         call read_parameter_mpt_cactus(impt,dir_path)
         indata_type = '3D'
         if (verbose ==1) then
            call CCTK_INFO("read_surf_parameter_mpt_cactus")
         end if
         if (impt .le. 2) call read_surf_parameter_mpt_cactus(impt,dir_path)
         call copy_grid_parameter_to_mpt(impt)
         if (verbose == 1) then 
            call CCTK_INFO("read_parameter_binary_excision_mpt_cactus")
         end if
         call read_parameter_binary_excision_mpt_cactus(impt,dir_path)
         call copy_grid_parameter_binary_excision_to_mpt(impt)
         if (verbose == 1) then
            call CCTK_INFO("peos_initialize_mpt_cactus")
         end if
         if (impt .le. 2) call peos_initialize_mpt_cactus(impt,dir_path)
         call copy_def_peos_parameter_to_mpt(impt)
      end do
   
   ! -- Allocate arrays
      if (verbose == 1) then 
         call CCTK_INFO("Cocal: Allocating local arrays...")
      end if
   
      call set_allocate_size_mpt
      call allocate_trig_grav_mphi
      call allocate_trigonometry_grav_phi_mpt
   !
      do impt = 1, nmpt
         call copy_grid_parameter_from_mpt(impt)
         call copy_grid_parameter_binary_excision_from_mpt(impt)
         call copy_def_peos_parameter_from_mpt(impt)
         call coordinate_patch_kit_grav_grid_coc2cac_mpt(igrid)  ! 3:r_surf is used
         call calc_parameter_binary_excision
         call copy_grid_parameter_to_mpt(impt)
         call copy_grid_parameter_binary_excision_to_mpt(impt)
         call copy_coordinate_grav_extended_to_mpt(impt)
         call copy_coordinate_grav_phi_to_mpt(impt)
         call copy_coordinate_grav_r_to_mpt(impt)
         call copy_coordinate_grav_theta_to_mpt(impt)
         call copy_def_binary_parameter_to_mpt(impt)
         call copy_trigonometry_grav_phi_to_mpt(impt)
         call copy_trigonometry_grav_theta_to_mpt(impt)
      end do
      
      if (verbose == 1) then
         call CCTK_INFO("Cocal: Internal reading info (BEGIN):")
      end if
      
      do impt = 1,nmpt
 !=>    call copy_from_mpatch_interpolation_utility(impt)
         call copy_grid_parameter_from_mpt(impt)
         call copy_grid_parameter_binary_excision_from_mpt(impt)
         call copy_coordinate_grav_extended_from_mpt(impt)
         call copy_coordinate_grav_phi_from_mpt(impt)
         call copy_coordinate_grav_r_from_mpt(impt)
         call copy_coordinate_grav_theta_from_mpt(impt)
         call copy_def_binary_parameter_from_mpt(impt)
         call copy_trigonometry_grav_phi_from_mpt(impt)
         call copy_trigonometry_grav_theta_from_mpt(impt)
      
      !    write(6,'(6i5)') nrg, ntg, npg, nrf, ntf, npf
         if (impt==1) then
            nrg_p1=nrg;  ntg_p1=ntg;  npg_p1=npg;  nrf_p1=nrf;  ntf_p1=ntf;  npf_p1=npf
            if (verbose == 1) then 
               call CCTK_INFO("Allocating star1...")
            end if
            allocate (       rg_p1( 0:nnrg))
            allocate (     rgex_p1(-2:nnrg+2))
            allocate (    thgex_p1(-2:nntg+2))
            allocate (   phigex_p1(-2:nnpg+2))
            allocate (  irgex_r_p1(-2:nnrg+2))
            allocate ( itgex_th_p1(-2:nntg+2))
            allocate (ipgex_phi_p1(-2:nnpg+2))
      
            allocate ( itgex_r_p1(0:nntg,-2:nnrg+2))
            allocate ( ipgex_r_p1(0:nnpg,-2:nnrg+2))
            allocate (ipgex_th_p1(0:nnpg,-2:nntg+2))
      
            rg_p1=rg;    rgex_p1=rgex;    thgex_p1=thgex;    phigex_p1=phigex
            irgex_r_p1=irgex_r;  itgex_th_p1=itgex_th;  ipgex_phi_p1=ipgex_phi
            itgex_r_p1=itgex_r;  ipgex_r_p1=ipgex_r;    ipgex_th_p1=ipgex_th
      
            rr3 = 0.7d0*(rgout - rgmid)
            dis_cm = dis
            r_surf_p1 = r_surf
            
      
            allocate (  emd_p1(0:nrf,0:ntf,0:npf))
            select case (trim(id_type))
               case ("IR","SP")
                  allocate (  vep_p1(0:nrf,0:ntf,0:npf)) ! Unique to IR/SP, SP has 3 more
                  allocate (vepxf_p1(0:nrf,0:ntf,0:npf)) ! Unique to IR/SP, SP has 3 more
                  allocate (vepyf_p1(0:nrf,0:ntf,0:npf)) ! Unique to IR/SP, SP has 3 more
                  allocate (vepzf_p1(0:nrf,0:ntf,0:npf)) ! Unique to IR/SP, SP has 3 more
                  vep_p1 =0.0d0;  vepxf_p1=0.0d0;  vepyf_p1=0.0d0;  vepzf_p1=0.0d0 ! Unique to IR/SP, SP has 3 more
                  select case (trim(id_type))
                     case ("SP")
                        allocate (wxspf_p1(0:nrf,0:ntf,0:npf)) ! Unique to SP
                        allocate (wyspf_p1(0:nrf,0:ntf,0:npf)) ! Unique to SP
                        allocate (wzspf_p1(0:nrf,0:ntf,0:npf)) ! Unique to SP
                        wxspf_p1=0.0d0; wyspf_p1=0.0d0; wzspf_p1=0.0d0 ! Unique to SP
                  end select
            end select
            allocate ( psif_p1(0:nrf,0:ntf,0:npf))
            allocate (alphf_p1(0:nrf,0:ntf,0:npf))
            allocate (bvxdf_p1(0:nrf,0:ntf,0:npf))
            allocate (bvydf_p1(0:nrf,0:ntf,0:npf))
            allocate (bvzdf_p1(0:nrf,0:ntf,0:npf))
            allocate (   rs_p1(0:ntf,0:npf))
            allocate (  psi_p1(0:nrg,0:ntg,0:npg))
            allocate ( alph_p1(0:nrg,0:ntg,0:npg))
            allocate ( bvxd_p1(0:nrg,0:ntg,0:npg))
            allocate ( bvyd_p1(0:nrg,0:ntg,0:npg))
            allocate ( bvzd_p1(0:nrg,0:ntg,0:npg))
            allocate (  axx_p1(0:nrg,0:ntg,0:npg))
            allocate (  axy_p1(0:nrg,0:ntg,0:npg))
            allocate (  axz_p1(0:nrg,0:ntg,0:npg))
            allocate (  ayy_p1(0:nrg,0:ntg,0:npg))
            allocate (  ayz_p1(0:nrg,0:ntg,0:npg))
            allocate (  azz_p1(0:nrg,0:ntg,0:npg))
            if (verbose == 1) then 
               call CCTK_INFO("Done allocating star 1...")
         
               write(outstr,'(a13,i1,a8)') "Reading COCP-", impt, " data..."
               call CCTK_INFO(outstr)
            end if 

            
            emd_p1=0.0d0;  rs_p1  =0.0d0;  
            psi_p1=0.0d0;  alph_p1=0.0d0;  bvxd_p1=0.0d0;  bvyd_p1=0.0d0;  bvzd_p1=0.0d0
            axx_p1=0.0d0;  axy_p1 =0.0d0;  axz_p1 =0.0d0;   ayy_p1=0.0d0;   ayz_p1=0.0d0;   azz_p1=0.0d0
      
            call IO_input_CF_grav_export(trim(dir_path)//"/bnsgra_3D_mpt1.las",coc2cac_readformatf,psi_p1,alph_p1,bvxd_p1,bvyd_p1,bvzd_p1)
            select case (trim(id_type))
               case("CO")
                  call IO_input_CF_flco_export(trim(dir_path)//"/bnsflu_3D_mpt1.las",coc2cac_readformatf,emd_p1,ome_p1,ber_p1,radi_p1)
               case("IR")
                  call IO_input_CF_flir_export(trim(dir_path)//"/bnsflu_3D_mpt1.las",coc2cac_readformatf,emd_p1,vep_p1,ome_p1,ber_p1,radi_p1) ! This line changes for IR/CO/SP
               case("SP")
                  call IO_input_CF_flsp_export(trim(dir_path)//"/bnsflu_3D_mpt1.las",coc2cac_readformatf,emd_p1,vep_p1,wxspf_p1,wyspf_p1,wzspf_p1,ome_p1,ber_p1,radi_p1,confpow_p1)
            end select
                  
      
            call IO_input_CF_surf_export(trim(dir_path)//"/bnssur_3D_mpt1.las",coc2cac_readformatf,rs_p1)
      
      !      call excurve_CF_gridpoint_export(alph_p1,bvxd_p1,bvyd_p1,bvzd_p1, axx_p1, axy_p1, axz_p1, ayy_p1, ayz_p1, azz_p1)
      
            call IO_input_grav_export_Kij(trim(dir_path)//"/bnsgra_Kij_3D_mpt1.las", axx_p1, axy_p1, axz_p1, ayy_p1, ayz_p1, azz_p1)
      
            call interpo_gr2fl_metric_CF_export(alph_p1, psi_p1, bvxd_p1, bvyd_p1, bvzd_p1, &
               &    alphf_p1, psif_p1, bvxdf_p1, bvydf_p1, bvzdf_p1, rs_p1)
      
      !      call calc_gradvep_export(vep_p1,vepxf_p1,vepyf_p1,vepzf_p1,rs_p1)

            select case (trim(id_type))
               case ("IR","SP")
                  call IO_input_gradvep_export(trim(dir_path)//"/bnsdvep_3D_mpt1.las",coc2cac_readformatf,  vepxf_p1, vepyf_p1, vepzf_p1) ! Unique to IR/SP
            end select
      
         end if
         if (impt==2) then
            if (verbose == 1) then
               call CCTK_INFO("Allocating star2...")
            end if
            nrg_p2=nrg;  ntg_p2=ntg;  npg_p2=npg;  nrf_p2=nrf;  ntf_p2=ntf;  npf_p2=npf
            allocate (       rg_p2( 0:nnrg))
            allocate (     rgex_p2(-2:nnrg+2))
            allocate (    thgex_p2(-2:nntg+2))
            allocate (   phigex_p2(-2:nnpg+2))
            allocate (  irgex_r_p2(-2:nnrg+2))
            allocate ( itgex_th_p2(-2:nntg+2))
            allocate (ipgex_phi_p2(-2:nnpg+2))
      
            allocate ( itgex_r_p2(0:nntg,-2:nnrg+2))
            allocate ( ipgex_r_p2(0:nnpg,-2:nnrg+2))
            allocate (ipgex_th_p2(0:nnpg,-2:nntg+2))
      
            rg_p2=rg;    rgex_p2=rgex;    thgex_p2=thgex;    phigex_p2=phigex
            irgex_r_p2=irgex_r;  itgex_th_p2=itgex_th;  ipgex_phi_p2=ipgex_phi
            itgex_r_p2=itgex_r;  ipgex_r_p2=ipgex_r;    ipgex_th_p2=ipgex_th
      
            r_surf_p2 = r_surf
            
      
            allocate (  emd_p2(0:nrf,0:ntf,0:npf))
            select case (trim(id_type))
               case ("IR","SP")
                  allocate (  vep_p2(0:nrf,0:ntf,0:npf)) ! Unique to IR/SP, SP has 3 more
                  allocate (vepxf_p2(0:nrf,0:ntf,0:npf)) ! Unique to IR/SP, SP has 3 more
                  allocate (vepyf_p2(0:nrf,0:ntf,0:npf)) ! Unique to IR/SP, SP has 3 more
                  allocate (vepzf_p2(0:nrf,0:ntf,0:npf)) ! Unique to IR/SP, SP has 3 more
                  vep_p2 =0.0d0;  vepxf_p2=0.0d0;  vepyf_p2=0.0d0;  vepzf_p2=0.0d0 ! Unique to IR/SP, SP has 3 more
                  select case (trim(id_type))
                     case ("SP")
                        allocate (wxspf_p2(0:nrf,0:ntf,0:npf)) ! Unique to SP
                        allocate (wyspf_p2(0:nrf,0:ntf,0:npf)) ! Unique to SP
                        allocate (wzspf_p2(0:nrf,0:ntf,0:npf)) ! Unique to SP
                        wxspf_p2=0.0d0; wyspf_p2=0.0d0; wzspf_p2=0.0d0 ! Unique to SP
                  end select
            end select
            allocate ( psif_p2(0:nrf,0:ntf,0:npf))
            allocate (alphf_p2(0:nrf,0:ntf,0:npf))
            allocate (bvxdf_p2(0:nrf,0:ntf,0:npf))
            allocate (bvydf_p2(0:nrf,0:ntf,0:npf))
            allocate (bvzdf_p2(0:nrf,0:ntf,0:npf))
            allocate (   rs_p2(0:ntf,0:npf))
            allocate (  psi_p2(0:nrg,0:ntg,0:npg))
            allocate ( alph_p2(0:nrg,0:ntg,0:npg))
            allocate ( bvxd_p2(0:nrg,0:ntg,0:npg))
            allocate ( bvyd_p2(0:nrg,0:ntg,0:npg))
            allocate ( bvzd_p2(0:nrg,0:ntg,0:npg))
            allocate (  axx_p2(0:nrg,0:ntg,0:npg))
            allocate (  axy_p2(0:nrg,0:ntg,0:npg))
            allocate (  axz_p2(0:nrg,0:ntg,0:npg))
            allocate (  ayy_p2(0:nrg,0:ntg,0:npg))
            allocate (  ayz_p2(0:nrg,0:ntg,0:npg))
            allocate (  azz_p2(0:nrg,0:ntg,0:npg))
            if (verbose == 1) then 
               call CCTK_INFO("Done allocating star 2...")
               write(outstr,'(a13,i1,a8)') "Reading COCP-", impt, " data..."
               call CCTK_INFO(outstr)
            end if

            emd_p2=0.0d0;  rs_p2=0.0d0
            psi_p2=0.0d0;  alph_p2=0.0d0;  bvxd_p2=0.0d0;   bvyd_p2=0.0d0;  bvzd_p2=0.0d0
            axx_p2=0.0d0;   axy_p2=0.0d0;   axz_p2=0.0d0;    ayy_p2=0.0d0;   ayz_p2=0.0d0;   azz_p2=0.0d0
      
            call IO_input_CF_grav_export(trim(dir_path)//"/bnsgra_3D_mpt2.las",coc2cac_readformatf,psi_p2,alph_p2,bvxd_p2,bvyd_p2,bvzd_p2)
      
            select case (trim(id_type))
            case("CO")
               call IO_input_CF_flco_export(trim(dir_path)//"/bnsflu_3D_mpt2.las",coc2cac_readformatf,emd_p2,ome_p2,ber_p2,radi_p2)
            case("IR")
               call IO_input_CF_flir_export(trim(dir_path)//"/bnsflu_3D_mpt2.las",coc2cac_readformatf,emd_p2,vep_p2,ome_p2,ber_p2,radi_p2) ! This line changes for IR/CO/SP
            case("SP")
               call IO_input_CF_flsp_export(trim(dir_path)//"/bnsflu_3D_mpt2.las",coc2cac_readformatf,emd_p2,vep_p2,wxspf_p2,wyspf_p2,wzspf_p2,ome_p2,ber_p2,radi_p2,confpow_p2)
            end select
      
            call IO_input_CF_surf_export(trim(dir_path)//"/bnssur_3D_mpt2.las",coc2cac_readformatf,rs_p2)
      
      !      call excurve_CF_gridpoint_export(alph_p2,bvxd_p2,bvyd_p2,bvzd_p2,  axx_p2, axy_p2, axz_p2, ayy_p2, ayz_p2, azz_p2)
      
            call IO_input_grav_export_Kij(trim(dir_path)//"/bnsgra_Kij_3D_mpt2.las", axx_p2, axy_p2, axz_p2, ayy_p2, ayz_p2, azz_p2)
      
            call interpo_gr2fl_metric_CF_export(alph_p2, psi_p2, bvxd_p2, bvyd_p2, bvzd_p2, &
               &    alphf_p2, psif_p2, bvxdf_p2, bvydf_p2, bvzdf_p2, rs_p2)
      
      !      call calc_gradvep_export(vep_p2,vepxf_p2,vepyf_p2,vepzf_p2,rs_p2)
      
            select case (trim(id_type))
               case ("IR","SP")
                  call IO_input_gradvep_export(trim(dir_path)//"/bnsdvep_3D_mpt2.las",coc2cac_readformatf,  vepxf_p2, vepyf_p2, vepzf_p2) ! Unique to IR/SP
                  vepxf_p2 = - vepxf_p2 ! Unique to IR/SP
                  vepyf_p2 = - vepyf_p2 ! Unique to IR/SP
                  select case (trim(id_type))
                     case ("SP")
                        wxspf_p2 = - wxspf_p2 !unique to SP
                        wyspf_p2 = - wyspf_p2 !unique to SP
                  end select
            end select
            bvxdf_p2 = - bvxdf_p2
            bvydf_p2 = - bvydf_p2
            bvxd_p2  = - bvxd_p2
            bvyd_p2  = - bvyd_p2
            axz_p2   = - axz_p2
            ayz_p2   = - ayz_p2
         end if
         if (impt==3) then
            nrg_p3=nrg;  ntg_p3=ntg;  npg_p3=npg;  nrf_p3=nrf;  ntf_p3=ntf;  npf_p3=npf
            allocate (       rg_p3( 0:nnrg))
            allocate (     rgex_p3(-2:nnrg+2))
            allocate (    thgex_p3(-2:nntg+2))
            allocate (   phigex_p3(-2:nnpg+2))
            allocate (  irgex_r_p3(-2:nnrg+2))
            allocate ( itgex_th_p3(-2:nntg+2))
            allocate (ipgex_phi_p3(-2:nnpg+2))
      
            allocate ( itgex_r_p3(0:nntg,-2:nnrg+2))
            allocate ( ipgex_r_p3(0:nnpg,-2:nnrg+2))
            allocate (ipgex_th_p3(0:nnpg,-2:nntg+2))
      
            rg_p3=rg;    rgex_p3=rgex;    thgex_p3=thgex;    phigex_p3=phigex
            irgex_r_p3=irgex_r;  itgex_th_p3=itgex_th;  ipgex_phi_p3=ipgex_phi
            itgex_r_p3=itgex_r;  ipgex_r_p3=ipgex_r;    ipgex_th_p3=ipgex_th
            if (verbose == 1) then
               write(outstr,'(a13,i1,a8)') "Reading ARCP-", impt, " data..."
               call CCTK_INFO(outstr)
            end if

            allocate ( psi_p3(0:nrg,0:ntg,0:npg))
            allocate (alph_p3(0:nrg,0:ntg,0:npg))
            allocate (bvxd_p3(0:nrg,0:ntg,0:npg))
            allocate (bvyd_p3(0:nrg,0:ntg,0:npg))
            allocate (bvzd_p3(0:nrg,0:ntg,0:npg))
            allocate ( axx_p3(0:nrg,0:ntg,0:npg))
            allocate ( axy_p3(0:nrg,0:ntg,0:npg))
            allocate ( axz_p3(0:nrg,0:ntg,0:npg))
            allocate ( ayy_p3(0:nrg,0:ntg,0:npg))
            allocate ( ayz_p3(0:nrg,0:ntg,0:npg))
            allocate ( azz_p3(0:nrg,0:ntg,0:npg))
            psi_p3=0.0d0;  alph_p3=0.0d0;  bvxd_p3=0.0d0;  bvyd_p3=0.0d0; bvzd_p3=0.0d0
            axx_p3=0.0d0;   axy_p3=0.0d0;   axz_p3=0.0d0;   ayy_p3=0.0d0;  ayz_p3=0.0d0; azz_p3=0.0d0
      
            call IO_input_CF_grav_export(trim(dir_path)//"/bnsgra_3D_mpt3.las",coc2cac_readformatf,psi_p3,alph_p3,bvxd_p3,bvyd_p3,bvzd_p3)
            
            call IO_input_grav_export_Kij(trim(dir_path)//"/bnsgra_Kij_3D_mpt3.las", axx_p3, axy_p3, axz_p3, ayy_p3, ayz_p3, azz_p3)
      
      !      call excurve_CF_gridpoint_export(alph_p3,bvxd_p3,bvyd_p3,bvzd_p3, axx_p3, axy_p3, axz_p3, ayy_p3, ayz_p3, azz_p3)
      
         end if
      end do
      have_read_data = .true.
      call CCTK_INFO("Cocal: Done reading data.")
   end if
   !$OMP END critical(coc2cac_bns_read)
   if (verbose == 1) then
      write(outstr,'(2e20.12)') emd_p1(0,0,0), emd_p1(58,0,0)
      call CCTK_INFO("First and Last emd_p1:"//outstr)
      write(outstr,'(3e20.12)') ome_p1, ber_p1, radi_p1
      call CCTK_INFO("ome_p1, ber_p1, radi_p1:"//outstr)
      write(outstr,'(e20.12)') dis_cm
      call CCTK_INFO("Distance between stars: "//outstr)
 !
      call CCTK_INFO("Cocal: Internal reading info (END).")
      call CCTK_INFO("Cocal: Looping over local cartesian grid:")
   end if
 
   nx = cctk_lsh(1) - centering(1,cent)
   ny = cctk_lsh(2) - centering(2,cent)
   nz = cctk_lsh(3) - centering(3,cent)
   if (CCTK_EQUALS(initial_hydro, "Cocal")) then
      bool_hydro = .true.
    else
      bool_hydro = .false.
    end if
    if (CCTK_EQUALS(initial_lapse, "Cocal")) then
       bool_lapse = .true.
    else
       bool_lapse = .false.
    end if
    if (CCTK_EQUALS(initial_shift, "Cocal")) then
       bool_shift = .true.
    else
       bool_shift = .false.
    end if
    if (CCTK_EQUALS(initial_hydro, "Cocal")) then
       bool_Bvec = .true.
    else
       bool_Bvec = .false.
    end if
 
   ! write(6,'(a56)', ADVANCE = "NO") "Give cartesian coordinates (x,y,z) separated by a space:"
   ! read(5,*) xcac,ycac,zcac
   ! write(6,'(a23,3e20.12)') "Point given wrt CACTUS:", xcac,ycac,zcac
   ! write(6,'(a38,2e20.12)') "Cocal radius scale in COCP-1, COCP-2 :", radi_p1, radi_p2
   ! write(6,'(a38,2e20.12)') "Cocal surface scale in COCP-1, COCP-2:", r_surf_p1, r_surf_p2
   do k = 1, nz
     do j = 1, ny
       do i = 1, nx
         xcac = x(i,j,k)
         ycac = y(i,j,k)
         zcac = z(i,j,k)
         !write(6,*)' i, j, k, xcac, ycac, zcac', i, j, k, xcac, ycac, zcac
         
         xcoc = xcac/(radi_p1)
         ycoc = ycac/(radi_p1)
         zcoc = zcac/(radi_p1)
         ! write(6,'(a23,3e20.12)') "Point given wrt COCAL:", xcoc,ycoc,zcoc     
 
         rrcm = sqrt(xcoc**2 + ycoc**2 + zcoc**2)  
         !write(6,*)  rrcm, rr3
         if (rrcm > rr3) then
       !=>    call copy_from_mpatch_interpolation_utility(3)
       !    call copy_grid_parameter_from_mpt(3)
       !    call copy_grid_parameter_binary_excision_from_mpt(3)
       !    call copy_coordinate_grav_extended_from_mpt(3)
       !    call copy_coordinate_grav_phi_from_mpt(3)
       !    call copy_coordinate_grav_r_from_mpt(3)
       !    call copy_coordinate_grav_theta_from_mpt(3)
       !    call copy_def_binary_parameter_from_mpt(3)
       !    call copy_trigonometry_grav_phi_from_mpt(3)
       !    call copy_trigonometry_grav_theta_from_mpt(3)
 
           xc_p3 = xcoc
           yc_p3 = ycoc
           zc_p3 = zcoc
         !   write(outstr,'(a39,3e20.12)') "Point given wrt COCP-3 in Cocal scale :", xc_p3,yc_p3,zc_p3
         !   call CCTK_INFO(outstr)
 
           psica=0.0d0; alphca=0.0d0; bvxdca=0.0d0; bvydca=0.0d0; bvzdca=0.0d0
           axx=0.0d0  ; axy=0.0d0   ; axz=0.0d0   ; ayy=0.0d0   ; ayz=0.0d0   ; azz=0.0d0
       !
           rc_p3     = dsqrt(dabs(xc_p3**2 + yc_p3**2 + zc_p3**2))
           varpic_p3 = dsqrt(dabs(xc_p3**2 + yc_p3**2))
           thc_p3  = dmod(2.0d0*pi + datan2(varpic_p3,zc_p3),2.0d0*pi)
           phic_p3 = dmod(2.0d0*pi + datan2(    yc_p3,xc_p3),2.0d0*pi)
       !
           do irg = 0, nrg_p3+1
             if (rc_p3.lt.rgex_p3(irg).and.rc_p3.ge.rgex_p3(irg-1)) ir0 = min0(irg-2,nrg_p3-3)
           end do
           do itg = 0, ntg_p3+1
             if (thc_p3.lt.thgex_p3(itg).and.thc_p3.ge.thgex_p3(itg-1)) it0 = itg-2
           end do
           do ipg = 0, npg_p3+1
             if (phic_p3.lt.phigex_p3(ipg).and.phic_p3.ge.phigex_p3(ipg-1)) ip0 = ipg-2
           end do
       !
           do ii = 1, 4
             irg0 = ir0 + ii - 1
             itg0 = it0 + ii - 1
             ipg0 = ip0 + ii - 1
             r4(ii) = rgex_p3(irg0)
             th4(ii) = thgex_p3(itg0)
             phi4(ii) = phigex_p3(ipg0)
           end do
       !
           do kk = 1, 4
             ipg0 = ip0 + kk - 1
             do jj = 1, 4
               itg0 = it0 + jj - 1
               do ii = 1, 4
                 irg0 = ir0 + ii - 1
                 irgex = irgex_r_p3(irg0)
                 itgex = itgex_r_p3(itgex_th_p3(itg0),irg0)
                 ipgex = ipgex_r_p3(ipgex_th_p3(ipgex_phi_p3(ipg0),itg0),irg0)
                 fr4psi(ii)  =  psi_p3(irgex,itgex,ipgex)
                 fr4alph(ii) = alph_p3(irgex,itgex,ipgex)
                 fr4bvxd(ii) = bvxd_p3(irgex,itgex,ipgex)
                 fr4bvyd(ii) = bvyd_p3(irgex,itgex,ipgex)
                 fr4bvzd(ii) = bvzd_p3(irgex,itgex,ipgex)
                 fr4axx(ii)  =  axx_p3(irgex,itgex,ipgex)
                 fr4axy(ii)  =  axy_p3(irgex,itgex,ipgex)
                 fr4axz(ii)  =  axz_p3(irgex,itgex,ipgex)
                 fr4ayy(ii)  =  ayy_p3(irgex,itgex,ipgex)
                 fr4ayz(ii)  =  ayz_p3(irgex,itgex,ipgex)
                 fr4azz(ii)  =  azz_p3(irgex,itgex,ipgex)
               end do
               ft4psi(jj)  = lagint_4th(r4,fr4psi ,rc_p3)
               ft4alph(jj) = lagint_4th(r4,fr4alph,rc_p3)
               ft4bvxd(jj) = lagint_4th(r4,fr4bvxd,rc_p3)
               ft4bvyd(jj) = lagint_4th(r4,fr4bvyd,rc_p3)
               ft4bvzd(jj) = lagint_4th(r4,fr4bvzd,rc_p3)
               ft4axx(jj)  = lagint_4th(r4,fr4axx ,rc_p3)
               ft4axy(jj)  = lagint_4th(r4,fr4axy ,rc_p3)
               ft4axz(jj)  = lagint_4th(r4,fr4axz ,rc_p3)
               ft4ayy(jj)  = lagint_4th(r4,fr4ayy ,rc_p3)
               ft4ayz(jj)  = lagint_4th(r4,fr4ayz ,rc_p3)
               ft4azz(jj)  = lagint_4th(r4,fr4azz ,rc_p3)
             end do
             fp4psi(kk)  = lagint_4th(th4,ft4psi ,thc_p3)
             fp4alph(kk) = lagint_4th(th4,ft4alph,thc_p3)
             fp4bvxd(kk) = lagint_4th(th4,ft4bvxd,thc_p3)
             fp4bvyd(kk) = lagint_4th(th4,ft4bvyd,thc_p3)
             fp4bvzd(kk) = lagint_4th(th4,ft4bvzd,thc_p3)
             fp4axx(kk)  = lagint_4th(th4,ft4axx ,thc_p3)
             fp4axy(kk)  = lagint_4th(th4,ft4axy ,thc_p3)
             fp4axz(kk)  = lagint_4th(th4,ft4axz ,thc_p3)
             fp4ayy(kk)  = lagint_4th(th4,ft4ayy ,thc_p3)
             fp4ayz(kk)  = lagint_4th(th4,ft4ayz ,thc_p3)
             fp4azz(kk)  = lagint_4th(th4,ft4azz ,thc_p3)
           end do
           psica  = lagint_4th(phi4,fp4psi ,phic_p3)
           alphca = lagint_4th(phi4,fp4alph,phic_p3)
           bvxdca = lagint_4th(phi4,fp4bvxd,phic_p3)
           bvydca = lagint_4th(phi4,fp4bvyd,phic_p3)
           bvzdca = lagint_4th(phi4,fp4bvzd,phic_p3)
           axx    = lagint_4th(phi4,fp4axx ,phic_p3)
           axy    = lagint_4th(phi4,fp4axy ,phic_p3)
           axz    = lagint_4th(phi4,fp4axz ,phic_p3)
           ayy    = lagint_4th(phi4,fp4ayy ,phic_p3)
           ayz    = lagint_4th(phi4,fp4ayz ,phic_p3)
           azz    = lagint_4th(phi4,fp4azz ,phic_p3)
 
           psi4ca = psica**4
           vxu = 0.0d0
           vyu = 0.0d0
           vzu = 0.0d0
           emdca = 0.0d0
         else
           if (xcoc<=0.0d0) then
       !=>      call copy_from_mpatch_interpolation_utility(1)
       !      call copy_grid_parameter_from_mpt(1)
       !      call copy_grid_parameter_binary_excision_from_mpt(1)
       !      call copy_coordinate_grav_extended_from_mpt(1)
       !      call copy_coordinate_grav_phi_from_mpt(1)
       !      call copy_coordinate_grav_r_from_mpt(1)
       !      call copy_coordinate_grav_theta_from_mpt(1)
       !      call copy_def_binary_parameter_from_mpt(1)
       !      call copy_trigonometry_grav_phi_from_mpt(1)
       !      call copy_trigonometry_grav_theta_from_mpt(1)
 
             xc_p1 = xcoc + dis_cm
             yc_p1 = ycoc
             zc_p1 = zcoc
            !  write(6,'(a39,3e20.12)') "Point given wrt COCP-1 in Cocal scale :", xc_p1,yc_p1,zc_p1  
       !
             psica=0.0d0; alphca=0.0d0; bvxdca=0.0d0; bvydca=0.0d0; bvzdca=0.0d0
             axx=0.0d0  ; axy=0.0d0   ; axz=0.0d0   ; ayy=0.0d0   ; ayz=0.0d0   ; azz=0.0d0
       !
             rc_p1     = dsqrt(dabs(xc_p1**2 + yc_p1**2 + zc_p1**2))
             varpic_p1 = dsqrt(dabs(xc_p1**2 + yc_p1**2))
             thc_p1  = dmod(2.0d0*pi + datan2(varpic_p1,zc_p1),2.0d0*pi)
             phic_p1 = dmod(2.0d0*pi + datan2(    yc_p1,xc_p1),2.0d0*pi)
       !
             do irg = 0, nrg_p1+1
               if (rc_p1.lt.rgex_p1(irg).and.rc_p1.ge.rgex_p1(irg-1)) ir0 = min0(irg-2,nrg_p1-3)
             end do
             do itg = 0, ntg_p1+1
               if (thc_p1.lt.thgex_p1(itg).and.thc_p1.ge.thgex_p1(itg-1)) it0 = itg-2
             end do
             do ipg = 0, npg_p1+1
               if (phic_p1.lt.phigex_p1(ipg).and.phic_p1.ge.phigex_p1(ipg-1)) ip0 = ipg-2
             end do
       !
       !      write(6,*) "(ir0,it0,ip0)=", ir0,it0,ip0
 
             do ii = 1, 4
               irg0 = ir0 + ii - 1
               itg0 = it0 + ii - 1
               ipg0 = ip0 + ii - 1
               r4(ii) = rgex_p1(irg0)
               th4(ii) = thgex_p1(itg0)
               phi4(ii) = phigex_p1(ipg0)
             end do
       !
             do kk = 1, 4
               ipg0 = ip0 + kk - 1
               do jj = 1, 4
                 itg0 = it0 + jj - 1
                 do ii = 1, 4
                   irg0 = ir0 + ii - 1
                   irgex = irgex_r_p1(irg0)
                   itgex = itgex_r_p1(itgex_th_p1(itg0),irg0)
                   ipgex = ipgex_r_p1(ipgex_th_p1(ipgex_phi_p1(ipg0),itg0),irg0)
                   fr4psi(ii)  =  psi_p1(irgex,itgex,ipgex)
                   fr4alph(ii) = alph_p1(irgex,itgex,ipgex)
                   fr4bvxd(ii) = bvxd_p1(irgex,itgex,ipgex)
                   fr4bvyd(ii) = bvyd_p1(irgex,itgex,ipgex)
                   fr4bvzd(ii) = bvzd_p1(irgex,itgex,ipgex)
                   fr4axx(ii)  =  axx_p1(irgex,itgex,ipgex)
                   fr4axy(ii)  =  axy_p1(irgex,itgex,ipgex)
                   fr4axz(ii)  =  axz_p1(irgex,itgex,ipgex)
                   fr4ayy(ii)  =  ayy_p1(irgex,itgex,ipgex)
                   fr4ayz(ii)  =  ayz_p1(irgex,itgex,ipgex)
                   fr4azz(ii)  =  azz_p1(irgex,itgex,ipgex)
                 end do
                 ft4psi(jj)  = lagint_4th(r4,fr4psi ,rc_p1)
                 ft4alph(jj) = lagint_4th(r4,fr4alph,rc_p1)
                 ft4bvxd(jj) = lagint_4th(r4,fr4bvxd,rc_p1)
                 ft4bvyd(jj) = lagint_4th(r4,fr4bvyd,rc_p1)
                 ft4bvzd(jj) = lagint_4th(r4,fr4bvzd,rc_p1)
                 ft4axx(jj)  = lagint_4th(r4,fr4axx ,rc_p1)
                 ft4axy(jj)  = lagint_4th(r4,fr4axy ,rc_p1)
                 ft4axz(jj)  = lagint_4th(r4,fr4axz ,rc_p1)
                 ft4ayy(jj)  = lagint_4th(r4,fr4ayy ,rc_p1)
                 ft4ayz(jj)  = lagint_4th(r4,fr4ayz ,rc_p1)
                 ft4azz(jj)  = lagint_4th(r4,fr4azz ,rc_p1)
               end do
               fp4psi(kk)  = lagint_4th(th4,ft4psi ,thc_p1)
               fp4alph(kk) = lagint_4th(th4,ft4alph,thc_p1)
               fp4bvxd(kk) = lagint_4th(th4,ft4bvxd,thc_p1)
               fp4bvyd(kk) = lagint_4th(th4,ft4bvyd,thc_p1)
               fp4bvzd(kk) = lagint_4th(th4,ft4bvzd,thc_p1)
               fp4axx(kk)  = lagint_4th(th4,ft4axx ,thc_p1)
               fp4axy(kk)  = lagint_4th(th4,ft4axy ,thc_p1)
               fp4axz(kk)  = lagint_4th(th4,ft4axz ,thc_p1)
               fp4ayy(kk)  = lagint_4th(th4,ft4ayy ,thc_p1)
               fp4ayz(kk)  = lagint_4th(th4,ft4ayz ,thc_p1)
               fp4azz(kk)  = lagint_4th(th4,ft4azz ,thc_p1)
             end do
             psica  = lagint_4th(phi4,fp4psi ,phic_p1)
             alphca = lagint_4th(phi4,fp4alph,phic_p1)
             bvxdca = lagint_4th(phi4,fp4bvxd,phic_p1)
             bvydca = lagint_4th(phi4,fp4bvyd,phic_p1)
             bvzdca = lagint_4th(phi4,fp4bvzd,phic_p1)
             axx    = lagint_4th(phi4,fp4axx ,phic_p1)
             axy    = lagint_4th(phi4,fp4axy ,phic_p1)
             axz    = lagint_4th(phi4,fp4axz ,phic_p1)
             ayy    = lagint_4th(phi4,fp4ayy ,phic_p1)
             ayz    = lagint_4th(phi4,fp4ayz ,phic_p1)
             azz    = lagint_4th(phi4,fp4azz ,phic_p1)
 
             psi4ca = psica**4
       !      write(6,*) axx,axy,axz,ayy,ayz,azz
 
             call interpo_lag4th_2Dsurf(rsca_p1,rs_p1,thc_p1,phic_p1)
             rcf_p1 = rc_p1/rsca_p1
       !
             if (rcf_p1.le.rg_p1(nrf_p1)) then
               do irg = 0, nrf_p1+1
                 if (rcf_p1.lt.rgex_p1(irg).and.rcf_p1.ge.rgex_p1(irg-1)) ir0 = min0(irg-2,nrf_p1-3)
               end do
       !
               do ii = 1, 4
                 irg0 = ir0 + ii - 1
                 r4(ii) = rgex_p1(irg0)
               end do
       !
               do kk = 1, 4
                 ipg0 = ip0 + kk - 1
                 do jj = 1, 4
                   itg0 = it0 + jj - 1
                   do ii = 1, 4
                     irg0 = ir0 + ii - 1
                     irgex = irgex_r_p1(irg0)
                     itgex = itgex_r_p1(itgex_th_p1(itg0),irg0)
                     ipgex = ipgex_r_p1(ipgex_th_p1(ipgex_phi_p1(ipg0),itg0),irg0)
                     fr4emd(ii)   =   emd_p1(irgex,itgex,ipgex)
                     select case (trim(id_type))
                        case ("IR","SP")
                          fr4vepxf(ii) = vepxf_p1(irgex,itgex,ipgex) !Unique to IR/SP, SP has 3 more
                          fr4vepyf(ii) = vepyf_p1(irgex,itgex,ipgex) !Unique to IR/SP, SP has 3 more
                          fr4vepzf(ii) = vepzf_p1(irgex,itgex,ipgex) !Unique to IR/SP, SP has 3 more
                          select case (trim(id_type))
                          case ("SP")
                              fr4wxspf(ii) = wxspf_p1(irgex,itgex,ipgex)
                              fr4wyspf(ii) = wyspf_p1(irgex,itgex,ipgex)
                              fr4wzspf(ii) = wzspf_p1(irgex,itgex,ipgex)
                          end select
                     end select
                     
 
                     fr4psif(ii)  =  psif_p1(irgex,itgex,ipgex)
                     fr4alphf(ii) = alphf_p1(irgex,itgex,ipgex)
                     fr4bvxdf(ii) = bvxdf_p1(irgex,itgex,ipgex)
                     fr4bvydf(ii) = bvydf_p1(irgex,itgex,ipgex)
                     fr4bvzdf(ii) = bvzdf_p1(irgex,itgex,ipgex)
                   end do
                   ft4emd(jj)   = lagint_4th(r4,fr4emd  ,rcf_p1)
                   select case (trim(id_type))
                      case ("IR","SP")
                        ft4vepxf(jj) = lagint_4th(r4,fr4vepxf,rcf_p1) !Unique to IR, SP has 3 more
                        ft4vepyf(jj) = lagint_4th(r4,fr4vepyf,rcf_p1) !Unique to IR, SP has 3 more
                        ft4vepzf(jj) = lagint_4th(r4,fr4vepzf,rcf_p1) !Unique to IR, SP has 3 more
                      select case (trim(id_type))
                        case ("SP")
                          ft4wxspf(jj) = lagint_4th(r4,fr4wxspf,rcf_p1)
                          ft4wyspf(jj) = lagint_4th(r4,fr4wyspf,rcf_p1)
                          ft4wzspf(jj) = lagint_4th(r4,fr4wzspf,rcf_p1)
                      end select
                   end select
                   
 
                   ft4psif(jj)  = lagint_4th(r4,fr4psif ,rcf_p1)
                   ft4alphf(jj) = lagint_4th(r4,fr4alphf,rcf_p1)
                   ft4bvxdf(jj) = lagint_4th(r4,fr4bvxdf,rcf_p1)
                   ft4bvydf(jj) = lagint_4th(r4,fr4bvydf,rcf_p1)
                   ft4bvzdf(jj) = lagint_4th(r4,fr4bvzdf,rcf_p1)
                 end do
                 fp4emd(kk)   = lagint_4th(th4,ft4emd  ,thc_p1)
                 select case (trim(id_type))
                    case ("IR","SP")
                      fp4vepxf(kk) = lagint_4th(th4,ft4vepxf,thc_p1) !Unique to iR, SP has 3 more
                      fp4vepyf(kk) = lagint_4th(th4,ft4vepyf,thc_p1) !Unique to iR, SP has 3 more
                      fp4vepzf(kk) = lagint_4th(th4,ft4vepzf,thc_p1) !Unique to iR, SP has 3 more
                      select case (trim(id_type))
                        case ("SP")
                          fp4wxspf(kk) = lagint_4th(th4,ft4wxspf,thc_p1)
                          fp4wyspf(kk) = lagint_4th(th4,ft4wyspf,thc_p1)
                          fp4wzspf(kk) = lagint_4th(th4,ft4wzspf,thc_p1)
                      end select
                  end select
                 
 
                 fp4psif(kk)  = lagint_4th(th4,ft4psif ,thc_p1)
                 fp4alphf(kk) = lagint_4th(th4,ft4alphf,thc_p1)
                 fp4bvxdf(kk) = lagint_4th(th4,ft4bvxdf,thc_p1)
                 fp4bvydf(kk) = lagint_4th(th4,ft4bvydf,thc_p1)
                 fp4bvzdf(kk) = lagint_4th(th4,ft4bvzdf,thc_p1)
               end do
               emdca   = lagint_4th(phi4,fp4emd  ,phic_p1)

               select case (trim(id_type))
                  case ("IR","SP")
                    vepxfca = lagint_4th(phi4,fp4vepxf,phic_p1) !Unique to IR, SP has 3 more
                    vepyfca = lagint_4th(phi4,fp4vepyf,phic_p1) !Unique to IR, SP has 3 more
                    vepzfca = lagint_4th(phi4,fp4vepzf,phic_p1) !Unique to IR, SP has 3 more
                    select case (trim(id_type))
                      case ("SP")
                        wxspfca = lagint_4th(phi4,fp4wxspf,phic_p1)
                        wyspfca = lagint_4th(phi4,fp4wyspf,phic_p1)
                        wzspfca = lagint_4th(phi4,fp4wzspf,phic_p1)
                    end select
               end select
 
               psifca  = lagint_4th(phi4,fp4psif ,phic_p1)
               alphfca = lagint_4th(phi4,fp4alphf,phic_p1)
               bvxdfca = lagint_4th(phi4,fp4bvxdf,phic_p1)
               bvydfca = lagint_4th(phi4,fp4bvydf,phic_p1)
               bvzdfca = lagint_4th(phi4,fp4bvzdf,phic_p1)
       !
               psif4ca  = psifca**4
               select case (trim(id_type))
                  case ("IR","SP")
                    alphfca2 = alphfca**2 !Unique to IR, SP has 1 more line here
                    select case (trim(id_type))
                      case ("SP")
                        psifcacp = psifca**confpow_p1
                    end select
               end select
            
 
               bxcor   = bvxdfca + ome_p1*(-ycoc)
               bycor   = bvydfca + ome_p1*(xcoc)
               bzcor   = bvzdfca
               

               select case (trim(id_type))
                  case ("CO")
                    vxu = bxcor/alphfca
                    vyu = bycor/alphfca
                    vzu = bzcor/alphfca
                  case ("IR")
                    lam_p1  = ber_p1 + bxcor*vepxfca + bycor*vepyfca + bzcor*vepzfca !Unique to IR/SP, SP has 3 more lines here
                    huta = lam_p1/alphfca !Unique to IR/SP, differening expressions

                    vxu = (vepxfca/psif4ca )/huta !IR/CO/SP differernt expressions
                    vyu = (vepyfca/psif4ca )/huta !IR/CO/SP differernt expressions
                    vzu = (vepzfca/psif4ca )/huta !IR/CO/SP differernt expressions
                  case ("SP")
                    lam_p1  = ber_p1 + bxcor*vepxfca + bycor*vepyfca + bzcor*vepzfca !Unique to IR/SP, SP has 3 more lines here
                    wdvep   = (wxspfca*vepxfca + wyspfca*vepyfca + wzspfca*vepzfca)*psifcacp
                    w2      = psif4ca*(wxspfca*wxspfca + wyspfca*wyspfca + wzspfca*wzspfca)*psifcacp**2.0d0
                    wterm   = wdvep + w2 !wdvep = 0 then huta_sp = huta_ir
                    huta = (lam_p1 + sqrt(lam_p1*lam_p1 + 4.0d0*alphfca2*wterm))/(2.0d0*alphfca)

                    vxu = (vepxfca/psif4ca + psifcacp*wxspfca)/huta
                    vyu = (vepyfca/psif4ca + psifcacp*wyspfca)/huta
                    vzu = (vepzfca/psif4ca + psifcacp*wzspfca)/huta
               end select
 
            
             else
               vepxfca=0.0d0; vepyfca=0.0d0; vepzfca=0.0d0 !Unique to IR/SP
               emdca=0.0d0;
               vxu=0.0d0; vyu=0.0d0; vzu=0.0d0
             end if
           else
       !=>      call copy_from_mpatch_interpolation_utility(2)
       !      call copy_grid_parameter_from_mpt(2)
       !      call copy_grid_parameter_binary_excision_from_mpt(2)
       !      call copy_coordinate_grav_extended_from_mpt(2)
       !      call copy_coordinate_grav_phi_from_mpt(2)
       !      call copy_coordinate_grav_r_from_mpt(2)
       !      call copy_coordinate_grav_theta_from_mpt(2)
       !      call copy_def_binary_parameter_from_mpt(2)
       !      call copy_trigonometry_grav_phi_from_mpt(2)
       !      call copy_trigonometry_grav_theta_from_mpt(2)
 
             xc_p2 = -(xcoc - dis_cm)
             yc_p2 = -ycoc
             zc_p2 =  zcoc
            !  write(6,'(a39,3e20.12)') "Point given wrt COCP-2 in Cocal scale :", xc_p2,yc_p2,zc_p2
       !
             psica=0.0d0; alphca=0.0d0; bvxdca=0.0d0; bvydca=0.0d0; bvzdca=0.0d0
             axx=0.0d0  ; axy=0.0d0   ; axz=0.0d0   ; ayy=0.0d0   ; ayz=0.0d0   ; azz=0.0d0
       !
             rc_p2     = dsqrt(dabs(xc_p2**2 + yc_p2**2 + zc_p2**2))
             varpic_p2 = dsqrt(dabs(xc_p2**2 + yc_p2**2))
             thc_p2  = dmod(2.0d0*pi + datan2(varpic_p2,zc_p2),2.0d0*pi)
             phic_p2 = dmod(2.0d0*pi + datan2(    yc_p2,xc_p2),2.0d0*pi)
       !
             do irg = 0, nrg_p2+1
               if (rc_p2.lt.rgex_p2(irg).and.rc_p2.ge.rgex_p2(irg-1)) ir0 = min0(irg-2,nrg_p2-3)
             end do
             do itg = 0, ntg_p2+1
               if (thc_p2.lt.thgex_p2(itg).and.thc_p2.ge.thgex_p2(itg-1)) it0 = itg-2
             end do
             do ipg = 0, npg_p2+1
               if (phic_p2.lt.phigex_p2(ipg).and.phic_p2.ge.phigex_p2(ipg-1)) ip0 = ipg-2
             end do
       !
             do ii = 1, 4
               irg0 = ir0 + ii - 1
               itg0 = it0 + ii - 1
               ipg0 = ip0 + ii - 1
               r4(ii) = rgex_p2(irg0)
               th4(ii) = thgex_p2(itg0)
               phi4(ii) = phigex_p2(ipg0)
             end do
       !
             do kk = 1, 4
               ipg0 = ip0 + kk - 1
               do jj = 1, 4
                 itg0 = it0 + jj - 1
                 do ii = 1, 4
                   irg0 = ir0 + ii - 1
                   irgex = irgex_r_p2(irg0)
                   itgex = itgex_r_p2(itgex_th_p2(itg0),irg0)
                   ipgex = ipgex_r_p2(ipgex_th_p2(ipgex_phi_p2(ipg0),itg0),irg0)
                   fr4psi(ii)  =  psi_p2(irgex,itgex,ipgex)
                   fr4alph(ii) = alph_p2(irgex,itgex,ipgex)
                   fr4bvxd(ii) = bvxd_p2(irgex,itgex,ipgex)
                   fr4bvyd(ii) = bvyd_p2(irgex,itgex,ipgex)
                   fr4bvzd(ii) = bvzd_p2(irgex,itgex,ipgex)
                   fr4axx(ii)  =  axx_p2(irgex,itgex,ipgex)
                   fr4axy(ii)  =  axy_p2(irgex,itgex,ipgex)
                   fr4axz(ii)  =  axz_p2(irgex,itgex,ipgex)
                   fr4ayy(ii)  =  ayy_p2(irgex,itgex,ipgex)
                   fr4ayz(ii)  =  ayz_p2(irgex,itgex,ipgex)
                   fr4azz(ii)  =  azz_p2(irgex,itgex,ipgex)
                 end do
                 ft4psi(jj)  = lagint_4th(r4,fr4psi ,rc_p2)
                 ft4alph(jj) = lagint_4th(r4,fr4alph,rc_p2)
                 ft4bvxd(jj) = lagint_4th(r4,fr4bvxd,rc_p2)
                 ft4bvyd(jj) = lagint_4th(r4,fr4bvyd,rc_p2)
                 ft4bvzd(jj) = lagint_4th(r4,fr4bvzd,rc_p2)
                 ft4axx(jj)  = lagint_4th(r4,fr4axx ,rc_p2)
                 ft4axy(jj)  = lagint_4th(r4,fr4axy ,rc_p2)
                 ft4axz(jj)  = lagint_4th(r4,fr4axz ,rc_p2)
                 ft4ayy(jj)  = lagint_4th(r4,fr4ayy ,rc_p2)
                 ft4ayz(jj)  = lagint_4th(r4,fr4ayz ,rc_p2)
                 ft4azz(jj)  = lagint_4th(r4,fr4azz ,rc_p2)
               end do
               fp4psi(kk)  = lagint_4th(th4,ft4psi ,thc_p2)
               fp4alph(kk) = lagint_4th(th4,ft4alph,thc_p2)
               fp4bvxd(kk) = lagint_4th(th4,ft4bvxd,thc_p2)
               fp4bvyd(kk) = lagint_4th(th4,ft4bvyd,thc_p2)
               fp4bvzd(kk) = lagint_4th(th4,ft4bvzd,thc_p2)
               fp4axx(kk)  = lagint_4th(th4,ft4axx ,thc_p2)
               fp4axy(kk)  = lagint_4th(th4,ft4axy ,thc_p2)
               fp4axz(kk)  = lagint_4th(th4,ft4axz ,thc_p2)
               fp4ayy(kk)  = lagint_4th(th4,ft4ayy ,thc_p2)
               fp4ayz(kk)  = lagint_4th(th4,ft4ayz ,thc_p2)
               fp4azz(kk)  = lagint_4th(th4,ft4azz ,thc_p2)
             end do
             psica  = lagint_4th(phi4,fp4psi ,phic_p2)
             alphca = lagint_4th(phi4,fp4alph,phic_p2)
             bvxdca = lagint_4th(phi4,fp4bvxd,phic_p2)
             bvydca = lagint_4th(phi4,fp4bvyd,phic_p2)
             bvzdca = lagint_4th(phi4,fp4bvzd,phic_p2)
             axx    = lagint_4th(phi4,fp4axx ,phic_p2)
             axy    = lagint_4th(phi4,fp4axy ,phic_p2)
             axz    = lagint_4th(phi4,fp4axz ,phic_p2)
             ayy    = lagint_4th(phi4,fp4ayy ,phic_p2)
             ayz    = lagint_4th(phi4,fp4ayz ,phic_p2)
             azz    = lagint_4th(phi4,fp4azz ,phic_p2)
 
             psi4ca = psica**4
             call interpo_lag4th_2Dsurf(rsca_p2,rs_p2,thc_p2,phic_p2)
             rcf_p2 = rc_p2/rsca_p2
       !
             if (rcf_p2.le.rg_p2(nrf_p2)) then
               do irg = 0, nrf_p2+1
                 if (rcf_p2.lt.rgex_p2(irg).and.rcf_p2.ge.rgex_p2(irg-1)) ir0 = min0(irg-2,nrf_p2-3)
               end do
       !
               do ii = 1, 4
                 irg0 = ir0 + ii - 1
                 r4(ii) = rgex_p2(irg0)
               end do
       !
               do kk = 1, 4
                 ipg0 = ip0 + kk - 1
                 do jj = 1, 4
                   itg0 = it0 + jj - 1
                   do ii = 1, 4
                     irg0 = ir0 + ii - 1
                     irgex = irgex_r_p2(irg0)
                     itgex = itgex_r_p2(itgex_th_p2(itg0),irg0)
                     ipgex = ipgex_r_p2(ipgex_th_p2(ipgex_phi_p2(ipg0),itg0),irg0)
                     fr4emd(ii)   =   emd_p2(irgex,itgex,ipgex)
                     select case (trim(id_type))
                        case ("IR","SP")
                          fr4vepxf(ii) = vepxf_p2(irgex,itgex,ipgex) !Unique to IR/SP, SP has 3 more
                          fr4vepyf(ii) = vepyf_p2(irgex,itgex,ipgex) !Unique to IR/SP, SP has 3 more
                          fr4vepzf(ii) = vepzf_p2(irgex,itgex,ipgex) !Unique to IR/SP, SP has 3 more
                          select case (trim(id_type))
                          case ("SP")
                            fr4wxspf(ii) = wxspf_p2(irgex,itgex,ipgex)
                            fr4wyspf(ii) = wyspf_p2(irgex,itgex,ipgex)
                            fr4wzspf(ii) = wzspf_p2(irgex,itgex,ipgex)
                          end select
                     end select
 
                     fr4psif(ii)  =  psif_p2(irgex,itgex,ipgex)
                     fr4alphf(ii) = alphf_p2(irgex,itgex,ipgex)
                     fr4bvxdf(ii) = bvxdf_p2(irgex,itgex,ipgex)
                     fr4bvydf(ii) = bvydf_p2(irgex,itgex,ipgex)
                     fr4bvzdf(ii) = bvzdf_p2(irgex,itgex,ipgex)
                   end do
                   ft4emd(jj)   = lagint_4th(r4,fr4emd  ,rcf_p2)
                   select case (trim(id_type))
                     case ("IR","SP")
                        ft4vepxf(jj) = lagint_4th(r4,fr4vepxf,rcf_p2) !Unique to IR, SP has 3 more
                        ft4vepyf(jj) = lagint_4th(r4,fr4vepyf,rcf_p2) !Unique to IR, SP has 3 more
                        ft4vepzf(jj) = lagint_4th(r4,fr4vepzf,rcf_p2) !Unique to IR, SP has 3 more
                        select case (trim(id_type))
                          case ("SP")
                            ft4wxspf(jj) = lagint_4th(r4,fr4wxspf,rcf_p2)
                            ft4wyspf(jj) = lagint_4th(r4,fr4wyspf,rcf_p2)
                            ft4wzspf(jj) = lagint_4th(r4,fr4wzspf,rcf_p2)
                        end select
                   end select
 
                   ft4psif(jj)  = lagint_4th(r4,fr4psif ,rcf_p2)
                   ft4alphf(jj) = lagint_4th(r4,fr4alphf,rcf_p2)
                   ft4bvxdf(jj) = lagint_4th(r4,fr4bvxdf,rcf_p2)
                   ft4bvydf(jj) = lagint_4th(r4,fr4bvydf,rcf_p2)
                   ft4bvzdf(jj) = lagint_4th(r4,fr4bvzdf,rcf_p2)
                 end do
                 fp4emd(kk)   = lagint_4th(th4,ft4emd  ,thc_p2)
                 select case (trim(id_type))
                    case ("IR","SP")
                      fp4vepxf(kk) = lagint_4th(th4,ft4vepxf,thc_p2) !Unique to iR, SP has 3 more
                      fp4vepyf(kk) = lagint_4th(th4,ft4vepyf,thc_p2) !Unique to iR, SP has 3 more
                      fp4vepzf(kk) = lagint_4th(th4,ft4vepzf,thc_p2) !Unique to iR, SP has 3 more
                      select case (trim(id_type))
                        case ("SP")
                          fp4wxspf(kk) = lagint_4th(th4,ft4wxspf,thc_p2)
                          fp4wyspf(kk) = lagint_4th(th4,ft4wyspf,thc_p2)
                          fp4wzspf(kk) = lagint_4th(th4,ft4wzspf,thc_p2)
                      end select
                  end select
 
                 fp4psif(kk)  = lagint_4th(th4,ft4psif ,thc_p2)
                 fp4alphf(kk) = lagint_4th(th4,ft4alphf,thc_p2)
                 fp4bvxdf(kk) = lagint_4th(th4,ft4bvxdf,thc_p2)
                 fp4bvydf(kk) = lagint_4th(th4,ft4bvydf,thc_p2)
                 fp4bvzdf(kk) = lagint_4th(th4,ft4bvzdf,thc_p2)
               end do
               emdca   = lagint_4th(phi4,fp4emd  ,phic_p2)
               select case (trim(id_type))
                  case ("IR","SP")
                    vepxfca = lagint_4th(phi4,fp4vepxf,phic_p2) !Unique to IR, SP has 3 more
                    vepyfca = lagint_4th(phi4,fp4vepyf,phic_p2) !Unique to IR, SP has 3 more
                    vepzfca = lagint_4th(phi4,fp4vepzf,phic_p2) !Unique to IR, SP has 3 more
                    select case (trim(id_type))
                      case ("SP")
                        wxspfca = lagint_4th(phi4,fp4wxspf,phic_p2)
                        wyspfca = lagint_4th(phi4,fp4wyspf,phic_p2)
                        wzspfca = lagint_4th(phi4,fp4wzspf,phic_p2)
                    end select
               end select
 
               psifca  = lagint_4th(phi4,fp4psif ,phic_p2)
               alphfca = lagint_4th(phi4,fp4alphf,phic_p2)
               bvxdfca = lagint_4th(phi4,fp4bvxdf,phic_p2)
               bvydfca = lagint_4th(phi4,fp4bvydf,phic_p2)
               bvzdfca = lagint_4th(phi4,fp4bvzdf,phic_p2)
       !
               psif4ca = psifca**4
               select case (trim(id_type))
                  case ("IR","SP")
                    alphfca2 = alphfca**2 !Unique to IR, SP has 1 more line here
                    select case (trim(id_type))
                      case ("SP")
                        psifcacp = psifca**confpow_p2
                    end select
               end select
            
 
               bxcor   = bvxdfca + ome_p2*(-ycoc)
               bycor   = bvydfca + ome_p2*(xcoc)
               bzcor   = bvzdfca
               
       !
              select case (trim(id_type))
                case ("CO")
                  vxu = bxcor/alphfca
                  vyu = bycor/alphfca
                  vzu = bzcor/alphfca
                case ("IR")
                  lam_p2  = ber_p2 + bxcor*vepxfca + bycor*vepyfca + bzcor*vepzfca !Unique to IR, SP has 3 more lines here
                  huta = lam_p2/alphfca !Unique to IR/SP, differening expressions

                  vxu = (vepxfca/psif4ca )/huta !IR/CO/SP differernt expressions
                  vyu = (vepyfca/psif4ca )/huta !IR/CO/SP differernt expressions
                  vzu = (vepzfca/psif4ca )/huta !IR/CO/SP differernt expressions
                case ("SP")
                  lam_p2  = ber_p2 + bxcor*vepxfca + bycor*vepyfca + bzcor*vepzfca !Unique to IR, SP has 3 more lines here
                  wdvep   = (wxspfca*vepxfca + wyspfca*vepyfca + wzspfca*vepzfca)*psifcacp
                  w2      = psif4ca*(wxspfca*wxspfca + wyspfca*wyspfca + wzspfca*wzspfca)*psifcacp**2.0d0
                  wterm   = wdvep + w2
                  huta = (lam_p2 + sqrt(lam_p2*lam_p2 + 4.0d0*alphfca2*wterm))/(2.0d0*alphfca)

                  vxu = (vepxfca/psif4ca + psifcacp*wxspfca)/huta
                  vyu = (vepyfca/psif4ca + psifcacp*wyspfca)/huta
                  vzu = (vepzfca/psif4ca + psifcacp*wzspfca)/huta
              end select
             else
               vepxfca=0.0d0; vepyfca=0.0d0; vepzfca=0.0d0 !Unique to IR
               emdca=0.0d0;
               vxu=0.0d0; vyu=0.0d0; vzu=0.0d0
             end if
       !
           end if
         end if
         
         gxx1 = psi4ca
         gxy1 = 0.0d0
         gxz1 = 0.0d0
         gyy1 = psi4ca
         gyz1 = 0.0d0
         gzz1 = psi4ca
 
         kxx1 = psi4ca*axx/(radi_p1)
         kxy1 = psi4ca*axy/(radi_p1)
         kxz1 = psi4ca*axz/(radi_p1)
         kyy1 = psi4ca*ayy/(radi_p1)
         kyz1 = psi4ca*ayz/(radi_p1)
         kzz1 = psi4ca*azz/(radi_p1)
         if(cent.eq.1) then
            gxx(i,j,k) = gxx1
            gxy(i,j,k) = gxy1
            gxz(i,j,k) = gxz1
            gyy(i,j,k) = gyy1
            gyz(i,j,k) = gyz1
            gzz(i,j,k) = gzz1

            kxx(i,j,k) = kxx1
            kxy(i,j,k) = kxy1
            kxz(i,j,k) = kxz1
            kyy(i,j,k) = kyy1
            kyz(i,j,k) = kyz1
            kzz(i,j,k) = kzz1
         end if 
 
         if (gxx1 == gxx1) then
           continue
         else 
           call CCTK_WARN(CCTK_WARN_ABORT, "NaN in gxx")
         end if 
 
         call peos_q2hprho(emdca, hca, preca, rhoca, eneca)
         if(cent.eq.1) then
            if (bool_lapse) then
               alp(i,j,k) = alphca
            end if
            if (bool_shift) then
               betax(i,j,k) = bvxdca
               betay(i,j,k) = bvydca
               betaz(i,j,k) = bvzdca
            end if
         end if
         if(cent.eq.2) then
            if (bool_hydro) then
               rho(i,j,k) = rhoca
               press(i,j,k) = preca
               eps(i,j,k) = eneca/rhoca - 1.0d0
               velx(i,j,k) = vxu
               vely(i,j,k) = vyu
               velz(i,j,k) = vzu
            end if
         end if
         if (bool_Bvec) then
            if (cent.eq.2) then 
               Bvecx(i,j,k) = 0.0d0
               Bvecy(i,j,k) = 0.0d0
               Bvecz(i,j,k) = 0.0d0
            end if 
            if (cent.eq.3) then 
               Avecx(i,j,k) = 0.0d0
            end if 
            if (cent.eq.4) then 
               Avecy(i,j,k) = 0.0d0
            end if 
            if (cent.eq.5) then 
               Avecz(i,j,k) = 0.0d0
            end if
         end if
         
         
 
       !   write(6,'(a6,e20.12)') "psi  =", psica
       !   write(6,'(a6,e20.12)') "alph =", alphca
       !   write(6,'(a6,e20.12)') "bvxd =", bvxdca
       !   write(6,'(a6,e20.12)') "bvyd =", bvydca
       !   write(6,'(a6,e20.12)') "bvzd =", bvzdca
       !   write(6,'(a6,e20.12)') "Radi =", r_surf_p1*radi_p1
       !   write(6,'(a6,e20.12)') "Omeg =", ome_p1/radi_p1
       !   write(6,'(a6,e20.12)') "emd  =", emdca
       !   write(6,'(a6,e20.12)') "h    =", hca
       !   write(6,'(a6,e20.12)') "pre  =", preca
       !   write(6,'(a6,e20.12)') "rho  =", rhoca
       !   write(6,'(a6,e20.12)') "ene  =", eneca
       !   write(6,'(a6,e20.12)') "eps  =", epsca
       !   write(6,'(a6,e20.12)') "vepx =", vepxfca
       !   write(6,'(a6,e20.12)') "vepy =", vepyfca
       !   write(6,'(a6,e20.12)') "vepz =", vepzfca
       ! !
       !   write(6,'(a18)') "Kij at gridpoints:"
       !   write(6,'(3e20.12)') kxx, kxy, kxz
       !   write(6,'(3e20.12)') kxy, kyy, kyz
       !   write(6,'(3e20.12)') kxz, kyz, kzz
 
       !   write(6,'(a13)') "v^i eulerian:"
       !   write(6,'(a6,e20.12)') "vxu  =", vxu
       !   write(6,'(a6,e20.12)') "vyu  =", vyu
       !   write(6,'(a6,e20.12)') "vzu  =", vzu
       end do
     end do
   end do
   if (verbose == 1) then 
      call CCTK_INFO("Finished looping over Cactus Grid")
   end if
   !call CCTK_INFO("Deallocating....")
   !Don't deallocate saved arrays, leak the memory!
   !deallocate(       rg_p1);  deallocate(       rg_p2);  deallocate(       rg_p3)
   !deallocate(     rgex_p1);  deallocate(     rgex_p2);  deallocate(     rgex_p3)
   !deallocate(    thgex_p1);  deallocate(    thgex_p2);  deallocate(    thgex_p3)
   !deallocate(   phigex_p1);  deallocate(   phigex_p2);  deallocate(   phigex_p3)
   !deallocate(  irgex_r_p1);  deallocate(  irgex_r_p2);  deallocate(  irgex_r_p3)
   !deallocate( itgex_th_p1);  deallocate( itgex_th_p2);  deallocate( itgex_th_p3)
   !deallocate(ipgex_phi_p1);  deallocate(ipgex_phi_p2);  deallocate(ipgex_phi_p3)
   !deallocate(  itgex_r_p1);  deallocate(  itgex_r_p2);  deallocate(  itgex_r_p3)
   !deallocate(  ipgex_r_p1);  deallocate(  ipgex_r_p2);  deallocate(  ipgex_r_p3)
   !deallocate( ipgex_th_p1);  deallocate( ipgex_th_p2);  deallocate( ipgex_th_p3)
   
   !deallocate(  emd_p1);  deallocate(  emd_p2);
   select case (trim(id_type))
      case ("IR","SP")
         CONTINUE
         !deallocate(vep_p1);    deallocate(vep_p2);
         !deallocate(vepxf_p1);  deallocate(vepxf_p2); 
         !deallocate(vepyf_p1);  deallocate(vepyf_p2); 
         !deallocate(vepzf_p1);  deallocate(vepzf_p2); 
         select case (trim(id_type))
            case ("SP")
               CONTINUE
               !deallocate(wxspf_p1);  deallocate(wxspf_p2); 
               !deallocate(wyspf_p1);  deallocate(wyspf_p2); 
               !deallocate(wzspf_p1);  deallocate(wzspf_p2); 
         end select
   end select
   !deallocate( psif_p1);  deallocate( psif_p2);
   !deallocate(alphf_p1);  deallocate(alphf_p2);
   !deallocate(bvxdf_p1);  deallocate(bvxdf_p2);
   !deallocate(bvydf_p1);  deallocate(bvydf_p2);
   !deallocate(bvzdf_p1);  deallocate(bvzdf_p2);
   !deallocate(   rs_p1);  deallocate(   rs_p2);
   !deallocate(  psi_p1);  deallocate(  psi_p2);  deallocate(psi_p3)
   !deallocate( alph_p1);  deallocate( alph_p2);  deallocate(alph_p3)
   !deallocate( bvxd_p1);  deallocate( bvxd_p2);  deallocate(bvxd_p3)
   !deallocate( bvyd_p1);  deallocate( bvyd_p2);  deallocate(bvyd_p3)
   !deallocate( bvzd_p1);  deallocate( bvzd_p2);  deallocate(bvzd_p3)
   !deallocate(  axx_p1);  deallocate(  axx_p2);  deallocate(axx_p3)
   !deallocate(  axy_p1);  deallocate(  axy_p2);  deallocate(axy_p3)
   !deallocate(  axz_p1);  deallocate(  axz_p2);  deallocate(axz_p3)
   !deallocate(  ayy_p1);  deallocate(  ayy_p2);  deallocate(ayy_p3)
   !deallocate(  ayz_p1);  deallocate(  ayz_p2);  deallocate(ayz_p3)
   !deallocate(  azz_p1);  deallocate(  azz_p2);  deallocate(azz_p3)
   !call CCTK_INFO("Finished Deallocating...")
   if (verbose == 1) then 
      call CCTK_INFO("Finishing COCAL bns reader")
   end if
end do
 !
   contains
   integer function read_id_type(filename,id_type)
     implicit none
     integer :: nrg, nrf, nrf_deform, nrgin
     character(len=*) :: filename
     character(2) :: id_type, EQ_point
   
     open(unit = 1,file = trim(filename), status='old')
     read(1,'(4i5)') nrg
     read(1,'(4i5)') nrf
     read(1,'(2i5,2(3x,a2))') nrf_deform, nrgin, id_type, EQ_point
     close(1)
     read_id_type = 0
   end function read_id_type
 END SUBROUTINE coc2cac_bns

