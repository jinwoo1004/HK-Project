// JavaScript source code - script.js
$( function () {
    //泥ル쾲吏� 諛곕꼫
    $( "#image_list_1" ).jQBanner( {//濡ㅻ쭅�� �� �곸뿭�� ID 媛�
        nWidth: 600,				//�곸뿭�� width
        nHeight: 150,				//�곸뿭�� height
        nCount: 5,					//�뚯븘媛� �대�吏� 媛쒖닔
        isActType: "up",			//��吏곸씪 諛⑺뼢 (left, right, up, down)
        nOrderNo: 1,				//珥덇린 �대�吏�
        nDelay: 2000				//濡ㅻ쭅 �쒓컙 ���� (1000 = 1珥�)
    } );
    //�먮쾲吏� 諛곕꼫
    $( "#image_list_2" ).jQBanner( {
        nWidth: 950,
        nHeight: 385,
        nCount: 5,
        isActType: "left",
        nOrderNo: 1,
        isStartAct: "N",
        isStartDelay: "Y",
        nDelay: 4000,
        isBtnType: "li"             //�덉씠釉�(踰꾪듉 ����)
    } );
    //�몃쾲吏� 諛곕꼫
    $( "#image_list_3" ).jQBanner( {
        nWidth: 600,
        nHeight: 150,
        nCount: 5,
        isActType: "right",
        nOrderNo: 1,
        isStartAct: "N",
        isStartDelay: "Y",
        nDelay: 3000,
        isBtnType: "img"
    } );
} );
