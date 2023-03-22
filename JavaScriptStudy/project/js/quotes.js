const quotes=[
    {
        quote:"언제나 현재에 집중할수 있다면 행복할것이다.",
        author:"파울로 코엘료",
    },
    {
        quote:"직업에서 행복을 찾아라. 아니면 행복이 무엇인지 절대 모를 것이다",
        author:"엘버트 허버드",
    },
    {
        quote:"행복의 문이 하나 닫히면 다른 문이 열린다 그러나 우리는 종종 닫힌 문을 멍하니 바라보다가 우리를 향해 열린 문을 보지 못하게 된다",
        author:"헬렌켈러",
    },
    {
        quote:"먼저 자신을 비웃어라. 다른 사람이 당신을 비웃기 전에",
        author:"엘사 맥스웰",
    },
    {
        quote:"절대 어제를 후회하지 마라",
        author:"L.론허바드",
    },
    {
        quote:"먼저핀꽃은 먼저진다  남보다 먼저 공을 세우려고 조급히 서둘것이 아니다",
        author:"채근담",
    },
];
//주어진 배열을 랜덤으로 선정해서
//화면에 quote div의 span안에 각각 출력
const todayQuote=quotes[Math.floor(Math.random()*quotes.length)];
document.querySelector('#quote span:first-child').innerHTML
    =todayQuote.quote;
document.querySelector('#quote span:last-child').innerHTML
    =todayQuote.author;