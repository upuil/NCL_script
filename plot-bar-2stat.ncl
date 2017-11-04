begin

  name = (/"Beijing","Shanghai"/)  
  irec = (/33,56/) -1    ; ָ��Ҫ������̨վ
  fp  = (/6,17/)         ; ָ�������ͼʱ������ͼ�������������̨վ��ֱ��ͼ
  co  = (/"black","gray"/) ; ָ��������ɫ
  
  syear = ispan(1980,2000,10) ; ָ��Ҫ��������ݣ�Ҳ��ֱ�Ӹ�ֵ(/1980,1990,2000/)
  nyear = dimsizes(syear)

  ntime = 30   ; ��30��ʱ��
  nstat = 160  ; ��160վ
    
  ;��ȡȫ�����ݣ�ע�����ݴ�ŵ�·���������д����./data ��
  preci = fbindirread("./data/preci-160-JJA-30yr.grd",0,(/ntime,nstat/),"float") 
  
  ;�ֶ�����meta data
  preci!0="year" 
  preci!1="station"
  preci&year = ispan(1979,2008,1)
  preci&station = ispan(1,160,1)
  
  ; ����������վ���ض���ݵ����ݣ�����������named dimension ������˳�������ת��
  preci_st = preci(station|irec,{year|syear}) 
  ndim = dimsizes(preci_st)
  
;***************************************************** 
  wks = gsn_open_wks("eps","plot-bar-2stat")                 ; create plot
    
  res                    = True              ; plot mods desired
  res@gsnDraw            = False             ; don't draw yet
  res@gsnFrame           = False             ; don't advance frame yet

  res@vpWidthF  = 0.7
  res@vpHeightF = 0.5

  res@trXMinF = 0.5
  res@trXMaxF = 3.5
  res@trYMinF = 0
  res@trYMaxF = 900
  
  res@tmXBMode     = "Explicit"         ; ָ�������ǩ 
  res@tmXBValues   = ispan(1,nyear,1)   ;
  res@tmXBLabels   = ispan(1980,2000,10); 

  res@tiXAxisString	= "year"             ; ����X������   
  res@tiYAxisString	= "precipitation (units: mm)"    ; ����Y������ 
     
  bw = 0.2
  res@gsnXYBarChart         = True  
  res@gsnXYBarChartBarWidth = bw ;           ; �趨bar�Ŀ���
  res@gsnXYBarChartPatterns = fp(0)
  res@gsnXYBarChartColors   = co(0)	
  res@gsnXYBarChartOutlineThicknessF = 1
  plot1 = gsn_csm_xy(wks,ispan(1,nyear,1)-bw/2,preci_st(0,:),res)		; ÿһ��̨վ��Ҫ������һ��
  
  res@gsnXYBarChartPatterns = fp(1)
  res@gsnXYBarChartColors   = co(1)				 ; �ò�ͬ��ɫ
  plot2 = gsn_csm_xy(wks,ispan(1,nyear,1)+bw/2,preci_st(1,:),res)		;
 
 ;��ֱ��ͼ���������֣�������Ӧ�Ľ�ˮ��
 txres               = True                            
 txres@txFontHeightF = 0.015    ; �趨�����С

 label_value = ndtooned(preci_st)    
 label = floattointeger(label_value) ; ����warning���֣�����Ӱ���ͼ��
 
 ;; ����û��軭���̨վ���������ж��������鼰���������޸�
    ; �½�һ����preci_stһ����С������
 
 
 
         ; ����Ų��           
 
 
 ; �ڿհ״��ֶ�����ͼ��
 lbres                    = True          
 lbres@vpWidthF           = 0.3           ; viewport�Ŀ���
 lbres@vpHeightF          = 0.1           ; viewport�Ŀ��߶�
 lbres@lbBoxMajorExtentF  = 0.36          ; ��Сͼ����ʹ���м���Щ�հ�

 lbres@lbMonoFillPattern  = True          ; Solid fill pattern
 lbres@lbLabelFontHeightF = 0.015          ; ��ǩ�����С
 lbres@lbPerimOn          = False         ; ��Χ�Ƿ���Ϸ���
 ;lbres@lgPerimColor 	    = "black"       ; �������ɫ
 
 lbres@lbFillPattern   = fp(1)  
 lbres@lbFillColors    = co(1)  
  	;��2��������ʾֻ��1��laberbar box
 
 lbres@lbFillPattern   = fp(0)
 lbres@lbFillColors    = co(0)   
  	; �������ֱ��ͼ��labelbar 

 draw(plot1)
 draw(plot2)                                   
                                      
 frame(wks)         
 
end