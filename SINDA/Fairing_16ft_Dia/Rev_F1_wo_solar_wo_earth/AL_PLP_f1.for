C PC SINDA/G FOR COMPAQ FORTRAN, SINGLE PRECISION                                                                                   
      PROGRAM SINDA                                                                                                                 
      CHARACTER*6 H                                                                                                                 
      COMMON /TITLE/H(20)                                                                                                           
      COMMON /TEMP/T(     11)                                                                                                       
      COMMON /CAP/C(      3)                                                                                                        
      COMMON /SOURCE/Q(      7)                                                                                                     
      COMMON /COND/G(      11)                                                                                                      
      COMMON /KONST/K(     11)                                                                                                      
      COMMON /ARRAY/A(    5197)                                                                                                     
      COMMON /PC1/LSQ1(      91)                                                                                                    
      COMMON /PC2/LSQ2(      42)                                                                                                    
      COMMON /DIMENS/NND,NNC,NNT,NGL,NGT,NGE,NCC,NUC,NCT,NAT,LENA                                                                   
     +,NSQ1,NSQ2,NPC,NPT,NSQ3,NVL,NPM,NTE,NSQ4,NCS,LCS                                                                              
      COMMON /POINTN/LNODE,LCOND,LCONS,LARRY,IVB,LPRES,LTUBE,LCHAR                                                                  
      COMMON /TAPE/NIN,NOUT,LDAT,LDIC,ASCI,FLUD,GNRL,CHAR,GUI                                                                       
      COMMON /XSPACE/NDIM,NTH,X( 1000000)                                                                                           
      COMMON /FIXCON/                                                                                                               
     +TIMEN ,DTIMEU,TIMEND,CSGFAC,NLOOP ,DTMPCA,ITROUT,DTIMEH,                                                                      
     +DAMPA ,DAMPD ,ATMPCA,BACKUP,TIMEO ,TIMEM ,DTMPCC,ATMPCC,                                                                      
     +CSGMIN,OUTPUT,ARLXCA,LOOPCT,DTIMEL,DTIMEI,CSGMAX,CSGRAL,                                                                      
     +CSGRCL,DRLXCA,DRLXCC,NLINE ,NPAGE ,ARLXCC,LSPCS ,ENGBAL,                                                                      
     +BALENG,ATSLIM,NCSGMN,NDTMPC,NARLXC,NATMPC,ITEST ,JTEST ,                                                                      
     +KTEST ,LTEST ,MTEST ,RTEST ,STEST ,TTEST ,UTEST ,VTEST ,                                                                      
     +LAXFAC,SIGMA ,TMPZRO,NDRLXC,TDERV ,NTDERV,BENODE,EBNODE,                                                                      
     +NODEEB,EXTLIM,NCOLUM,PRLXCA,PRLXCC,NEGSIV,GRVCON,PZERO ,                                                                      
     +NCSGMX,NTEST ,ATEST ,BTEST ,CTEST ,DTEST ,ETEST ,FTEST ,                                                                      
     +GTEST ,HTEST ,OTEST ,PTEST ,QTEST ,WTEST ,XTEST ,YTEST ,                                                                      
     +ZTEST ,NTROSS,ISNUNC,NLINPP,LOTEMP,ERRMAX,ERRMIN,SENGIN,                                                                      
     +DBLPRC,MPCNTL,IPCNT1,IPCNT2,ATSLM1,NLOOP1,JDIFQ ,KMAX  ,                                                                      
     +FRACHG,EPS   ,PRSABS,PRSREL,FLOABS,FLOREL,FLOMAX,PRANGE,                                                                      
     +ISOLVE,NPASS ,DEFLIM,ICHECK,GRAV  ,GC1   ,GC2   ,USRFLO,                                                                      
     +PMPTOL,DEBUGF,NOFERR,GC3   ,SPARE1,SPARE2,SPARE3,SPARE4,                                                                      
     +SPARE5,SPARE6,SPARE7,NNGSPM,NCONVG,SPARE8,SPARE9,SSTERM                                                                       
      DIMENSION XK(     11),NX( 1000000),IA(    5197)                                                                               
      EQUIVALENCE (K(1),XK(1)),(X(1),NX(1)),(A(1),IA(1))                                                                            
      LOGICAL ASCI,FLUD,GNRL,CHAR,GUI                                                                                               
      CHARACTER * 24 PRNAME                                                                                                         
      COMMON /PROBNAME/PRNAME                                                                                                       
      COMMON /MODNAME/MODNAME                                                                                                       
      CHARACTER *50 MODNAME                                                                                                         
      COMMON /IMODNAME/MODNSTRT,MODNEND,IFILESYS                                                                                    
      COMMON /NewPCS/nDimC,nDimQ,nDimG                                                                                              
      COMMON /PcsC/lsqC(      11)                                                                                                   
      COMMON /PcsQ/lsqQ(      14)                                                                                                   
      COMMON /PcsG/lsqG(      44)                                                                                                   
      LOGICAL lRecall,lParam                                                                                                        
       COMMON /File22/lRecall,lParam                                                                                                
      MODNAME="AL_PLP_Proposal_071808f1"                                                                                            
      MODNSTRT=  1                                                                                                                  
      MODNEND= 24                                                                                                                   
      IFILESYS=  1                                                                                                                  
      LPARAM=.FALSE.                                                                                                                
      PRNAME=MODNAME(MODNSTRT:MODNEND)                                                                                              
      GUI=.TRUE.                                                                                                                    
      NIN=5                                                                                                                         
      LDAT=2                                                                                                                        
      LDIC=4                                                                                                                        
      ASCI=.FALSE.                                                                                                                  
      CHAR=.FALSE.                                                                                                                  
      FLUD=.FALSE.                                                                                                                  
      GNRL=.FALSE.                                                                                                                  
      T(1)=0.                                                                                                                       
      C(1)=0.                                                                                                                       
      Q(1)=0.                                                                                                                       
      G(1)=0.                                                                                                                       
      LSQ1(1)=0                                                                                                                     
      LSQ2(1)=0                                                                                                                     
      K(1)=0                                                                                                                        
      A(1)=0.                                                                                                                       
      X(1)=0.                                                                                                                       
      NOUT=   6                                                                                                                     
      CALL RUNJOB(PRNAME,MODNAME,0)                                                                                                 
      CALL CLOSE_H5                                                                                                                 
      END                                                                                                                           
      SUBROUTINE EXECT                                                                                                              
      use msflib                                                                                                                    
      CHARACTER*6 H                                                                                                                 
      COMMON /TITLE/H(20)                                                                                                           
      COMMON /TEMP/T(     11)                                                                                                       
      COMMON /CAP/C(      3)                                                                                                        
      COMMON /SOURCE/Q(      7)                                                                                                     
      COMMON /COND/G(      11)                                                                                                      
      COMMON /KONST/K(     11)                                                                                                      
      COMMON /ARRAY/A(    5197)                                                                                                     
      COMMON /PC1/LSQ1(      91)                                                                                                    
      COMMON /PC2/LSQ2(      42)                                                                                                    
      COMMON /DIMENS/NND,NNC,NNT,NGL,NGT,NGE,NCC,NUC,NCT,NAT,LENA                                                                   
     +,NSQ1,NSQ2,NPC,NPT,NSQ3,NVL,NPM,NTE,NSQ4,NCS,LCS                                                                              
      COMMON /POINTN/LNODE,LCOND,LCONS,LARRY,IVB,LPRES,LTUBE,LCHAR                                                                  
      COMMON /TAPE/NIN,NOUT,LDAT,LDIC,ASCI,FLUD,GNRL,CHAR,GUI                                                                       
      COMMON /XSPACE/NDIM,NTH,X( 1000000)                                                                                           
      COMMON /FIXCON/                                                                                                               
     +TIMEN ,DTIMEU,TIMEND,CSGFAC,NLOOP ,DTMPCA,ITROUT,DTIMEH,                                                                      
     +DAMPA ,DAMPD ,ATMPCA,BACKUP,TIMEO ,TIMEM ,DTMPCC,ATMPCC,                                                                      
     +CSGMIN,OUTPUT,ARLXCA,LOOPCT,DTIMEL,DTIMEI,CSGMAX,CSGRAL,                                                                      
     +CSGRCL,DRLXCA,DRLXCC,NLINE ,NPAGE ,ARLXCC,LSPCS ,ENGBAL,                                                                      
     +BALENG,ATSLIM,NCSGMN,NDTMPC,NARLXC,NATMPC,ITEST ,JTEST ,                                                                      
     +KTEST ,LTEST ,MTEST ,RTEST ,STEST ,TTEST ,UTEST ,VTEST ,                                                                      
     +LAXFAC,SIGMA ,TMPZRO,NDRLXC,TDERV ,NTDERV,BENODE,EBNODE,                                                                      
     +NODEEB,EXTLIM,NCOLUM,PRLXCA,PRLXCC,NEGSIV,GRVCON,PZERO ,                                                                      
     +NCSGMX,NTEST ,ATEST ,BTEST ,CTEST ,DTEST ,ETEST ,FTEST ,                                                                      
     +GTEST ,HTEST ,OTEST ,PTEST ,QTEST ,WTEST ,XTEST ,YTEST ,                                                                      
     +ZTEST ,NTROSS,ISNUNC,NLINPP,LOTEMP,ERRMAX,ERRMIN,SENGIN,                                                                      
     +DBLPRC,MPCNTL,IPCNT1,IPCNT2,ATSLM1,NLOOP1,JDIFQ ,KMAX  ,                                                                      
     +FRACHG,EPS   ,PRSABS,PRSREL,FLOABS,FLOREL,FLOMAX,PRANGE,                                                                      
     +ISOLVE,NPASS ,DEFLIM,ICHECK,GRAV  ,GC1   ,GC2   ,USRFLO,                                                                      
     +PMPTOL,DEBUGF,NOFERR,GC3   ,SPARE1,SPARE2,SPARE3,SPARE4,                                                                      
     +SPARE5,SPARE6,SPARE7,NNGSPM,NCONVG,SPARE8,SPARE9,SSTERM                                                                       
      DIMENSION XK(     11),NX( 1000000),IA(    5197)                                                                               
      EQUIVALENCE (K(1),XK(1)),(X(1),NX(1)),(A(1),IA(1))                                                                            
      LOGICAL ASCI,FLUD,GNRL,CHAR,GUI                                                                                               
      CHARACTER * 24 PRNAME                                                                                                         
      COMMON /PROBNAME/PRNAME                                                                                                       
      CALL SNDUFR                                                                                                                   
      RETURN                                                                                                                        
      END                                                                                                                           
      SUBROUTINE VARBL1                                                                                                             
      use msflib                                                                                                                    
      CHARACTER*6 H                                                                                                                 
      COMMON /TITLE/H(20)                                                                                                           
      COMMON /TEMP/T(     11)                                                                                                       
      COMMON /CAP/C(      3)                                                                                                        
      COMMON /SOURCE/Q(      7)                                                                                                     
      COMMON /COND/G(      11)                                                                                                      
      COMMON /KONST/K(     11)                                                                                                      
      COMMON /ARRAY/A(    5197)                                                                                                     
      COMMON /PC1/LSQ1(      91)                                                                                                    
      COMMON /PC2/LSQ2(      42)                                                                                                    
      COMMON /DIMENS/NND,NNC,NNT,NGL,NGT,NGE,NCC,NUC,NCT,NAT,LENA                                                                   
     +,NSQ1,NSQ2,NPC,NPT,NSQ3,NVL,NPM,NTE,NSQ4,NCS,LCS                                                                              
      COMMON /POINTN/LNODE,LCOND,LCONS,LARRY,IVB,LPRES,LTUBE,LCHAR                                                                  
      COMMON /TAPE/NIN,NOUT,LDAT,LDIC,ASCI,FLUD,GNRL,CHAR,GUI                                                                       
      COMMON /XSPACE/NDIM,NTH,X( 1000000)                                                                                           
      COMMON /FIXCON/                                                                                                               
     +TIMEN ,DTIMEU,TIMEND,CSGFAC,NLOOP ,DTMPCA,ITROUT,DTIMEH,                                                                      
     +DAMPA ,DAMPD ,ATMPCA,BACKUP,TIMEO ,TIMEM ,DTMPCC,ATMPCC,                                                                      
     +CSGMIN,OUTPUT,ARLXCA,LOOPCT,DTIMEL,DTIMEI,CSGMAX,CSGRAL,                                                                      
     +CSGRCL,DRLXCA,DRLXCC,NLINE ,NPAGE ,ARLXCC,LSPCS ,ENGBAL,                                                                      
     +BALENG,ATSLIM,NCSGMN,NDTMPC,NARLXC,NATMPC,ITEST ,JTEST ,                                                                      
     +KTEST ,LTEST ,MTEST ,RTEST ,STEST ,TTEST ,UTEST ,VTEST ,                                                                      
     +LAXFAC,SIGMA ,TMPZRO,NDRLXC,TDERV ,NTDERV,BENODE,EBNODE,                                                                      
     +NODEEB,EXTLIM,NCOLUM,PRLXCA,PRLXCC,NEGSIV,GRVCON,PZERO ,                                                                      
     +NCSGMX,NTEST ,ATEST ,BTEST ,CTEST ,DTEST ,ETEST ,FTEST ,                                                                      
     +GTEST ,HTEST ,OTEST ,PTEST ,QTEST ,WTEST ,XTEST ,YTEST ,                                                                      
     +ZTEST ,NTROSS,ISNUNC,NLINPP,LOTEMP,ERRMAX,ERRMIN,SENGIN,                                                                      
     +DBLPRC,MPCNTL,IPCNT1,IPCNT2,ATSLM1,NLOOP1,JDIFQ ,KMAX  ,                                                                      
     +FRACHG,EPS   ,PRSABS,PRSREL,FLOABS,FLOREL,FLOMAX,PRANGE,                                                                      
     +ISOLVE,NPASS ,DEFLIM,ICHECK,GRAV  ,GC1   ,GC2   ,USRFLO,                                                                      
     +PMPTOL,DEBUGF,NOFERR,GC3   ,SPARE1,SPARE2,SPARE3,SPARE4,                                                                      
     +SPARE5,SPARE6,SPARE7,NNGSPM,NCONVG,SPARE8,SPARE9,SSTERM                                                                       
      DIMENSION XK(     11),NX( 1000000),IA(    5197)                                                                               
      EQUIVALENCE (K(1),XK(1)),(X(1),NX(1)),(A(1),IA(1))                                                                            
      LOGICAL ASCI,FLUD,GNRL,CHAR,GUI                                                                                               
      CHARACTER * 24 PRNAME                                                                                                         
      COMMON /PROBNAME/PRNAME                                                                                                       
