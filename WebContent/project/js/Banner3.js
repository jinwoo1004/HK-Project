$( function () {
    var f_nBnrCnt = 0;          // jQBanner瑜� �ъ슜�댁꽌 �붾㈃�� 異쒕젰�섎뒗 諛곕꼫��

    $.f_varBanner = {
        defaults: {
            /* �대��곸쑝濡� �곗씠�� 蹂��� */
            objScr: null,       // �ㅽ겕由� �곸뿭
            objBtn: null,       // 踰꾪듉 �곸뿭
            objTimer: null,     // ���대㉧
            nOrderNo: 999,      // �꾩옱 �좏깮�� �덉씠��
            nOrderNoBtn: -1,    // 踰꾪듉 �좏깮�� �덉씠��

            /* 珥덇린�명똿�� 媛��ν븳 �꾩닔 蹂��� */
            nWidth: 0,          // 諛곕꼫 �ㅽ겕由� �곸뿭 ��
            nHeight: 0,         // 諛곕꼫 �ㅽ겕由� �곸뿭 �믪씠
            nCount: 0,          // 諛곕꼫 �ㅽ겕由� �곸뿭�� �랁빐�덈뒗 �덉씠�댁쓽 ��
            isActType: "none",  // 諛곕꼫 �≪뀡 ���� none,left,right,up,down,fade,page

            /* 珥덇린�명똿�� 媛��ν븳 �듭뀡 蹂��� */
            isShuffle: "N",         // 諛곕꼫 �덉씠�대뱾�� �뷀뵆 �щ� Y:�뷀뵆,N:�쒖감��
            isBtnAct: "mouseover",  // 踰꾪듉 �묐룞諛⑹떇 mouseover,click
            isBtnType: "img",       // 踰꾪듉 ���� img,li           
            nStartUp: 300,          // �ㅽ��� �� 泥� �덉씠�댁쓽 FadeIn �띾룄
            nDelay: 5000,           // �쒕젅��
            nSpeed: 500,            // �≪뀡�쒖쓽 �띾룄
            nSpeedFade: 300,        // �섏씠�� 愿��� �≪뀡�먯꽌 踰꾪듉 �묐룞�� �띾룄�� 怨좎젙媛� [�섎룄濡� 怨좎젙]
            isStartFade: "Y",        // �ㅽ��� FadeIn �④낵 �щ� [�꾨줈洹몃옩�쇰줈 �ㅽ겕由곗쓣 Display:block 泥섎━�� 寃쎌슦 �ъ슜]
            isStartDelay: "N"        // �ㅽ��몄떆 �쒕젅�대� 媛�吏�怨� �ㅽ뻾 [臾닿굅�� �섏씠吏��� 寃쎌슦 �쒕젅�대� 媛�吏�怨� 珥덇린��]
        }
    };

    $.fn.jQBanner = function ( defaults ) {
        var config = $.extend( {}, $.f_varBanner.defaults, defaults );
        var isIEChk = jsBrowserCheck();

        config.objScr = "#" + this.attr( "id" ) + " .clsBannerScreen";
        config.objBtn = "#" + this.attr( "id" ) + " .clsBannerButton";

        if ( config.isStartDelay == "Y" && isIEChk == true ) {
            /* �ㅽ��� �쒕젅�� 泥섎━ */
            if ( f_nBnrCnt >= 0 && f_nBnrCnt <= 3 ) {
                setTimeout( function () { jsBanInit( config ) }, f_nBnrCnt * 100 );
            } else if ( f_nBnrCnt > 3 && f_nBnrCnt <= 6 ) {
                setTimeout( function () { jsBanInit( config ) }, f_nBnrCnt * 200 );
            } else if ( f_nBnrCnt > 6 && f_nBnrCnt <= 10 ) {
                setTimeout( function () { jsBanInit( config ) }, f_nBnrCnt * 300 );
            } else if ( f_nBnrCnt > 10 ) {
                setTimeout( function () { jsBanInit( config ) }, 400 );
            }
            f_nBnrCnt++;
        } else {
            jsBanInit( config );
        }

        return this;
    };

    function jsBanInit( config ) {
        var nPosFix;

        /* 諛곕꼫 �ㅽ겕由� CSS �ㅼ젙 */
        $( config.objScr ).css( { 'position': 'relative', 'height': config.nHeight + 'px', 'width': config.nWidth + 'px', 'overflow': 'hidden' } );

        /* 泥� �덉씠�� �좏깮 */
        config.nOrderNo = ( config.nOrderNo == 999 ) ? Math.floor( Math.random() * config.nCount ) : config.nOrderNo - 1;

        /* �≪뀡 ���낆뿉 �곕Ⅸ 珥덇린 �명똿 */
        if ( config.isActType == "left" ) {
            $( config.objScr + " div" ).each( function ( i ) {
                nPosFix = ( config.nOrderNo == i ) ? 0 : config.nWidth;
                $( this ).css( { 'position': 'absolute', 'top': '0', 'left': ( -1 * nPosFix ) + 'px' } );
                if ( !( config.nOrderNo == i && config.isStartFade == "N" ) ) {
                    $( this ).fadeIn( config.nStartUp );
                }
                $( this ).attr( "divno", i );
            } );
        } else if ( config.isActType == "right" ) {
            $( config.objScr + " div" ).each( function ( i ) {
                nPosFix = ( config.nOrderNo == i ) ? 0 : config.nWidth;
                $( this ).css( { 'position': 'absolute', 'top': '0', 'left': nPosFix + 'px' } );
                if ( !( config.nOrderNo == i && config.isStartFade == "N" ) ) {
                    $( this ).fadeIn( config.nStartUp );
                }
                $( this ).attr( "divno", i );
            } );
        } else if ( config.isActType == "up" ) {
            $( config.objScr + " div" ).each( function ( i ) {
                nPosFix = ( config.nOrderNo == i ) ? 0 : config.nHeight;
                $( this ).css( { 'position': 'absolute', 'top': ( -1 * nPosFix ) + 'px', 'left': '0' } );
                if ( !( config.nOrderNo == i && config.isStartFade == "N" ) ) {
                    $( this ).fadeIn( config.nStartUp );
                }
                $( this ).attr( "divno", i );
            } );
        } else if ( config.isActType == "down" ) {
            $( config.objScr + " div" ).each( function ( i ) {
                nPosFix = ( config.nOrderNo == i ) ? 0 : config.nHeight;
                $( this ).css( { 'position': 'absolute', 'top': nPosFix + 'px', 'left': '0' } );
                if ( !( config.nOrderNo == i && config.isStartFade == "N" ) ) {
                    $( this ).fadeIn( config.nStartUp );
                }
                $( this ).attr( "divno", i );
            } );
        } else if ( config.isActType == "fade" ) {
            $( config.objScr + " div" ).each( function ( i ) {
                if ( config.nOrderNo == i ) {
                    nPosFix = 0;
                    if ( !( config.nOrderNo == i && config.isStartFade == "N" ) ) {
                        $( this ).fadeIn( config.nStartUp );
                    }
                } else {
                    nPosFix = config.nWidth;
                }
                $( this ).css( { 'position': 'absolute', 'top': '0', 'left': nPosFix + 'px' } );
                $( this ).attr( "divno", i );
            } );
        } else if ( config.isActType == "page" ) {
            $( config.objScr + " div" ).each( function ( i ) {
                nPosFix = ( config.nOrderNo == i ) ? 0 : config.nHeight;
                $( this ).css( { 'position': 'absolute', 'top': nPosFix + 'px', 'left': '0' } );
                if ( !( config.nOrderNo == i && config.isStartFade == "N" ) ) {
                    $( this ).fadeIn( config.nStartUp );
                }
                $( this ).attr( "divno", i );
            } );
        } else if ( config.isActType == "none" ) {
            $( config.objScr + " div" ).each( function ( i ) {
                if ( config.nOrderNo == i ) {
                    nPosFix = 0;
                    if ( !( config.nOrderNo == i && config.isStartFade == "N" ) ) {
                        $( this ).fadeIn( config.nStartUp );
                    }
                } else {
                    nPosFix = config.nWidth;
                }
                $( this ).css( { 'position': 'absolute', 'top': '0', 'left': nPosFix + 'px' } );
                $( this ).attr( "divno", i );
            } );
        }

        /* 踰꾪듉 �쒕쾲 �ㅼ젙 */
        $( config.objBtn + " " + config.isBtnType ).each( function ( i ) { $( this ).attr( "btnno", i ); $( this ).css( "cursor", "hand" ) } );

        /* 踰꾪듉 諛붿씤�� */
        jsBanBtnBind( config );

        /* �ㅽ겕由� pause 諛붿씤�� */
        jsScrPauseBind( config );

        /* 諛곕꼫 ���대㉧ �깅줉 諛� �≪뀡 �쒖옉 */
        if ( config.isActType != "none" && config.isActType != "page" ) {
            config.objTimer = setTimeout( function () { jsBanTimer( config ) }, config.nDelay );
        }
    };

    /* 諛곕꼫 ���대㉧ */
    function jsBanTimer( config ) {
        /* 踰꾪듉 �≪뀡 �쒕쾲�� 珥덇린�� */
        config.nOrderNoBtn = -1;

        jsBanAction( config );
        config.objTimer = setTimeout( function () { jsBanTimer( config ) }, config.nDelay );
    };

    /* 諛곕꼫 �≪뀡 泥섎━ */
    function jsBanAction( config ) {
        var nPageSel;
        var nSpeed = config.nSpeed;
        var nDivNoSel = config.nOrderNo;
        var nOrderNext = ( config.nOrderNo + 1 ) % ( config.nCount );

        /* 'page' �≪뀡�� 寃쎌슦 �좏깮 �섏씠吏� 異붿텧 */
        if ( config.isActType == "page" ) {
            var nOrderMinus = config.nOrderNoBtn - config.nOrderNo;
            nPageSel = ( nOrderMinus == 1 || ( nOrderMinus == ( config.nCount - 1 ) * -1 ) ) ? 1 : 0;
        }

        if ( config.nOrderNoBtn >= 0 ) {
            config.nOrderNo = config.nOrderNoBtn;
            nOrderNext = config.nOrderNoBtn;
            nSpeed = ( config.isActType == "fade" || config.isActType == "page" || config.isActType == "none" ) ? config.nSpeedFade : 0;
        } else {
            config.nOrderNo = ( ( config.nCount - 1 ) == config.nOrderNo ) ? nOrderNext : config.nOrderNo + 1;
        }

        var nDivNoNext = nOrderNext;

        var objSelObj = $( config.objScr + " div[divno='" + nDivNoSel + "']" );
        var objNextObj = $( config.objScr + " div[divno='" + nDivNoNext + "']" );

        /* �≪뀡�� �섑븳 踰꾪듉 �좏깮 */
        if ( config.isActType != "page" ) {
            jsBanBtnRO( config, nOrderNext );
        }

        /* �ㅼ젣 �ㅽ겕由� �덉씠�대뱾�� �숈옉 泥섎━ */
        if ( config.isActType == "left" ) {
            objNextObj.css( 'left', ( config.nWidth ) + 'px' );
            objSelObj.animate( { 'left': ( -1 * config.nWidth ) + 'px' }, nSpeed );
            objNextObj.animate( { 'left': '0' }, nSpeed );
        } else if ( config.isActType == "right" ) {
            objNextObj.css( 'left', ( -1 * config.nWidth ) + 'px' );
            objSelObj.animate( { 'left': config.nWidth + 'px' }, nSpeed );
            objNextObj.animate( { 'left': '0' }, nSpeed );
        } else if ( config.isActType == "up" ) {
            objNextObj.css( 'top', config.nHeight + 'px' );
            objSelObj.animate( { 'top': ( -1 * config.nHeight ) + 'px' }, nSpeed );
            objNextObj.animate( { 'top': '0' }, nSpeed );
        } else if ( config.isActType == "down" ) {
            objNextObj.css( 'top', ( -1 * config.nHeight ) + 'px' );
            objSelObj.animate( { 'top': config.nHeight + 'px' }, nSpeed );
            objNextObj.animate( { 'top': '0' }, nSpeed );
        } else if ( config.isActType == "fade" ) {
            objSelObj.css( { 'left': config.nWidth + 'px', 'display': 'none' } );
            objNextObj.css( 'left', '0' );
            objNextObj.fadeIn( nSpeed );
        } else if ( config.isActType == "page" ) {
            if ( nPageSel == 0 ) {
                objNextObj.css( { 'top': '0', 'left': config.nWidth + 'px' } );
                objSelObj.animate( { 'left': ( -1 * config.nWidth ) + 'px' }, nSpeed );
                objNextObj.animate( { 'left': '0' }, nSpeed );
            } else if ( nPageSel == 1 ) {
                objNextObj.css( { 'top': '0', 'left': ( -1 * config.nWidth ) + 'px' } );
                objSelObj.animate( { 'left': config.nWidth + 'px' }, nSpeed );
                objNextObj.animate( { 'left': '0' }, nSpeed );
            }
        } else if ( config.isActType == "none" ) {
            objSelObj.css( { 'left': config.nWidth + 'px', 'display': 'none' } );
            objNextObj.css( 'left', '0' );
            objNextObj.fadeIn( nSpeed );
        }
    }

    /* �ㅽ겕由� pause 諛붿씤�� */
    function jsScrPauseBind( config ) {
        /* �ㅽ겕由곗뿉 ���� 泥섎━ */
        $( config.objScr ).mouseover( function () {
            clearTimeout( config.objTimer );
        } );
        $( config.objScr ).mouseout( function () {
            if ( config.isActType != "none" && config.isActType != "page" ) {
                config.objTimer = setTimeout( function () { jsBanTimer( config ) }, config.nDelay );
            }
        } );
    }

    /* 踰꾪듉 諛붿씤�� */
    function jsBanBtnBind( config ) {
        /* 珥덇린 踰꾪듉 �ㅼ젙 */
        if ( config.isActType != "page" ) {
            jsBanBtnRO( config, config.nOrderNo );
        }

        /* 踰꾪듉�� ���� 留덉슦�� �ㅻ쾭�� 寃쎌슦 泥섎━ */
        if ( config.isBtnAct == "mouseover" ) {
            /* 踰꾪듉�� ���� 泥섎━ */
            $( config.objBtn + " " + config.isBtnType ).mouseover( function () {
                var nImgNo = $( this ).attr( "btnno" );

                if ( config.isActType != "none" && config.isActType != "page" ) {
                    clearTimeout( config.objTimer );
                }

                if ( config.isActType == "page" ) {
                    if ( nImgNo == 0 ) {
                        config.nOrderNoBtn = ( ( config.nOrderNo - 1 ) < 0 ) ? config.nCount - 1 : config.nOrderNo - 1;
                    } if ( nImgNo == 1 ) {
                        config.nOrderNoBtn = ( ( config.nOrderNo + 1 ) == config.nCount ) ? ( config.nOrderNo + 1 ) % config.nCount : config.nOrderNo + 1;
                    }
                    jsBanBtnRO( config, nImgNo );
                } else {
                    config.nOrderNoBtn = parseInt( nImgNo );
                }

                jsBanAction( config );
            } );
            $( config.objBtn + " " + config.isBtnType ).mouseout( function () {
                if ( config.isActType != "none" && config.isActType != "page" ) {
                    config.objTimer = setTimeout( function () { jsBanTimer( config ) }, config.nDelay );
                }
            } );

            /* 踰꾪듉�� ���� �대┃�� 寃쎌슦 泥섎━ */
        } else if ( config.isBtnAct == "click" ) {
            $( config.objBtn + " " + config.isBtnType ).click( function () {
                var nImgNo = $( this ).attr( "btnno" );

                if ( config.isActType != "none" && config.isActType != "page" ) {
                    clearTimeout( config.objTimer );
                }

                if ( config.isActType == "page" ) {
                    if ( nImgNo == 0 ) {
                        config.nOrderNoBtn = ( ( config.nOrderNo - 1 ) < 0 ) ? config.nCount - 1 : config.nOrderNo - 1;
                    } if ( nImgNo == 1 ) {
                        config.nOrderNoBtn = ( ( config.nOrderNo + 1 ) == config.nCount ) ? ( config.nOrderNo + 1 ) % config.nCount : config.nOrderNo + 1;
                    }
                    jsBanBtnRO( config, nImgNo );
                } else {
                    config.nOrderNoBtn = parseInt( nImgNo );
                }

                jsBanAction( config );

                if ( config.isActType != "none" && config.isActType != "page" ) {
                    config.objTimer = setTimeout( function () { jsBanTimer( config ) }, config.nDelay );
                }
            } );
        }
    };

    /* 踰꾪듉 濡ㅼ삤踰� 泥섎━ */
    function jsBanBtnRO( config, nSel ) {
        if ( config.isBtnType == "img" ) {
            $( config.objBtn + " img" ).each( function ( i ) {
                if ( nSel == i ) {
                    $( this ).attr( "src", $( this ).attr( "oversrc" ) );
                } else {
                    $( this ).attr( "src", $( this ).attr( "outsrc" ) );
                }
            } );

        } else if ( config.isBtnType == "li" ) {
            $( config.objBtn + " li" ).each( function ( i ) {
                if ( nSel == i ) {
                    $( this ).attr( "class", $( this ).attr( "overclass" ) );
                } else {
                    $( this ).attr( "class", $( this ).attr( "outclass" ) );
                }
            } );

        }
    }

    /* 援щ쾭��(5.5~8) IE 泥댄겕 */
    function jsBrowserCheck() {
        appname = navigator.appName;
        useragent = navigator.userAgent;

        if ( appname == "Microsoft Internet Explorer" ) appname = "IE";
        IE55 = ( useragent.indexOf( 'MSIE 5.5' ) > 0 );  //5.5 踰꾩쟾
        IE6 = ( useragent.indexOf( 'MSIE 6' ) > 0 );     //6.0 踰꾩쟾
        IE7 = ( useragent.indexOf( 'MSIE 7' ) > 0 );     //7.0 踰꾩쟾
        IE8 = ( useragent.indexOf( 'MSIE 8' ) > 0 );     //8.0 踰꾩쟾

        if ( appname == "IE" && IE55 || IE6 || IE7 || IE8 ) {
            return true
        } else {
            return false;
        }
    }
} );
