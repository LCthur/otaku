let typingTimer;                //timer identifier
let doneTypingInterval = 3000;  //time in ms (5 seconds)
const search = document.getElementById('search-bar');
const spaceFormSearch = document.getElementById('form-search')

//user is "finished typing," do something
const searchKeyUp = () => {
    search.addEventListener('keyup', (e) => {
        console.log(e.currentTarget.value);
        const inputUser = event.currentTarget.value;
        clearTimeout(typingTimer);
        if (inputUser) {
            typingTimer = setTimeout(doneTyping, doneTypingInterval);
        } else {
            inputUser.remove();
        }
    });
};

function doneTyping () {
    window.location.href = "#cards-product";
    searchKeyUp();
}

export { doneTyping };