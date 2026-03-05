<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>럭키 드로우!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* 1. 배경: 화사하고 밝은 그라데이션 애니메이션 */
        body {
            background: linear-gradient(-45deg, #e0f2fe, #bae6fd, #f0f9ff, #e0f2fe);
            background-size: 400% 400%;
            animation: gradientBG 10s ease infinite;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Pretendard', sans-serif;
            margin: 0;
            overflow: hidden;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* 2. 카드: 밝고 깨끗한 유리공예 느낌 */
        .result-card {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(15px);
            border: 2px solid rgba(255, 255, 255, 0.5);
            border-radius: 40px;
            padding: 60px;
            text-align: center;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.05);
            width: 90%;
            max-width: 550px;
        }

        /* 3. 인트로: 박진감 넘치는 텍스트 */
        .intro-text {
            font-size: 1.5rem;
            color: #3b82f6;
            font-weight: bold;
            letter-spacing: 3px;
            margin-bottom: 20px;
        }

        /* 4. 이름 영역: 겹침 방지를 위한 고정 높이 */
        .name-container {
            margin: 40px 0;
            height: 150px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .name-display {
            font-size: 5.5rem;
            font-weight: 900;
            color: #1e3a8a;
            opacity: 1;
            transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }

        /* 5. 버튼: 하이테크 블루 스타일 */
        .btn-draw {
            background: #3b82f6;
            color: white;
            border: none;
            padding: 18px 50px;
            font-size: 1.4rem;
            font-weight: bold;
            border-radius: 60px;
            box-shadow: 0 10px 25px rgba(59, 130, 246, 0.4);
            transition: all 0.3s;
            cursor: pointer;
        }

        .btn-draw:hover {
            transform: translateY(-5px);
            background: #2563eb;
            box-shadow: 0 15px 35px rgba(59, 130, 246, 0.5);
        }

        .btn-draw:disabled {
            background: #94a3b8;
            cursor: not-allowed;
        }

        /* 레이아웃 정렬 */
        .content-wrapper {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
    </style>
</head>
<body>

<div class="result-card">
    <div class="content-wrapper">
        <div class="intro-text" id="status-msg">WHO IS THE WINNER?</div>

        <div class="name-container">
            <h1 class="name-display" id="display-name">${name}</h1>
        </div>

        <div id="sub-msg" class="mb-4">
            <p class="text-secondary fs-5">추첨 버튼을 눌러주세요!</p>
        </div>

        <div>
            <button onclick="startDraw()" class="btn-draw" id="draw-btn">추첨하기</button>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.6.0/dist/confetti.browser.min.js"></script>
<script>
    // 페이지 로드 시(첫 접속 시) 연출 실행
    window.onload = function() {
        const initialName = "${name}";
        const display = document.getElementById('display-name');

        // 초기 이름 숨기고 연출 시작
        display.style.opacity = "0";
        display.style.transform = "scale(0.5)";

        setTimeout(() => {
            triggerResultEffect(initialName);
        }, 500);
    };

    function startDraw() {
        const display = document.getElementById('display-name');
        const status = document.getElementById('status-msg');
        const btn = document.getElementById('draw-btn');

        btn.disabled = true;
        status.innerText = "TARGETING...";

        // 셔플 효과 시작
        let count = 0;
        const items = ["추첨중", "두구두구", "행운아", "준비중"];
        const shuffle = setInterval(() => {
            display.innerText = items[count % items.length];
            display.style.opacity = "0.5";
            count++;
        }, 100);

        // API 호출 (/api/pick)
        fetch('/api/reroll')
            .then(res => res.text())
            .then(newName => {
                setTimeout(() => {
                    clearInterval(shuffle);
                    triggerResultEffect(newName);
                    btn.disabled = false;
                    status.innerText = "WINNER FOUND!";
                }, 1500); // 1.5초 지연으로 긴장감 부여
            });
    }

    function triggerResultEffect(targetName) {
        const display = document.getElementById('display-name');
        display.innerText = targetName;
        display.style.opacity = "1";
        display.style.transform = "scale(1.1)";

        setTimeout(() => display.style.transform = "scale(1.0)", 200);

        // 꽃가루 팡!
        confetti({
            particleCount: 150,
            spread: 70,
            origin: { y: 0.6 },
            colors: ['#3b82f6', '#ffffff', '#60a5fa']
        });
    }
</script>

</body>
</html>