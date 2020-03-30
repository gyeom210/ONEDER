$("document").ready(function(){
	var category = $(".zz").text();
	$('ul.community_menubar li a').click(function()  {
		category = $(this).parent().attr('data-tab'); //클릭한 게시판 이름
		window.location.href = "community.co?category="+category;
	});
	$("li:contains('" + category + "')").addClass('active');
}); //ready

