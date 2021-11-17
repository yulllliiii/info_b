<!DOCTYPE html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<% String memberid = (String)session.getAttribute("memberid");
if(memberid != null){
   response.sendRedirect(request.getContextPath()+"/index2.do");
}
%>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>다양한 사람들의 만남 MBTING  </title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/assets/img/main/favicon1.png" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet">
        <link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />      
        <style>
        .hn{font-family: 'Hanna', sans-serif;}
        .jg{font-family: 'Jeju Gothic', sans-serif;}
        </style>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <script type="text/javascript">
          var msg = '${msg}';
      	  if (msg){
          alert(msg);   
          }

      	</script>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
		
		var fm = document.frm;
		
	     $(function() {
	         
	           fnInit();
	         
	     });
	     
	     function frm_check(){
	    	
	         saveid();
	     }
	 
	    function fnInit(){
	   
	        var cookieid = getCookie("saveid");
	        console.log(cookieid);
	        if(cookieid !=""){
	            $("input:checkbox[id='saveId']").prop("checked", true);
	            $('#memberid').val(cookieid);
	       }
	    }    
	 
	    function setCookie(name, value, expiredays) {
	        var todayDate = new Date();
	        
	        todayDate.setTime(todayDate.getTime() + 0);
	        if(todayDate > expiredays){
	            document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
	        }else if(todayDate < expiredays){
	            todayDate.setDate(todayDate.getDate() + expiredays);
	            document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
	        }
	        
	        
	        console.log(document.cookie);
	    }
	 
	    function getCookie(Name) {
	        var search = Name + "=";
	       
	        console.log("search : " + search);
	        
	        if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
	            offset = document.cookie.indexOf(search);
	            console.log("offset : " + offset);
	            if (offset != -1) { // 쿠키가 존재하면 
	                offset += search.length;
	                // set index of beginning of value
	                end = document.cookie.indexOf(";", offset);
	                console.log("end : " + end);
	                // 쿠키 값의 마지막 위치 인덱스 번호 설정 
	                if (end == -1)
	                    end = document.cookie.length;
	                console.log("end위치  : " + end);
	                
	                return unescape(document.cookie.substring(offset, end));
	            }
	        }
	        return "";
	    }
	 
	    function saveid() { //saveid함수에서는 체크박스에 체크값에 대하여 조건에 따라 시간을 구해준다.
	        var expdate = new Date();
	    	
	     
	        if ($("#saveId").is(":checked")){
	            expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
	            setCookie("saveid", $("#memberid").val(), expdate);//setCookie에서는 saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
	            }else{ //체크되어있지 않다면 -1을 해줘서 쿠키가 존재하지 않는다
	            	expdate.setTime(expdate.getTime()-1);
		            setCookie("saveid","", expdate);
	             
	        }
	    }
	 
	 
	    
	    
	</script>
		
      	  
      </script>
      
		
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script type="text/javascript">
		function check(){
		
		
			var fm = document.frm;
			
			if (fm.memberid.value == ""){
				swal("아이디를 입력해주세요"," ","warning");
				
			    fm.memberid.focus();
			    return false;		
			}else if (fm.memberpwd.value ==""){
				swal("비밀번호를 입력해주세요"," ","warning");
				fm.memberpwd.focus();
				return false;
			}
			
			fm.action="<%=request.getContextPath()%>/member/memberLoginAction.do";

			fm.method="post";
			fm.submit();	
			return;
	
		}
		</script>
		
		
		
		
    </head>
    <body id="page-top">
    
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="<%=request.getContextPath()%>/index2.do"><img src="resources/assets/img/main/logo1.png" alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <h4><a class="nav-link jg" href="<%=request.getContextPath()%>/memberLogin.do">서비스 소개</a></h4>
      			       <h4><a class="nav-link jg" href="<%=request.getContextPath()%>/memberLogin.do">게시판</a></h4>
                       <h4><a class="nav-link jg" href="<%=request.getContextPath()%>/memberLogin.do">TALK</a></h4>
                       <h4><a class="nav-link jg" href="<%=request.getContextPath()%>/memberLogin.do">상담</a></h4>
                       <h4><a class="nav-link jg" href="<%=request.getContextPath()%>/memberLogin.do">MBTI정보</a></h4>
                       <h4><a class="nav-link jg" href="<%=request.getContextPath()%>/memberLogin.do">고객센터</a></h4>
                       	<h4><a class="nav-link jg" href="<%=request.getContextPath()%>/memberLogin.do">회원정보</a></h4>
                    </ul>
                </div>
            </div>
        </nav>
        <br>
        <br>
        <br>
      	<br>
        <br>
      	<br>
      <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-4 col-lg-4 col-md-4">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->                      
                            <div class="col-lg-12">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4 jg">로그인</h1>
                                    </div>
                                    <form name="frm" id="frm" method="post" onSubmit="return frm_check();">
                                        <div class="form-group">
                                            <input type="text" class="form-control"
                                                name="memberid" id="memberid" placeholder="아이디">
                                       			 <br>
                                            <input type="password" class="form-control"
                                                name="memberpwd" placeholder="비밀번호">
                                       		 </div>
                                        <br>
                                       <div class="row">
                                         <div class="col-md-12">
                                            <div class="form-check form-check-inline">
                                                <input type="checkbox" name="saveId" id="saveId">
                                                <label class="custom-control-label" for="saveId">아이디 저장</label>
                                              
                                          	</div>
                                          <div class="form-check form-check-inline">
                                                <input type="checkbox" name="customCheck2">
                                                <label class="custom-control-label" for="customCheck2">로그인 유지</label>
                                            </div>
                                          </div>
                                        </div>
                                        <br>                                       
                                        <input type="submit" name="submit" value="로그인" class="btn btn-primary btn-user btn-block" onClick="check(); return false;" style="width:-webkit-fill-available; margin:auto; display:block";>
                                        
                                    	</form>
                                   	 <hr>
                                    <div class="text-center">
                                       <a class="small jg" href="memberJoin.do">회원가입</a>
                                       | <a class="small jg" href="memberFindId.do">아이디찾기</a>
                                       | <a class="small jg" href="memberFindPwd.do">비밀번호찾기</a>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
               </div>
			</div>
		</div>
                
    	<br>
		<br>
		
		<!-- footer -->
	<div id="footer12" style="background:#e9ecef; padding-left: 0px;">
		<div class="col-12 company-info" >
          <div class="col-12" style="padding: 0; margin-top: 24px; padding-left: 0px;  ">
              <h4>  MBTING</h4>
            </div>   
          <div class="col-12" style="padding: 0; margin-top: 24px; padding-left: 0px; ">   
      		 <h3><class="jg" > 대표 : 김신동,김선민,강유리,김정우</h3><br/>   
                <h6>사업자 등록번호 : 123-12-12345 <br/>
                <h6>연락처 : 1234-5678<br/></h6>
                <h6>사업자 : 제 123호<br/></h6>
                <h6>통신판매업신고 : 2021-전주 덕진구-1234<br/></h6>
                <h6>전북 전주시 덕진구 백제대로 572 5층<br/></h6>
         		<h6>이메일 : qwerr123@123123<br/></h6>
           		<h6>제휴문의 : qwert123@12312</h6>
                <br/>
                <br/>
          <div class="col-12 customer-call">
                <h3>엠비팅 고객문의 연락처 <a href="tel:1234-5678" style="color:#004080;">1234-5678</a></h3>
                <br/>
                <br/>
            </div>
            <div class="col-12 terms-title">
           		<h5><class="jg">이용정보 안내</h5>
                <br/>
                <a href="<%=request.getContextPath()%>/companyintroduction.do" target="_blank" style="color: #004080;">회사소개</a> | <a href="<%=request.getContextPath()%>/infoP.do" style="color: #004080;">개인정보 보호방침</a> | <a href="<%=request.getContextPath()%>/terms.do" style="color: #004080;">이용약관</a> 
            </div>  
             <br/>
          </div>     
         </div>
		</div>
	 </body>
	</html>