CcC                                                                                                                                 
CcC        Turn off the natural convection during the flight.                                                                       
CcC        Assume 1 BTU/hr ft**2 = 1.929E-6 BTU/sec in**2                                                                           
CcC        G(1) = Area * h = (19.0*19.0) * 1.929E-6                                                                                 
CcCM     IF( TIMEN .GE.    50.0 )  G(1) = 0.0                                                                                       
      IF( TIMEN .GE.    0.0 )  G(1) = 0.0                                                                                           
CcM      G(1) = 0.0                                                                                                                 
CcCM     IF( TIMEN .GE. 10933.0 )  G(1) = 6.964E-4                                                                                  
CcC                                                                                                                                 
CcC        Turn off the connection to the fuel boundary node after the ascent.                                                      
CcCM     IF( TIMEN .GT. 1200.0 )  XK15201 = 0.0                                                                                     
CcC                                                                                                                                 
CcC        Allow air conduction during ascent and descent.                                                                          
CcCF     IF( TIMEN .GE. 1200.0  .AND.  TIMEN .LE. 9000.0 )  THEN                                                                    
CcCM        XK3000  = 0.0                                                                                                           
CcCM        XK11100 = 0.0                                                                                                           
CcCF     ELSE                                                                                                                       
CcM        XK3000  = 3.343E-2                                                                                                       
CcM        XK11100 = 0.015                                                                                                          
CcCF     ENDIF                                                                                                                      
CcC                                                                                                                                 
      RETURN                                                                                                                        
      END                                                                                                                           
      SUBROUTINE VARBL2                                                                                                             
      use msflib                                                                                                                    
      CHARACTER*6 H                                                                                                                 
      COMMON /TITLE/H(20)                                                                                                           
      COMMON /TEMP/T(     11)                                                                                                       
      COMMON /CAP/C(      3)                                                                                                        
      COMMON /SOURCE/Q(      7)                                                                                                     
      COMMON /COND/G(      11)                                                                                                      
      COMMON /KONST/K(     11)                                                                                                      
      COMMON /ARRAY/A(    5197)                                                                                                     
      COMMON /PC1/LSQ1(      91)                                                                                                    
      COMMON /PC2/LSQ2(      42)                                                                                                    
      COMMON /DIMENS/NND,NNC,NNT,NGL,NGT,NGE,NCC,NUC,NCT,NAT,LENA                                                                   
     +,NSQ1,NSQ2,NPC,NPT,NSQ3,NVL,NPM,NTE,NSQ4,NCS,LCS                                                                              
      COMMON /POINTN/LNODE,LCOND,LCONS,LARRY,IVB,LPRES,LTUBE,LCHAR                                                                  
      COMMON /TAPE/NIN,NOUT,LDAT,LDIC,ASCI,FLUD,GNRL,CHAR,GUI                                                                       
      COMMON /XSPACE/NDIM,NTH,X( 1000000)                                                                                           
      COMMON /FIXCON/                                                                                                               
     +TIMEN ,DTIMEU,TIMEND,CSGFAC,NLOOP ,DTMPCA,ITROUT,DTIMEH,                                                                      
     +DAMPA ,DAMPD ,ATMPCA,BACKUP,TIMEO ,TIMEM ,DTMPCC,ATMPCC,                                                                      
     +CSGMIN,OUTPUT,ARLXCA,LOOPCT,DTIMEL,DTIMEI,CSGMAX,CSGRAL,                                                                      
     +CSGRCL,DRLXCA,DRLXCC,NLINE ,NPAGE ,ARLXCC,LSPCS ,ENGBAL,                                                                      
     +BALENG,ATSLIM,NCSGMN,NDTMPC,NARLXC,NATMPC,ITEST ,JTEST ,                                                                      
     +KTEST ,LTEST ,MTEST ,RTEST ,STEST ,TTEST ,UTEST ,VTEST ,                                                                      
     +LAXFAC,SIGMA ,TMPZRO,NDRLXC,TDERV ,NTDERV,BENODE,EBNODE,                                                                      
     +NODEEB,EXTLIM,NCOLUM,PRLXCA,PRLXCC,NEGSIV,GRVCON,PZERO ,                                                                      
     +NCSGMX,NTEST ,ATEST ,BTEST ,CTEST ,DTEST ,ETEST ,FTEST ,                                                                      
     +GTEST ,HTEST ,OTEST ,PTEST ,QTEST ,WTEST ,XTEST ,YTEST ,                                                                      
     +ZTEST ,NTROSS,ISNUNC,NLINPP,LOTEMP,ERRMAX,ERRMIN,SENGIN,                                                                      
     +DBLPRC,MPCNTL,IPCNT1,IPCNT2,ATSLM1,NLOOP1,JDIFQ ,KMAX  ,                                                                      
     +FRACHG,EPS   ,PRSABS,PRSREL,FLOABS,FLOREL,FLOMAX,PRANGE,                                                                      
     +ISOLVE,NPASS ,DEFLIM,ICHECK,GRAV  ,GC1   ,GC2   ,USRFLO,                                                                      
     +PMPTOL,DEBUGF,NOFERR,GC3   ,SPARE1,SPARE2,SPARE3,SPARE4,                                                                      
     +SPARE5,SPARE6,SPARE7,NNGSPM,NCONVG,SPARE8,SPARE9,SSTERM                                                                       
      DIMENSION XK(     11),NX( 1000000),IA(    5197)                                                                               
      EQUIVALENCE (K(1),XK(1)),(X(1),NX(1)),(A(1),IA(1))                                                                            
      LOGICAL ASCI,FLUD,GNRL,CHAR,GUI                                                                                               
      CHARACTER * 24 PRNAME                                                                                                         
      COMMON /PROBNAME/PRNAME                                                                                                       
      RETURN                                                                                                                        
      END                                                                                                                           
      SUBROUTINE OUTCAL                                                                                                             
      use msflib                                                                                                                    
      CHARACTER*6 H                                                                                                                 
      COMMON /TITLE/H(20)                                                                                                           
      COMMON /TEMP/T(     11)                                                                                                       
      COMMON /CAP/C(      3)                                                                                                        
      COMMON /SOURCE/Q(      7)                                                                                                     
      COMMON /COND/G(      11)                                                                                                      
      COMMON /KONST/K(     11)                                                                                                      
      COMMON /ARRAY/A(    5197)                                                                                                     
      COMMON /PC1/LSQ1(      91)                                                                                                    
      COMMON /PC2/LSQ2(      42)                                                                                                    
      COMMON /DIMENS/NND,NNC,NNT,NGL,NGT,NGE,NCC,NUC,NCT,NAT,LENA                                                                   
     +,NSQ1,NSQ2,NPC,NPT,NSQ3,NVL,NPM,NTE,NSQ4,NCS,LCS                                                                              
      COMMON /POINTN/LNODE,LCOND,LCONS,LARRY,IVB,LPRES,LTUBE,LCHAR                                                                  
      COMMON /TAPE/NIN,NOUT,LDAT,LDIC,ASCI,FLUD,GNRL,CHAR,GUI                                                                       
      COMMON /XSPACE/NDIM,NTH,X( 1000000)                                                                                           
      COMMON /FIXCON/                                                                                                               
     +TIMEN ,DTIMEU,TIMEND,CSGFAC,NLOOP ,DTMPCA,ITROUT,DTIMEH,                                                                      
     +DAMPA ,DAMPD ,ATMPCA,BACKUP,TIMEO ,TIMEM ,DTMPCC,ATMPCC,                                                                      
     +CSGMIN,OUTPUT,ARLXCA,LOOPCT,DTIMEL,DTIMEI,CSGMAX,CSGRAL,                                                                      
     +CSGRCL,DRLXCA,DRLXCC,NLINE ,NPAGE ,ARLXCC,LSPCS ,ENGBAL,                                                                      
     +BALENG,ATSLIM,NCSGMN,NDTMPC,NARLXC,NATMPC,ITEST ,JTEST ,                                                                      
     +KTEST ,LTEST ,MTEST ,RTEST ,STEST ,TTEST ,UTEST ,VTEST ,                                                                      
     +LAXFAC,SIGMA ,TMPZRO,NDRLXC,TDERV ,NTDERV,BENODE,EBNODE,                                                                      
     +NODEEB,EXTLIM,NCOLUM,PRLXCA,PRLXCC,NEGSIV,GRVCON,PZERO ,                                                                      
     +NCSGMX,NTEST ,ATEST ,BTEST ,CTEST ,DTEST ,ETEST ,FTEST ,                                                                      
     +GTEST ,HTEST ,OTEST ,PTEST ,QTEST ,WTEST ,XTEST ,YTEST ,                                                                      
     +ZTEST ,NTROSS,ISNUNC,NLINPP,LOTEMP,ERRMAX,ERRMIN,SENGIN,                                                                      
     +DBLPRC,MPCNTL,IPCNT1,IPCNT2,ATSLM1,NLOOP1,JDIFQ ,KMAX  ,                                                                      
     +FRACHG,EPS   ,PRSABS,PRSREL,FLOABS,FLOREL,FLOMAX,PRANGE,                                                                      
     +ISOLVE,NPASS ,DEFLIM,ICHECK,GRAV  ,GC1   ,GC2   ,USRFLO,                                                                      
     +PMPTOL,DEBUGF,NOFERR,GC3   ,SPARE1,SPARE2,SPARE3,SPARE4,                                                                      
     +SPARE5,SPARE6,SPARE7,NNGSPM,NCONVG,SPARE8,SPARE9,SSTERM                                                                       
      DIMENSION XK(     11),NX( 1000000),IA(    5197)                                                                               
      EQUIVALENCE (K(1),XK(1)),(X(1),NX(1)),(A(1),IA(1))                                                                            
      LOGICAL ASCI,FLUD,GNRL,CHAR,GUI                                                                                               
      CHARACTER * 24 PRNAME                                                                                                         
      COMMON /PROBNAME/PRNAME                                                                                                       
      CALL TPRINT                                                                                                                   
      CALL QNPRNT                                                                                                                   
