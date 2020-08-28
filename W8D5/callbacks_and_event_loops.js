const readline = require('readline');
// Simple Timeout
// window.setTimeout(function() { alert('HAMMERTIME') }, 5000);

// function hammerTime(time) {
//     window.setTimeout(function() { alert("${time} is hammertime!");});
// }

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// reader.question("Would you like tea??", function(answer) {
//     console.log('You chose ${answer}!');
// });

// reader.question("Would you like biscuits???", function(answer) {
//     console.log('You chose ${answer}!');
// });

// console.log("Last program line");

function teaAndBiscuits () {
    reader.question('Would you like some tea?', (res) => {
        console.log(`You replied ${res}.`);
        reader.question('Would you like some biscuits?', (res2) => {
            second = res;
            console.log(`You replied ${res2}.`);
            const firstRes = (res === 'yes') ? 'do' : 'don\'t';
            const secondRes = (res2 === 'yes') ? 'do' : 'don\'t';
            console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
            reader.close();
        });
    });
}


