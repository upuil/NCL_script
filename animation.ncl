begin  
  a   = addfile("./data/air2m-197901-201412.nc","r")
  t   = short2flt(a->air(:,0,:,:))    ;��ȡ2m����

   ;�����pdfͼ

  res                 = True    
  res@gsnLeftString   = ""      
  res@gsnRightString  = ""

  ;����趨ͬ���ĵ�ֵ�ߣ��Ա㶯��ʱ���бȽ�    

  res@cnMinLevelValF       =  195.0
  res@cnMaxLevelValF       =  328.0
  res@cnLevelSpacingF      =  2.25

  res@cnFillOn             = True    ; ��ɫ
  res@cnLinesOn            = False   ; �رյ�ֵ��
  res@cnLineLabelsOn       = False   ; ������ֵ��ǩ

  do ii=0,30
   res@tiMainString      = "January Global Surface Temperature (K) - Day " + (ii + 1)
   plot = gsn_csm_contour_map(wks,t(ii,:,:),res)
  end do
end