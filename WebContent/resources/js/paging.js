
	//이전 버튼 이벤트
	function prev(type, page, range, rangeSize) {
			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;
	
			var url = type;
			url = url + "?page=" + page;
			url = url + "&range=" + range;
	
			location.href = url;
		}
		
  	//페이지 번호 클릭
	function pagination(type, page, range, rangeSize, searchType, keyword) {
		var url = type;
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;	

	}
	
	//다음 버튼 이벤트
	function next(type, page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;

		var url = type;
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}