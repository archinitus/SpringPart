/**
 * 
 */

$(function() {
    var pusher = new Pusher(PUSHER_KEY)
        testChannel =pusher.subscribe('test_channel'),
        $window = $(window),
        $messages = $('.messages'),
        $inputMessage = $('.inputMessage'),
        chatPage = $('.chat.page');


    var initial_delay = 1500;
    setTimeout(function () {
        addChatMessage({'username':'lee', 'message':'hi?'});
    },initial_delay + 500)
    setTimeout(function () {
        addChatMessage({'username':'hong', 'message':'hello?'});
    },initial_delay + 1000)
    setTimeout(function () {
        addChatMessage({'username':'hone', 'message':'whats up?'});
    },initial_delay + 1500)
    setTimeout(function () {
        addChatMessage({'username':'le', 'message':'????'});
    },initial_delay + 2000)

    testChannel.bind('echo', function(data) {
        data['username'] = "iamuser";
        addChatMessage(data);
    });

    setTimeout(function () {
        $.post('/ajou/api/echo', {"message":"Hello World!"});
    },initial_delay +  4000)
    setTimeout(function () {
        $.post('/ajou/api/echo', {"message":"dfasdf"});
    },initial_delay +  5000)
    setTimeout(function () {
        $.post('/ajou/api/echo', {"message":"asdfasdfasdf"});
    },initial_delay +  6000)

    function addChatMessage(data) {
        var $usernameDiv = $('<span class="username"></span>');
        $usernameDiv.css("color", getUsernameColor(data.username));
        $usernameDiv.text(data.username);

        var $messageBodyDiv = $('<span class="messageBody"></span>');
        $messageBodyDiv.text(data.message);

        var typingClass = data.typing ? 'typing' : '';
        var $messageDiv = $('<li class="message ' + typingClass + '"></li>');
        $messageDiv.append($usernameDiv)
            .append($messageBodyDiv)
            .data('username', data.username);

        addMessageElement($messageDiv);
    }

    function addMessageElement(el) {
        var $el = $(el);
        $messages.append($el);

        $messages[0].scrollTop = $messages[0].scrollHeight;
    }

    function getUsernameColor(username) {
        // Compute hash code
        var hash = 7;
        for (var i = 0; i < username.length; i++) {
            hash = username.charCodeAt(i) + (hash << 5) - hash;
        }
        // Calculate color
        var index = Math.abs(hash % 360);
        return "hsl(" + index + ", 77%, 60%)";
    }
    
    function sendMessage() {
    	var message = $inputMessage.val().trim();
    	
    	if(message) {
    		$inputMessage.val('');
    		$.post('/ajou/api/echo', {"message":message});
    	}
    }
    
    $window.keydown(function(event) {
    	if(event.which === 13) {
    		sendMessage();
    	}
    });
});