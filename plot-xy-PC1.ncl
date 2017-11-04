begin
  ncdf = addfile("SLP-PC1-jan-34yr.nc","r")    
  AOI = ncdf->AOI
  
   ; 9��ʾ9���㻬��ƽ����������Ӧ����9��Ļ�����0��ʾ��ǰ�����4�꽫��Ϊȱʡ
  
  ;;;;;;;;;plot;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
  wks = gsn_open_wks("eps","plot-xy-AOI")
  gsn_define_colormap(wks,"rainbow")  
         
  res           = True              
  res@gsnDraw   = False ; �ݲ���
  res@gsnFrame  = False ; �ݲ���ҳ
  
  res2 = res
  
  res@vpHeightF = 0.35  ; �ı�viewport�Ĵ�С
  res@vpWidthF 	= 0.6   ; 

  res@trXMinF	  = 1979  ; �趨X�����귶Χ
  res@trXMaxF	  = 2012
  res@trYMaxF   = 3  ; �趨Y�����귶Χ
  res@trYMinF   = -3 

  ;�趨������С��0ʱ����ɫ
            ; �趨�ο�ֵ��
            ; ���ڸòο�ֵ���õ���ɫ
            ; С�ڸòο�ֵ���õ���ɫ

  res@tiXAxisString	= "year"   ; ����X������   
  res@tiYAxisString	= "AOI"    ; ����Y������ 
  
  plot = gsn_csm_xy(wks,AOI&year,AOI,res)       
  
  res2@xyLineColor = "black"
  res2@xyLineThicknessF = 4. 
  plot_mean = gsn_csm_xy(wks,AOI&year,AOI_mean,res2)
  overlay(plot,plot_mean)
    
  draw(plot) 
  frame(wks)  
end