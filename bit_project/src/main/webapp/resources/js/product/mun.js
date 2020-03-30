/*
  $('#f1').click(function(){
    if($("input:checkbox[id='f1']").is(":checked") == true){
    document.getElementById("tier").innerHTML = "실버";
    
    }else {
        document.getElementById("tier").innerHTML = "";
    }
  });
*/
function Chk(checknum) {
  var result = "";
  var chkbox = $(".c" + checknum);
  for (i = 0; i < chkbox.length; i++) {
    if (chkbox[i].checked == true) {
      result += chkbox[i].value;
      result += " ";
    }
  }
  if (checknum == 1) {
    document.getElementById("tier").innerHTML = result;
  } else if (checknum == 2) {
    document.getElementById("age").innerHTML = result;
  } else if (checknum == 3) {
    document.getElementById("type").innerHTML = result;
  }
  // input hidden의 id나 class 넣고 result값 세팅해주면 됨.    $('#tier').val(result);
}
// $(":input:checkbox[name=check1]:checked").val();
//$(test1).prop("checked");
//$(test1).is(":checked");




/*
if($("input:checkbox[name='체크박스이름']").is(":checked") == true){
 
요소 네임을 이용한 체크
 
}
*/

/*
 $('.select').click(function(){
     var a = document.getElementById("list");
     if(a.style.display=='none') {
         a.style.display = 'block';              
         
     } else {
         a.style.display = 'none';                
         
     }
     
 return false;
 });
*/
function select(params) {
  var _1 = document.getElementById('list1');
  var _2 = document.getElementById('list2');
  var _3 = document.getElementById('list3');
  var _4 = document.getElementById('list4');

  if (params == 1) {
    if (_1.style.display == 'none') {
      _1.style.display = 'block';
      _2.style.display = 'none';
      _3.style.display = 'none';
      _4.style.display = 'none';
    } else {
      _1.style.display = 'none';
      _2.style.display = 'none';
      _3.style.display = 'none';
      _4.style.display = 'none';
    }
  } else if (params == 2) {
    if (_2.style.display == 'none') {
      _1.style.display = 'none';
      _2.style.display = 'block';
      _3.style.display = 'none';
      _4.style.display = 'none';
    } else {
      _1.style.display = 'none';
      _2.style.display = 'none';
      _3.style.display = 'none';
      _4.style.display = 'none';
    }
  } else if (params == 3) {
    if (_3.style.display == 'none') {
      _1.style.display = 'none';
      _2.style.display = 'none';
      _3.style.display = 'block';
      _4.style.display = 'none';
    } else {
      _1.style.display = 'none';
      _2.style.display = 'none';
      _3.style.display = 'none';
      _4.style.display = 'none';
    }

  } else if (params == 4) {
    if (_4.style.display == 'none') {
      _1.style.display = 'none';
      _2.style.display = 'none';
      _3.style.display = 'none';
      _4.style.display = 'block';
    } else {
      _1.style.display = 'none';
      _2.style.display = 'none';
      _3.style.display = 'none';
      _4.style.display = 'none';
    }

  } else {
    _1.style.display = 'none';
    _2.style.display = 'none';
    _3.style.display = 'none';
    _4.style.display = 'none';
  }
}
function formReset() {
  $("#categoryListForm")[0].reset();
  var _a = document.getElementById('list1');
  var _b = document.getElementById('list2');
  var _c = document.getElementById('list3');
  var _d = document.getElementById('list4');
  _a.style.display = 'none';
  _b.style.display = 'none';
  _c.style.display = 'none';
  _d.style.display = 'none';
  document.getElementById("tier").innerHTML = '';
  document.getElementById("age").innerHTML = '';
  document.getElementById("type").innerHTML = '';
  document.getElementById("sort").innerHTML = '';

}
function productSort(param1, param2) {
  document.getElementById('list4').style.display = 'none';
  document.getElementById("sort").innerHTML = param2;

}



//document.getElementById("tier").innerHTML = "변경된 span값";
//document.getElementById("age").innerHTML = "변경된 span값";
//document.getElementById("type").innerHTML = "변경된 span값";

