(function doSomething($) {
	var questions = null;
	var answers = [];
	var currentQuestion = 0;
	var hasVoted = (localStorage.getItem('vote') == null) ? false : true;

	var getQuestions = function() {
		$.ajax({
			url: "api/get.php",
			method: "GET"
		}).done(function(data) {
			questions = data;
			drawNextQuestion(0);
		});
	};

	var drawNextQuestion = function(index) {

		if ((typeof index !== 'undefined')) {
			currentQuestion = index;
		}

		if(hasVoted || currentQuestion == null || currentQuestion >= questions.length) {
			$('.after-vote-message').fadeIn( 'slow' );
			if(!hasVoted) {

				$.ajax({
					url: "api/set.php",
					method: "POST",
					data: {
						jsondata: JSON.stringify(answers)
					}
				}).done(function() {
					window.localStorage.setItem('vote', 'yes');
				});
			}
		}else {
			$(".question").html(questions[currentQuestion].value);
			$(".question").data("question-id", questions[currentQuestion].id);
			$(".voting").html(questions[currentQuestion].answer_options);

			$('.question').slideDown( 500 , function(){
				$('.voting').slideDown( 1000 );
			});

			$(".next").click(function(e) {
				var question = currentQuestion;
				var value = "";
				var questionId = $(".question").data("question-id");

				if ($(this).hasClass("select")) {

					value = $(".voting .answer").val();

				}else if ($(this).hasClass("checkbox")) {

					$( ".answer:checked" ).each(function() {
					  value += $( this ).val() + ", ";
					});

					var other = $( ".answer.other" ).val();

					if(other != '') {
						 value += other;
					}else {
						value = value.substring(0, value.length - 2);
					}

				}else if ($(this).hasClass("bool")) {

					value = $(this).data("vote");

				}

				answers.push({
					question: questionId,
					answer: value
				});

				currentQuestion++;

				$('.voting').fadeOut( 'fast' );
				$('.question').fadeOut( 'fast', function() {
						drawNextQuestion();
				});
			});
		}
	}

	getQuestions();
})(jQuery);


/*(function doSomething($) {
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
*/
