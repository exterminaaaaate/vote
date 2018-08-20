(function doSomething($) {
	$("#vote-yes").click(function(e) {setVote('yes')});
	$("#vote-no").click(function(e) {setVote('no')});

	var setVote = function(option) {
		window.localStorage.setItem('vote', 'yes');
		$.ajax({
			url: "api/set.php",
			method: "POST",
			data: { vote: option }
		}).done(function() {
			afterVoteEvent();
		});
	}

	var afterVoteEvent = function() {
		$('.question').fadeOut();
		$('.voting').slideUp( function(){
			$('.after-vote-message').slideDown( 'slow' );
		});
	}

	var prevVote = localStorage.getItem('vote');
	if (prevVote != null) {
		$('.voting').fadeOut( 'fast' );
		$('.question').fadeOut( 'fast' );
		$('.after-vote-message').fadeIn( 'slow' );
	}else {
		$('.question').slideDown( 500 , function(){
			$('.voting').slideDown( 1000 );
		});
	}


})(jQuery);
