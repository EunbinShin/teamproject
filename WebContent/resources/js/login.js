			const handleIdChange = () => {
				const uid = document.querySelector("#uid");
				if(uid.value.length > 10){
					alert("최대 10자 까지 입력 가능합니다!");
					uid.value = uid.value.substring(0, 10);
				}
			};
			
			const handlePasswordChange = () => {
				const upassword = document.querySelector("#upassword");
				if(upassword.value.length > 12){
					alert("최대 12자 까지 입력 가능합니다!");
					upassword.value = upassword.value.substring(0, 12);
				}
			};
			
			const handleButton = () => {
				const text = event.target.innerHTML;
				const uid = document.querySelector("#uid");
				const upassword = document.querySelector("#upassword");
				const idAlert = document.querySelector("#idAlert");
				const pwdAlert = document.querySelector("#pwdAlert");
				idAlert.innerHTML = "";
				pwdAlert.innerHTML = "";
				if(text == "로그인"){
					console.log("로그인 버튼을 눌렀습니다.");
					if(uid.value.length == 0){
						idAlert.innerHTML = "아이디를 입력해주세요.";
						idAlert.style.color="red";
					}else if(upassword.value.length == 0){
						pwdAlert.innerHTML = "비밀번호를 입력해주세요.";
						pwdAlert.style.color="red";
					}
					else{
						location.href = "/html_css_javaspring/index.html";
					}
				}
			};
			
			const gotoHome = () => {
				location.href = "/html_css_javaspring/index.html";
			}