
$(function() {
    var pusher = new Pusher(PUSHER_KEY),
        testChannel =pusher.subscribe('test_channel'),
        broadcast = pusher.subscribe('br');
        $window = $(window),
        $messages = $('.messages'),
        $inputMessage = $('.inputMessage'),
        chatPage = $('.chat.page');
        
    var username = userName;
    	useremail = userEmail;
    
    broadcast.bind('new_message', function(data) {
    	addChatMessage(data);
    });
    
    broadcast.bind('user_entered', function(data) {
    	addNotice(data);
    });
    
    function addNotice(data) {
    	var $messageDiv = $('<span class="messageBody"></span>');
    	$messageDiv.text("-------- " + data.username + "(" + data.useremail + ") " + " has just entered this chat --------");
    	
    	addMessageElement($messageDiv);
    }
    
    
    function addChatMessage(data) {
        var $usernameDiv = $('<span class="username"></span>');
        $usernameDiv.css("color", getUsernameColor(data.username));
        $usernameDiv.text(data.username);
        
        var $messageBodyDiv = $('<span class="messageBody"></span>');
        $messageBodyDiv.text(data.message);
        
        var $messageDiv = $('<li class="message"></li>');
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
    		$.post('/ajou/chat/new_message', {"message":message, "username":username, "useremail":useremail});
    	}
    }
    
    $window.keydown(function(event) {
    	if(event.which === 13) {
    		sendMessage();
    	}
    });
});