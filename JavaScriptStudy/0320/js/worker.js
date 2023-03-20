let n=1;
while(true){
    n+=1;
    postMessage(n); /* 이 함수를 통해서 worker에 n 값을 다시 전해주겠다는 의미 */
}