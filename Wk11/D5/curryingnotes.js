function addThreeNums(num1, num2, num3) {
    return num1 + num2, num3;
}

function curriedAddThreeNums() {
    return function (num1) {
        return function (num2) {
            return function (num3){
                return num1 + num2 + num3;
            }
        }
    }
}

const a = curriedAddThreeNums();
const b = a();
const c = b();
const result = c()

function curriedSum(numArgs) {
    const nums = [];
    return _curriedSum(num) {
        nums.push(num);
        if (nums.length == numArgs){
            let result = 0;
            nums.forEach(num => result += num);
            return result;
        } else {
            return _curriedSum;
        };
    };
};

const curriedAdd = curriedSum(3);
curriedAdd(1)(2)(3);