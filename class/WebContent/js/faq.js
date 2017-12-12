jQuery(function($){
	// Frequently Asked Question
	var board = $('#faq_articles>#faq_menu>#faq_body>.faq_board');
	board.addClass('hide');
	board.find('.A').hide();
	board.eq(0).removeClass('hide');
	board.eq(0).find('.A').show();
	$('#faq_articles>#faq_menu>#faq_body>.faq_board>.question>.Q>.A').click(function(){
		var myBoard = $(this).parents('.question:first');
		if(myBoard.hasClass('hide')){
			board.addClass('hide').removeClass('show');
			board.find('.A').slideUp(100);
			myBoard.removeClass('hide').addClass('show');
			myBoard.find('.A').slideDown(100);
		} else {
			myBoard.removeClass('show').addClass('hide');
			myBoard.find('.A').slideUp(100);
		}
		return false;
	});
	$('.faq>.faqHeader>.showAll').click(function(){
		var hidden = $('#faq_articles>#faq_menu>#faq_body>.faq_board>.question.hide').length;
		if(hidden > 0){
			article.removeClass('hide').addClass('show');
			article.find('.A').slideDown(100);
		} else {
			article.removeClass('show').addClass('hide');
			article.find('.A').slideUp(100);
		}
	});
});