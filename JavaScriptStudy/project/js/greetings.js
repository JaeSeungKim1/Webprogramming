//webstorage localstorage 를 활용
//class 를 활용해서 diplay: none을 적용했다가 안했다가 방식
//해당 이름의 저장여부를 확인해서 
//없으면 로그인으로 이름을 입력받고
//있으면 안녕하세요. 누구 라고 출력
const KEY='name';
const loginForm=document.querySelector('#login-form');
const greeting=document.querySelector('#greeting');
const loginInput=document.querySelector('#login-form input');

const savedUsername=localStorage.getItem(KEY);
if(savedUsername===null){
    loginForm.classList.remove('hidden');
    loginForm.addEventListener('submit',loginSubmit);
}else{
    printGreeting(savedUsername);
}
function printGreeting(username){
    greeting.innerText=`안녕하세요. ${username}`;
    greeting.classList.remove('hidden');
}
function loginSubmit(event){
    //event.preventDefault();
    //loginForm.classList.add('hidden');
    const username=loginInput.value;
    localStorage.setItem(KEY,username)
    //printGreeting(username);
}