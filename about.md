<!-----
layout: article
key: page-about
----->
<head>
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/font-awesome/5.15.1/css/all.css" >
    <style>
        h2 {
            font-family: slogan;
            font-size: 2em;
        }
        .icon-container {
            display: flex;
            gap: 20px;
            margin: 36px;
        }
        .icon-container img {
            width: 2em;
            height: 2em;
        }
        .icon {
            opacity: 0;
            transform: translateX(-100%);
            animation: slideIn 1s ease-out forwards;
            animation-delay: var(--delay);
            transition: transform 0.3s filter 0.3s;
            animation-play-state: paused;
        }
        .icon.active {
            animation-play-state: running;
        }
        @keyframes slideIn {
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }
        @font-face {
            font-family: slogan;
            src: url("https://cdn.jsdelivr.net/gh/ycythu/assets@main/fonts/Ibrahima-Vilantte-slogan/Ibrahima Vilantte.otf");
        }
    </style>
</head>
<body>
    <h2>Use it or lose it</h2>
    <div class="icon-container">
        <img class="icon" src="https://cdn.jsdelivr.net/npm/simple-icons@13.20.0/icons/python.svg" alt="Python" style="--delay: 0.1s;">
        <img class="icon" src="https://cdn.jsdelivr.net/npm/simple-icons@13.20.0/icons/javascript.svg" alt="JavaScript" style="--delay: 0.4s;">
        <img class="icon" src="https://cdn.jsdelivr.net/npm/simple-icons@13.20.0/icons/gnubash.svg" alt="Shell" style="--delay: 0.6s;">
        <img class="icon" src="https://cdn.jsdelivr.net/npm/simple-icons@13.20.0/icons/fortran.svg" alt="Fortran" style="--delay: 0.8s;">
        <img class="icon" src="https://cdn.jsdelivr.net/npm/simple-icons@13.20.0/icons/c.svg" alt="C" style="--delay: 1s;">
        <img class="icon" src="https://cdn.jsdelivr.net/npm/simple-icons@13.20.0/icons/html5.svg" alt="HTML" style="--delay: 1.2s;">
    </div>
    <h2>Knowledge is no burden to carry</h2>
    <div class="icon-container">
        <i class="fas fa-flask fa-2x icon" style="--delay: 0.1s;"></i>
        <i class="fas fa-camera fa-2x icon" style="--delay: 0.4s;"></i>
        <i class="far fa-money-bill-alt fa-2x icon" style="--delay: 0.6s;"></i>
        <i class="fas fa-atom fa-2x icon" style="--delay: 0.8s;"></i>
        <i class="far fa-lightbulb fa-2x icon" style="--delay: 1s;"></i>
        <i class="fas fa-bowling-ball fa-2x icon" style="--delay: 1.2s;"></i>
    </div>
</body>
<script>
document.addEventListener("DOMContentLoaded", () => {
    const icons = document.querySelectorAll(".icon");
    const observer = new IntersectionObserver((entries) => {
        entries.forEach((entry) => {
            const icon = entry.target;
            if (entry.isIntersecting) {
                icon.classList.add("active");
            } else {
                icon.classList.remove("active");
                icon.style.animation = "none";
                setTimeout(() => {
                    icon.style.animation = "";
                }, 100);
            }
        });
    });
    icons.forEach((icon) => observer.observe(icon));
});
</script>
