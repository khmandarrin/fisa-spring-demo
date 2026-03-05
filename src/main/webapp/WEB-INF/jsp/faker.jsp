<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>The Unkillable Demon King</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: radial-gradient(circle at center, #1a1a2e 0%, #020205 100%);
            font-family: 'Pretendard', sans-serif;
            color: white;
            overflow: hidden;
        }

        .card {
            position: relative;
            width: 400px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 20px;
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.5);
            text-align: center;
            transition: all 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
            border-color: #c8aa6e;
        }

        .faker-img {
            width: 100%;
            height: auto;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
            filter: grayscale(20%);
            transition: filter 0.3s ease;
        }

        .card:hover .faker-img {
            filter: grayscale(0%);
        }

        .title {
            margin-top: 20px;
            font-size: 1.5rem;
            letter-spacing: 2px;
            font-weight: 800;
            color: #c8aa6e;
        }

        .subtitle {
            font-size: 0.9rem;
            color: #888;
            margin-bottom: 20px; /* 버튼과의 간격 확보 */
        }

        /* ✨ 새로고침 버튼 스타일 */
        .refresh-btn {
            background: transparent;
            border: 1px solid #c8aa6e;
            color: #c8aa6e;
            padding: 10px 25px;
            border-radius: 30px;
            cursor: pointer;
            font-weight: 600;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            text-transform: uppercase;
            font-size: 0.8rem;
        }

        .refresh-btn:hover {
            background: #c8aa6e;
            color: #000;
            box-shadow: 0 0 15px rgba(200, 170, 110, 0.4);
        }

        .refresh-btn:active {
            transform: scale(0.95);
        }

        .aura {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 500px;
            height: 500px;
            background: rgba(200, 170, 110, 0.1);
            filter: blur(100px);
            border-radius: 50%;
            z-index: -1;
        }
    </style>
</head>
<body>

<div class="aura"></div>

<div class="card">
    <img src="${imageUrl}" alt="Faker Image" class="faker-img">

    <div class="title">T1 FAKER</div>
    <div class="subtitle">"모든 길은 저로 통합니다."</div>

    <button class="refresh-btn" onclick="location.reload()">New Legend</button>
</div>

</body>
</html>