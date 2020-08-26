function madLib(verb, adjective, noun) {
    return "We shall ${verb.toUpperCase()} the ${adjective.toUpperCase} ${noun.toUpperCase}."
}

madLib('make', 'best', 'guac'); //"We shall MAKE the BEST GUAC."


function isSubstring(searchString, subString) {
    return searchString.includes(subString)
}

isSubstring("time to program", "time") //true
isSubstring("Jump for joy", "joys") //false

function fizzBuzz(array) {
    let arr = [];
    for(let i = 0; i < array.length; i++) {
        if (array[i] % 3 === 0 ^ array[i] % 5 === 0) {
            arr.push(array[i]);
        }
    }
    return arr;
}

fizzBuzz([9,4,3,2,1,5,6,7]);

function isPrime(number) {
    for(let i = 2; i < number; i++) {
        if (number % i === 0) {
            return false;
        }
    }
    return true;
}

function sumOfNPrimes(n) {
    let sum = 0;
    let count = 0;
    let i = 2;

    while(count < n) {
        if ( isPrime(i) ) {
            sum += i;
            count += 1;
        }
        i += 1;
    }
    return sum;
}