<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Favorites</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css">
    <style>
        *, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }

        :root {
            --glass: rgba(255, 255, 255, 0.55);
            --glass-border: rgba(180, 220, 180, 0.4);
            --glass-hover: rgba(255, 255, 255, 0.75);
            --text-primary: #4a5a4a;
            --text-secondary: #8a9e8a;
            --accent: #6b9e6b;
        }

        body {
            min-height: 100vh;
            font-family: 'Pretendard', sans-serif;
            background: linear-gradient(145deg, #ffffff 0%, #edf7ed 35%, #d4edda 65%, #c2e5c8 100%);
            overflow-x: hidden;
            color: var(--text-primary);
        }
        body::before, body::after {
            content: '';
            position: fixed;
            border-radius: 50%;
            filter: blur(90px);
            opacity: 0.45;
            pointer-events: none;
            z-index: 0;
        }
        body::before {
            width: 550px; height: 550px;
            background: radial-gradient(circle, #c8e6c9, #e8f5e9);
            top: -120px; left: -120px;
        }
        body::after {
            width: 480px; height: 480px;
            background: radial-gradient(circle, #f1f8e9, #dcedc8);
            bottom: -100px; right: -100px;
        }

        .wrapper {
            position: relative;
            z-index: 1;
            max-width: 900px;
            margin: 0 auto;
            padding: 60px 24px 80px;
        }

        header {
            text-align: center;
            margin-bottom: 56px;
            animation: fadeDown 0.8s ease both;
        }
        header .label {
            font-size: 11px;
            letter-spacing: 0.35em;
            text-transform: uppercase;
            color: var(--accent);
            margin-bottom: 14px;
        }
        header h1 {
            font-family: 'DM Serif Display', serif;
            font-size: clamp(2.8rem, 6vw, 4.2rem);
            font-style: italic;
            line-height: 1.1;
            background: linear-gradient(120deg, #4a5a4a 30%, #7ab87a);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        header p {
            margin-top: 16px;
            color: var(--text-secondary);
            font-size: 0.95rem;
            font-weight: 300;
        }

        .tabs {
            display: flex;
            justify-content: center;
            gap: 14px;
            margin-bottom: 48px;
            animation: fadeDown 0.8s ease 0.15s both;
        }
        .tab-btn {
            padding: 11px 32px;
            border-radius: 50px;
            border: 1px solid var(--glass-border);
            background: var(--glass);
            backdrop-filter: blur(12px);
            color: var(--text-secondary);
            font-family: 'Pretendard', sans-serif;
            font-size: 0.92rem;
            cursor: pointer;
            transition: all 0.25s ease;
            letter-spacing: 0.04em;
        }
        .tab-btn:hover {
            background: var(--glass-hover);
            color: var(--accent);
        }
        .tab-btn.active {
            background: var(--accent);
            color: #fff;
            border-color: var(--accent);
            box-shadow: 0 6px 20px rgba(107, 158, 107, 0.35);
        }

        .panel { display: none; }
        .panel.active {
            display: block;
            animation: fadeUp 0.4s ease both;
        }

        .section-title {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 24px;
        }
        .section-title .icon { font-size: 1.4rem; }
        .section-title h2 {
            font-family: 'Pretendard', sans-serif;
            font-size: 1.5rem;
            font-style: italic;
            color: var(--accent);
        }
        .section-title::after {
            content: '';
            flex: 1;
            height: 1px;
            background: linear-gradient(to right, var(--glass-border), transparent);
        }

        .cards {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }
        .card {
            background: var(--glass);
            border: 1px solid var(--glass-border);
            border-radius: 20px;
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            overflow: hidden;
            transition: transform 0.3s ease, background 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: translateY(-6px);
            background: var(--glass-hover);
            box-shadow: 0 20px 40px rgba(100, 160, 100, 0.15);
        }
        .card-img {
            width: 100%;
            aspect-ratio: 16/9;
            object-fit: cover;
            display: block;
        }
        .card-body {
            padding: 18px 20px 20px;
        }
        .card-body h3 {
            font-size: 1rem;
            font-weight: 600;
            color: var(--text-primary);
        }
        .card-tag {
            display: inline-block;
            margin-top: 10px;
            padding: 3px 10px;
            border-radius: 20px;
            font-size: 0.72rem;
            letter-spacing: 0.08em;
            background: rgba(120, 180, 120, 0.15);
            color: var(--accent);
            border: 1px solid rgba(120, 180, 120, 0.3);
        }

        @keyframes fadeDown {
            from { opacity: 0; transform: translateY(-20px); }
            to   { opacity: 1; transform: translateY(0); }
        }
        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(20px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 560px) {
            .cards { grid-template-columns: 1fr; }
            .tab-btn { padding: 9px 20px; font-size: 0.82rem; }
        }
    </style>
</head>
<body>
<div class="wrapper">

    <header>
        <div class="label">About Me</div>
        <h1>My Favorites</h1>
        <p>내가 좋아하는 것들을 소개합니다 ✨</p>
    </header>

    <div class="tabs">
        <button class="tab-btn active" onclick="showTab('hobbies', this)">🎯 취미</button>
        <button class="tab-btn"        onclick="showTab('songs',   this)">🎵 노래</button>
        <button class="tab-btn"        onclick="showTab('dramas',  this)">📺 드라마</button>
    </div>

    <!-- 취미 -->
    <div id="hobbies" class="panel active">
        <div class="section-title">
            <span class="icon">💕</span><h2>취미</h2>
        </div>
        <div class="cards">
            <div class="card">
                <img src="${images['NC 다이노스 응원']}" alt="NC 다이노스 응원" class="card-img">
                <div class="card-body">
                    <h3>NC 다이노스 응원</h3>
                    <span class="card-tag"># 야구</span>
                </div>
            </div>
            <div class="card">
                <img src="${images['콘서트']}" alt="콘서트" class="card-img">
                <div class="card-body">
                    <h3>콘서트</h3>
                    <span class="card-tag"># 라이브</span>
                </div>
            </div>
        </div>
    </div>

    <!-- 노래 -->
    <div id="songs" class="panel">
        <div class="section-title">
            <span class="icon">🎵</span><h2>노래</h2>
        </div>
        <div class="cards">
            <div class="card">
                <img src="${images['작은 기다림']}" alt="작은 기다림" class="card-img">
                <div class="card-body">
                    <h3>작은 기다림</h3>
                    <span class="card-tag"># 쿨</span>
                </div>
            </div>
            <div class="card">
                <img src="${images['Rains in Heaven']}" alt="Rains in Heaven" class="card-img">
                <div class="card-body">
                    <h3>Rains in Heaven</h3>
                    <span class="card-tag"># NCT DREAM</span>
                </div>
            </div>
        </div>
    </div>

    <!-- 드라마 -->
    <div id="dramas" class="panel">
        <div class="section-title">
            <span class="icon">📺</span><h2>드라마</h2>
        </div>
        <div class="cards">
            <div class="card">
                <img src="${images['응답하라 1994']}" alt="응답하라 1994" class="card-img">
                <div class="card-body">
                    <h3>응답하라 1994</h3>
                    <span class="card-tag"># 1994</span>
                </div>
            </div>
            <div class="card">
                <img src="${images['궁']}" alt="궁" class="card-img">
                <div class="card-body">
                    <h3>궁</h3>
                    <span class="card-tag"># 주지훈 윤은혜</span>
                </div>
            </div>
        </div>
    </div>

</div>

<script>
    function showTab(tabId, btn) {
        document.querySelectorAll('.panel').forEach(p => p.classList.remove('active'));
        document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
        document.getElementById(tabId).classList.add('active');
        btn.classList.add('active');
    }
</script>
</body>
</html>
