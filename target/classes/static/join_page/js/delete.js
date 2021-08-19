     $('#chk_agree').change(function(){
        /* console.log('AA'); */
      var checked = $('#chk_agree').is(':checked');
      
      if(checked)
         btn_on();
      else
         btn_off();
      });
   
      var btn;
       //버튼활성화
       function btn_on() {
        btn = document.getElementById('goInsert');
        btn.disabled = false;
       }
       
       //버튼비활성화
       function btn_off() {
        btn = document.getElementById('goInsert');
        btn.disabled = 'disabled';
       }

   
       
       function Checkform() {

          if( frm.Password.value == "" ) {
             frm.Password.focus();
             alert("비밀번호를 입력해 주십시오.");
              return false;
          }
          
          if(frm.passwordConfirm.value == ''){
            alert('비밀번호 확인을 입력하세요');
            return false;
         }
          
          if(frm.Password.value != frm.passwordConfirm.value){
            alert('비밀번호와 비밀번호 확인이 다릅니다');   
             return false;
          }
         
          if( frm.nickName.value == "" ) {
             frm.nickName.focus();
             alert("닉네임을 입력해 주십시오.");
              return false;
          }
         
          if( frm.Email.value == "" ) {
             frm. Email.focus();
             alert("이메일을 입력해 주십시오.");
              return false;
          }
         
          if( frm.Address1.value == "" ) {
             frm.Address1.focus();
             alert("우편번호를 입력해 주십시오.");
              return false;
          }
          if( frm.Address2.value == "" ) {
             frm.Address2.focus();
             alert("도로명주소를 입력해 주십시오.");
              return false;
          }
         
          if( frm.Address3.value == "" ) {
             frm.Address3.focus();
             alert("상세주소를 입력해 주십시오.");
              return false;
          }
          
           
            
            // 공백제거 끝
            
         //유효성 검사            
          
          var pw = $("#Password").val();
         var id = $("#userId").val();
          var checkNumber = pw.search(/[0-9]/g);
          var checkEnglish = pw.search(/[a-z]/ig);
       
          if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(pw)){            
              alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
              return false;
          }else if(checkNumber <0 || checkEnglish <0){
              alert("숫자와 영문자를 혼용하여야 합니다.");
              return false;
          }else if(/(\w)\1\1\1/.test(pw)){
              alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
              return false;
          }else if(pw.search(id) > -1){
              alert("비밀번호에 아이디가 포함되어 있습니다.");
              return false;
          }else {

         console.log("통과");
         
         }
          
          var ph = $("#userPhone").val();
          var checkEnglishph = ph.search(/[a-z]/ig);
          var check_kor = ph.search(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/ig);

          if( checkEnglishph >0 || check_kor>0 ){
              alert("숫자만 입력가능합니다.");
              frm.phone2.focus();
              return false;
          }
          
          
       }  //ChkFrm 끝


      
       function fn_idChk(){
            $.ajax({
               url : "/idChk",
               type : "POST",
               dataType : "text",
               
               data : {"userId" : $("#userId").val()},
               success : function(data){
                  
                  if(data == "exist"){
                     alert("중복된 아이디입니다.");
                  }else if(data == "usable"){
                     alert("사용가능한 아이디입니다.");
                     $("#idChk").attr("value", "Y");
                  }
               },error: function(err){
                  console.log(err);
               }
            })
         }

              
         var pop;

         function goPopup() {
            // window.name = "부모창 이름"; 
            window.name = "parentForm";

            //pop = window.open("/resources/kit/jusoPopup2.html", "pop","width=570, height=420, scrollbars=yes");
            pop = window.open("/jusoPopup.html", "pop",
                  "width=570, height=420, scrollbars=yes");

         }

         function jusoCallBack(entX, entY) {
            var form = $('<form></form>');
            form.attr('action', '/map');
            form.attr('method', 'post');
            form.appendTo('body');
            form.append($('<input type="hidden" value="' + entX + '" name=entX>'));
            form.append($('<input type="hidden" value="' + entY + '" name=entY>'));
            form.submit();

            pop.close();
         }
       
         
         