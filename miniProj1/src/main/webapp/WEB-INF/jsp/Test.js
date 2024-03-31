/*console.log("dkdkdkdkdk");

let callStart = new Promise(resolve, reject) =>{ //promise 생성
	setTimeout(() =>{
		resolve("1초후 실행됨");
		
	}, 1000)
};

callStart.then((message) => {
	console.log(message);	
});





//체이닝 기법 했었음



fetch('https://jsonplaceholder.typicode.com/posts/1')
.then((response)=>reponse.json())//json으로 변환=promise로 반환(=then 한번 더 쓸 수 있음)
.then((json)=>console.log(json));
	
fetch('https://jsonplaceholder.typicode.com/posts', {
	method: 'POST',
	body: JSON.stringify({
		title : 'foo',
		boddy :  'bar',
		userId: 1,
	}),
	headers: {
			'Content-Type' : 'application/json; charset=UTF-8'
	}
})
.then((response)=>reponse.json())//json으로 변환=promise로 반환(=then 한번 더 쓸 수 있음)
.then((json)=>console.log(json));




함수를 만드는 방식 (함수 명 : aaa)
function aa(){}
const aa = function(){}
const aa = () => {}

*/