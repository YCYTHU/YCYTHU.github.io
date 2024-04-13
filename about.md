---
layout: article
key: page-about
---

<style>
    .tab-container{
        background-color: #f7f7f7;
        margin: 0 auto;
        border-radius: 0.4rem;
        color: #000;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
    }
    ul.tab-title{
        display: flex;
        padding: 0;
        overflow-x: auto;
        overflow-y: clip;
        align-items: center;
        justify-content: space-evenly;
        border-bottom: 2px solid #ccc;
    }
    ul.tab-title li{
        list-style: none;
        line-height: 50px;
        padding: 0 20px;
        position: relative;
        white-space: nowrap;
        cursor: pointer;
        transition: all .3s;
    }
    ul.tab-title li:hover,
    ul.tab-title li.active{
        color: #fb070b;;
    }
    ul.tab-title li::before{
        content: '';
        display: block;
        width: 0;
        height: 4px;
        position: absolute;;
        bottom: -2px;
        left: 50%;
        background-color: #fb070b;;
        border-radius: 2px;
        transition: all .3s;
    }
    ul.tab-title li:hover:before,
    ul.tab-title li.active:before{
        width: 100%;
        left: 0;
    }
    .tab-panel{
        display: none;
        justify-content: center;
        align-items: center;
        color: #555;
    }
    .tab-panel.show{
        display: flex;
    }
</style>
<div class="tab-container">
    <ul class="tab-title">
        <li class="active">中文（简体）</li>
        <li>English</li>
        <li>Français</li>
        <li>Deutsch</li>
        <li>Русский</li>
        <li>español</li>
    </ul>
    <div class="tab-content">
        <div class="tab-panel show">
            <p>🎉 Hi，我是一个......旅行者！我喜欢踏上未知的旅程，寻找着...........🐱。是的，我相信🐱是宇宙的密码，而我就是......一颗蓝色的气球！我会飘向......🍫🌳，和🍬🌥️交谈。除此之外，我还是一个........🔥舞者！在星空下，我用舞姿诉说着......🥪的故事。总之，我是一个充满了........✨和......🍓的人，总是在.......🌈上奔跑，寻找着..........🔵的⭐。一起来玩吧，带上你的.......💧和..........🚀，我们一起......去太空漫步吧！</p>
        </div>
        <div class="tab-panel">
            <p>🎉 Hi, I'm a...... traveler! I love embarking on adventures into the unknown, in search of..........🐱. Yes, I believe 🐱 are the code of the universe, and I'm a blue balloon......! I'll float towards......🍫🌳, and I'll talk to the 🍬🌥️. Additionally, I'm also a dancer of........🔥! Under the stars, I tell stories of......🥪 with my dance. In summary, I'm someone filled with........✨ and......🍓, always running on.......🌈, in search of the..........blue ⭐. Join me with your.......💧 and your..........🚀, we'll go for a spacewalk together!</p>
        </div>
        <div class="tab-panel">
            <p>🎉 Salut, je suis un...... voyageur! J'aime partir à l'aventure dans l'inconnu, à la recherche de..........🐱. Oui, je crois que les 🐱 sont le code de l'univers, et je suis un ballon bleu......! Je flotterai vers......🍫🌳, et je discuterai avec les 🍬🌥️. En plus, je suis aussi un danseur de........🔥! Sous les étoiles, je raconte des histoires de......🥪 avec ma danse. En résumé, je suis quelqu'un de rempli de........✨ et de......🍓, toujours en train de courir sur.......🌈, à la recherche des..........⭐ bleues. Rejoignez-moi avec vos.......💧 et vos..........🚀, nous irons faire une balade spatiale ensemble!</p>
        </div>
        <div class="tab-panel">
            <p>🎉 Hallo, ich bin ein...... Reisender! Ich liebe es, mich auf Abenteuer ins Unbekannte zu begeben, auf der Suche nach..........🐱. Ja, ich glaube, die 🐱 sind der Code des Universums, und ich bin ein blauer Luftballon......! Ich werde schweben zu......🍫🌳, und ich werde mit den 🍬🌥️ sprechen. Außerdem bin ich auch ein Tänzer des........🔥! Unter den Sternen erzähle ich Geschichten von......🥪 mit meinem Tanz. Zusammenfassend bin ich jemand, der voller........✨ und......🍓 ist, immer auf.......🌈 rennend, auf der Suche nach den..........blauen ⭐. Begleitet mich mit euren.......💧 und euren..........🚀, wir werden zusammen einen Weltraumspaziergang machen!</p>
        </div>
        <div class="tab-panel">
            <p>🎉 Привет, я.......путешественник! Мне нравится отправляться в путешествия в неизведанное, в поисках..........🐱. Да, я верю, что 🐱 - это код Вселенной, и я - синий воздушный шар......! Я буду плыть к......🍫🌳, и я буду разговаривать с 🍬🌥️. Кроме того, я также танцор........🔥! Под звездами я рассказываю истории о......🥪 своим танцем. В общем, я кто-то, наполненный........✨ и......🍓, всегда бегущий по.......🌈, в поисках..........синих ⭐. Присоединяйтесь ко мне со своими.......💧 и своими..........🚀, мы совершим космическую прогулку вместе!</p>
        </div>
        <div class="tab-panel">
            <p>🎉 ¡Hola, soy un...... viajero! Me encanta embarcarme en viajes hacia lo desconocido, en busca de..........🐱. Sí, creo que los 🐱 son el código del universo, ¡y yo soy un globo azul......! Flotaré hacia......🍫🌳, y hablaré con las 🍬🌥️. Además, también soy un bailarín de........🔥! Bajo las estrellas, cuento historias de......🥪 con mi baile. En resumen, soy alguien lleno de........✨ y de......🍓, siempre corriendo sobre.......🌈, en busca de las..........⭐ azules. ¡Acompáñame con tus.......💧 y tus..........🚀, iremos a dar un paseo espacial juntos!</p>
        </div>
    </div>
</div>
<!--<span>Generate By ChatGPT 3.5</span>-->
<script>
    let btns=document.querySelectorAll('.tab-title li')
    btns.forEach((item,i)=>{
        item.onclick=function(){
            let activeBtn=document.querySelector('.tab-title li.active')
            activeBtn.classList.remove('active')
            this.classList.add('active')
            let showPanel=document.querySelector('.tab-content .tab-panel.show')
            showPanel.classList.remove('show')
            let panels=document.querySelectorAll('.tab-content .tab-panel')
            panels[i].classList.add('show')
        }
    })
</script>