function mem_id_check(){

    var member_id = 'id';
    var member_id = eval("document.member_form." + member_id);

    if(member_id.value.length <= 4 || member_id.value.length >= 20) {
       alert('아이디는 4 ~ 20자 이내의 영문소문자나 숫자 또는 조합된 문자열이어야 합니다');
       member_id.focus();
       member_id.select();
       return false;
    }

    for(var i = 0; i < member_id.value.length; i++) {
       var chr = member_id.value.substr(i,1);         
       if((chr < '0' || chr > '9') && (chr < 'a' || chr > 'z')) {
           alert('아이디는 4 ~ 20자 이내의 영문소문자나 숫자 또는 조합된 문자열이어야 합니다');
           member_id.focus();
           member_id.select();
           return false;  
       }
    }

    if(!member_id.value) {
        alert('아이디를 입력하신 후에 확인하세요.');
        member_id.focus();
        return false;
    }
    
    return true;
}