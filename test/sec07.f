      PROGRAM TEST
C     VARIABLES  
      DIMENSION TETA(256),MODI(7),Z1(8),Z2(8)

      I=1                                                               
      DO 10 IX=1,7                                                      
      IX8=8-IX                                                          
      MODI(IX8)=2**(I-1)                                                       
 10   I=I+1                                                             
      READ 20,(TETA(I),I=1,256)                                         
 20   FORMAT(12F6.6)                                                    
      READ 30,(Z1(I),Z2(I),I=1,8)                                       
 30   FORMAT(6(F3.2,F9.8)/F3.2,F9.8,E6.2,F9.8)                          

C
C
C --------------------- START ---------------------------
  580 KX=1                                                
  590 X1=RANF(-1)                                  
      IF (X1-0.9997) 600,650,680                          
  600 I=128                                               
      DO 630 IX=1,7                                       
      IF(TETA(I)-X1) 610,640,620                          
  610 I=I+MODI(IX)                                        
      GO TO 630                                           
  620 I=I-MODI(IX)                                        
  630 CONTINUE                                            
      IF(TETA(I)-X1) 670,640,660                          
  640 XLAMBDA=FLOATF(I-1)/100.0                           
      GO TO (720,760), KX                                 
  650 XLAMBDA=2.55                                        
      GO TO (720,760),KX                                  
  660 I=I-1                                               
  670 TX1=TETA(I)                                         
      XLAMBDA=(FLOATF(I-1)+(X1-TX1)/(TETA(I+1)-TX1))/100.0
      GO TO ( 720,760 ), KX                               
  680 DO 690 I=2,7                                        
      TX1=Z2(I)                                           
      IF(X1-TX1) 700,710,690                              
  690 CONTINUE                                            
      I=8                                                 
      TX1=1.0                                             
  700 TX2=Z1(I)                                           
      XLAMBDA=TX2-((TX1-X1)/(TX1-Z2(I-1)))*(TX2-Z1(I-1))  
      GO TO ( 720,760 ), KX                               
  710 XLAMBDA=Z1(I)                                       
      GO TO( 720,760 ), KX   
  720 WRITE(*,*) X1
      WRITE (*,*) XLAMBDA
  760 END

      REAL FUNCTION RANF(I)
      RANF = RAND(I)
      RETURN
      END

      REAL FUNCTION FLOATF(I)
      FLOATF = FLOAT(I)
      RETURN
      END