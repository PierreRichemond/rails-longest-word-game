// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)


//under here
const boxes = document.querySelectorAll('.box');
console.log(boxes);
NodeList.length
boxes.forEach((box) => box.addEventListener('click',
  (event) => {
    console.log(event)
    const letter = event.target.innerText
    const form = document.querySelector('#form');
    console.log(letter)
    form.value += letter
}));
