function mem_id_check(){

    var member_id = 'id';
    var member_id = eval("document.member_form." + member_id);

    if(member_id.value.length <= 4 || member_id.value.length >= 20) {
       alert('���̵�� 4 ~ 20�� �̳��� �����ҹ��ڳ� ���� �Ǵ� ���յ� ���ڿ��̾�� �մϴ�');
       member_id.focus();
       member_id.select();
       return false;
    }

    for(var i = 0; i < member_id.value.length; i++) {
       var chr = member_id.value.substr(i,1);         
       if((chr < '0' || chr > '9') && (chr < 'a' || chr > 'z')) {
           alert('���̵�� 4 ~ 20�� �̳��� �����ҹ��ڳ� ���� �Ǵ� ���յ� ���ڿ��̾�� �մϴ�');
           member_id.focus();
           member_id.select();
           return false;  
       }
    }

    if(!member_id.value) {
        alert('���̵� �Է��Ͻ� �Ŀ� Ȯ���ϼ���.');
        member_id.focus();
        return false;
    }
    
    return true;
}