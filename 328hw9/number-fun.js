

document.addEventListener('DOMContentLoaded', function() {
    const number1 = document.getElementById('number1');
    const number2 = document.getElementById('number2');
    const computeBtn = document.getElementById('compute');
    const result = document.getElementById('result');

    computeBtn.addEventListener('click', function() {
        const num1 = parseFloat(number1.value);
        const num2 = parseFloat(number2.value);

        if (isNaN(num1) || isNaN(num2)) {
            result.textContent = "Result: Please enter valid numbers";
        } else {
            const sum = num1 + num2;
            result.textContent = "Result: " + sum;
        }
    });
});
