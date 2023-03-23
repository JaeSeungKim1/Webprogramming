function getClock(){
    const clock=document.querySelector('#clock');
    const date=new Date()
//    if(date.getHours()<10){
//        let temp1='0'+date.getHours().toString();
//        let temp2='0'+String(date.getHours());
//        console.log(temp1,typeof(temp1));
//        console.log(temp2,typeof(temp2));
//    }
    const hour=String(date.getHours()).padStart(2,'0');
    const minute=String(date.getMinutes()).padStart(2,'0');
    const seconds=String(date.getSeconds()).padStart(2,'0');
    //console.log(hour,minute,seconds);
    clock.innerHTML=`${hour}:${minute}:${seconds}`
}
getClock();
setInterval(getClock,1000);