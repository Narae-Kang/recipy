window.addEventListener("load",init,false);
function init() {
  var tabEle = document.getElementsByClassName("tab")[0];
  var imgEle = document.getElementsByClassName("newImg_container")[0];
  var noteEle = document.getElementsByClassName("note_container")[0];

  //햄버거 버튼 클릭시
  tabEle.addEventListener("click",function(e){
    e.preventDefault();
    displayMobileMenue();
  },false);

  //이미지 본문 클릭시
  imgEle.addEventListener("click",function(){
    var mobileEle = document.getElementById("mobile");
    mobileEle.classList.remove("active");
    imgEle.classList.remove("active");        
  },false);
  //박스 본문 클릭시
  noteEle.addEventListener("click",function(){
    var mobileEle = document.getElementById("mobile");
    mobileEle.classList.remove("active");
    noteEle.classList.remove("active");        
  },false);
}

function displayMobileMenue(){
  var mobileEle = document.getElementById("mobile");
  var imgEle = document.getElementsByClassName("newImg_container")[0];
  mobileEle.classList.add("active");
  imgEle.classList.add("active");
}



// ----------------------------------------------------제이쿼리 시작
$(function(){
    var container = $('.slideshow'),
        slideGroup = container.find('.slideshow_slides'),
        slides = slideGroup.find('a'),
        nav = container.find('.slideshow_nav'),
        indicator = container.find('.indicator'),
        slideCount = slides.length,
        indicatorHtml = '',
        currentIndex = 0,
        duration = 500,
        easing = 'easeInOutExpo',
        inerval = 3500,
        timer;
  
    //슬라이드(이미지)를 가로로 배열
    console.log(slides);
    //slides 마다 할일: 들어올때 100%씩 뒤로 밀기left 0%, 100% 200% 300%
    slides.each(function(i){
        var newLeft = i * 100 + '%';
        $(this).css({left: newLeft });
        //<a href="">1</a>  밑에 똥그라미 만들기!!!
        indicatorHtml += '<a href="">' +(i+1)+ '</a>';
        console.log(indicatorHtml);
    }); //slides.each

    //A.text(B); a요소의 b의 내용을 글씨 형태로 추가(내용이 있으면 교체)
    //A.html(B); a요소의 b의 내용을 html 형태로 추가
    //슬라이드 갯수에 따라 점만들기
    indicator.html(indicatorHtml); 
    
    //슬라이드 이동함수
    function goToSlide(index) {
        //index가 0 이면 left는?? 0%, index 1 left - -100%
        slideGroup.animate({left: -100 * index + '%'}, duration, easing);
        currentIndex = index;
        console.log(currentIndex); 

        updateNav();    //이동한 후에 처음인지, 마지막인지 검사

    } // goToSlide 끝

    function updateNav() {
        var navPrev = nav.find('.prev');
        var navNext = nav.find('.next');
        // 처음 currentIndex = 0 , 이전버튼이 안보이도록
        if(currentIndex == 0) {
            navPrev.addClass('disabled');
        }else {
            navPrev.removeClass('disabled');
        }    
        // 마지막이면 currentIndex = 3, 다음버튼이 안보이도록
        if(currentIndex == slideCount -1) {
            navNext.addClass('disabled');
        }else {
            navNext.removeClass('disabled');
        }

        //클릭하는 이미지에 맞추어 하단 도트를 흰색->검은색으로 바꾸기
        //1) 모든 요소에서 acitve 빼고, 원하는 요소에만  active 추가
        // indicator.find('a').removeClass('active');
        // // .eq(숫자)
        // indicator.find('a').eq(currentIndex).addClass('active');

        //2) 원하는 요소에만 active 추가하고, 나머지 요소에서 acitve 빼기
        indicator.find('a').eq(currentIndex).addClass('active').
        siblings().removeClass('active');


    } // updateNav 끝

    //인디케이터로 이동하기
    indicator.find('a').click(function(e){
        e.preventDefault();
        var idx = $(this).index();
        // console.log(idx); 
        goToSlide(idx);

        
    });

    //좌우 버튼으로 이동하기
    //다음버튼 클릭 c+1 -> goToSlide(?);
    //이전버튼 클릭 c-1 -> goToSlide(?);

    //만약 prev와 next를 분리해서 작성하면 이렇게 해도됨
    // nav.fin('.prev').click(function(e) {
    //     e.preventDefault();
    //     // var i = currentIndex - 1;
    //     goToSlide(currentIndex - 1);
    // });
    // nav.fin('.next').click(function(e) {
    //     e.preventDefault();
    //     // var i = currentIndex + 1;
    //     goToSlide(currentIndex + 1);
    // });

    //만약 a로 잡아서 한번에 작성하면 이렇게
    nav.find('a').click(function(e) {
        e.preventDefault();
        if($(this).hasClass('prev')) {
            goToSlide(currentIndex - 1);
        } else {
            goToSlide(currentIndex + 1);
        }
    });
    updateNav();    //시작하자마자 실행해서 맨처음과 맨마지막의 인디케이터를 안보이게

    //자동 슬라이드 함수!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function startTimer() {
        // 일정시간 마다 할일
        //setInterval(할일, 시간) clearInterval(이름)
        //할일(함수) function() {실제로 할일}

        timer = setInterval(function(){
            //nextindex n0 n1, c1 n2, ... c3 n0
            // (0+1)%4=1,...(3+1)%4 = 0 ??
            var nextIndex = (currentIndex + 1) % slideCount; 
            goToSlide(nextIndex);
        }, inerval);
    }
    startTimer();

    function stopTimer() {
        clearInterval(timer);
    }

    container.mouseenter(function(){
        stopTimer()
    })
    .mouseleave(function(){
        startTimer()
    });
  
  });

//----------------------------------------------------제이쿼리 끝