/* 전체선택 해제
  <input type="checkbox" id="check_all" class="input_check"><label for="check_all"><b>전체선택</b></label>
<ul class="select_subject">
    <input type="checkbox" class="input_check" name="class1" id="check1" value="1"><label for="check1"><b>1</b></label>
    <input type="checkbox" class="input_check" name="class2" id="check2" value="2"><label for="check2"><b>2</b></label>
</ul>


$(function(){
    $("#check_all").click(function(){
        var chk = $(this).is(":checked");
        if(chk){
            $(".select_subject input").prop('checked', true);
        } else {
            $(".select_subject input").prop('checked', false);
        }
    });
});
*/

/* 모바일용 필터 체크박스 눌렀을 떄 기존 필터에 입력한 정보 그대로 남아있음 */
$('#menu_state').click(function () {
  var fil = document.getElementById('mFilter_menu');
  if (fil.style.display == 'none') {
	  $('#mFilter label[for="menu_state"] i').css("right", "0px");
    fil.style.display = 'block';
    $('.fildivision').show();
  } else {
	  $('#mFilter label[for="menu_state"] i').css("right", "-16px");
    fil.style.display = 'none';
    $('.fildivision').hide();
  }
});

/* 필터에서 x 눌렀을 때. 필터 내용 초기화 및 필터 창 꺼짐.  */
/*
function testfun() {
 // var fil = document.getElementById('mFilter_menu');
  var _a1 = document.getElementById('mFilter_menu_list1');
  var _b1 = document.getElementById('mFilter_menu_list2');
  var _c1 = document.getElementById('mFilter_menu_list3');
  _a1.style.display = 'none';
  _b1.style.display = 'none';
  _c1.style.display = 'none';
  document.getElementById("mtier").innerHTML = '';
  document.getElementById("mage").innerHTML = '';
  document.getElementById("mtype").innerHTML = '';
  //fil.style.display = 'none';
  $('#mFilter_menu').css("display", "none");
  $('.fildivision').css("display", "none");
  
  //fil_nav.style.background = '#fff';
  $("#testForm")[0].reset();

}
*/
// 필터 초기화 되고 필터창은 그대로 남아있음.
function fclear() {
  //필터 선택 span 초기화
  //$("#testForm")[0].reset();
  // li display none
  var fil_list1 = document.getElementById('mFilter_menu_list1');
  var fil_list2 = document.getElementById('mFilter_menu_list2');
  var fil_list3 = document.getElementById('mFilter_menu_list3');
  fil_list1.style.display = 'none';
  fil_list2.style.display = 'none';
  fil_list3.style.display = 'none';
  $("#mFilter_menu input[type=checkbox]").removeAttr("checked");
  document.getElementById("mtier").innerHTML = '';
  document.getElementById("mage").innerHTML = '';
  document.getElementById("mtype").innerHTML = '';
}

$('#mFilter_menu_li1').click(function () {
  var fil_list1 = document.getElementById('mFilter_menu_list1');
  if (fil_list1.style.display == 'none') {
    fil_list1.style.display = 'block';
  } else {
    fil_list1.style.display = 'none';
  }
});

$('#mFilter_menu_li2').click(function () {
  var fil_list2 = document.getElementById('mFilter_menu_list2');
  if (fil_list2.style.display == 'none') {
    fil_list2.style.display = 'block';
  } else {
    fil_list2.style.display = 'none';
  }
});

$('#mFilter_menu_li3').click(function () {
  var fil_list3 = document.getElementById('mFilter_menu_list3');
  if (fil_list3.style.display == 'none') {
    fil_list3.style.display = 'block';
  } else {
    fil_list3.style.display = 'none';
  }
});

function mChk(checknum) {
  var result = "";
  var chkbox = $(".m" + checknum);
  for (i = 0; i < chkbox.length; i++) {
    if (chkbox[i].checked == true) {
      result += chkbox[i].value;
      result += " ";
    }
  }
  if (checknum == 1) {
    document.getElementById("mtier").innerHTML = result;
  } else if (checknum == 2) {
    document.getElementById("mage").innerHTML = result;
  } else if (checknum == 3) {
    document.getElementById("mtype").innerHTML = result;
  }
  // input hidden의 id나 class 넣고 result값 세팅해주면 됨.    $('#tier').val(result);
}
/* 모바일용 필터 */