C           GPRINT                                                                                                                  
C           QFPRNT                                                                                                                  
C           KPRINT                                                                                                                  
      CALL ADTPRT                                                                                                                   
      END                                                                                                                           
      SUBROUTINE ADTPRT                                                                                                             
C     Purpose - Print specific parameters in a seperate file.                                                                       
      COMMON /FIXCON/                                                                                                               
     +TIMEN ,DTIMEU,TIMEND,CSGFAC,NLOOP ,DTMPCA,ITROUT,DTIMEH,                                                                      
     +DAMPA ,DAMPD ,ATMPCA,BACKUP,TIMEO ,TIMEM ,DTMPCC,ATMPCC,                                                                      
     +CSGMIN,OUTPUT,ARLXCA,LOOPCT,DTIMEL,DTIMEI,CSGMAX,CSGRAL,                                                                      
     +CSGRCL,DRLXCA,DRLXCC,NLINE ,NPAGE ,ARLXCC,LSPCS ,ENGBAL,                                                                      
     +BALENG,ATSLIM,NCSGMN,NDTMPC,NARLXC,NATMPC,ITEST ,JTEST ,                                                                      
     +KTEST ,LTEST ,MTEST ,RTEST ,STEST ,TTEST ,UTEST ,VTEST ,                                                                      
     +LAXFAC,SIGMA ,TMPZRO,NDRLXC,TDERV ,NTDERV,BENODE,EBNODE,                                                                      
     +NODEEB,EXTLIM,NFLOOP,PRLXCA,PRLXCC,LOOPFC,GRVCON,PZERO ,                                                                      
     +NCSGMX,NTEST ,ATEST ,BTEST ,CTEST ,DTEST ,ETEST ,FTEST ,                                                                      
     +GTEST ,HTEST ,OTEST ,PTEST ,QTEST ,WTEST ,XTEST ,YTEST ,                                                                      
     +ZTEST ,NTROSS,ISNUNC,NLINPP,LOTEMP,ERRMAX,ERRMIN,SENGIN,                                                                      
     +DBLPRC,MPCNTL,IPCNT1,IPCNT2,ATSLM1,NLOOP1,JDIFQ ,KMAX  ,                                                                      
     +FRACHG,EPS   ,PRSABS,PRSREL,FLOABS,FLOREL,FLOMAX,PRANGE,                                                                      
     +ISOLVE,NPASS ,DEFLIM,ICHECK,GRAV  ,GC1   ,GC2   ,USRFLO,                                                                      
     +PMPTOL,DEBUGF,NOFERR,SPARE0,SPARE1,SPARE2,SPARE3,SPARE4,                                                                      
     +SPARE5,SPARE6,SPARE7,SPARE8,SPARE9                                                                                            
      COMMON /  TEMP/   T(1)                                                                                                        
C        Set up the print loop, and open the ASCII output file.                                                                     
CF     OPEN( 88, FILE = "TAPE88", ACCESS = "APPEND")                                                                                
      OPEN( 88, FILE = "output.out", ACCESS = "APPEND")                                                                             
CcM     WRITE( 88,"(' ', 9F10.3)") TIMEN,                                                                                           
CcM    :                 T(1000), T(1001), T(1100), T(2000),                                                                        
CcM    :                 T(3000), T(4001), T(5000), T(6000)                                                                         
      WRITE( 88,"(' ', 9F10.3)") TIMEN,                                                                                             
     :                 T(4), T(1), T(5), T(2),                                                                                      
     :                 T(6), T(3), T(7), T(10)                                                                                      
      CLOSE(88)                                                                                                                     
      RETURN                                                                                                                        
C     END                                                                                                                           
      RETURN                                                                                                                        
      END                                                                                                                           
      SUBROUTINE VARBLF                                                                                                             
      RETURN                                                                                                                        
      END                                                                                                                           
