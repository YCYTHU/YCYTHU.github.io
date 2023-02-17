---
layout: article
title: Gallery
permalink: /MolViewer/docs/gallery
sidebar:
  nav: MolViewer
---

<!--more-->

<html>
<head>
  <style>
    .container {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }
    img {
      max-width: 80%;
      height: auto;
      margin-bottom: 20px;
    }
  </style>
  <script>
    var currentPhoto = 1;
    var numPhotos = 3;
    function nextPhoto() {
      currentPhoto++;
      if (currentPhoto > numPhotos) {
        currentPhoto = 1;
      }
      document.getElementById("photo").src = "/MolViewer/assets/gallery" + currentPhoto + ".jpg";
    }
    function prevPhoto() {
      currentPhoto--;
      if (currentPhoto < 1) {
        currentPhoto = numPhotos;
      }
      document.getElementById("photo").src = "/MolViewer/assets/gallery" + currentPhoto + ".jpg";
    }
  </script>
</head>
<body>
  <div class="container">
    <h1>My Photo Gallery</h1>
    <div>
      <img id="photo" src="/MolViewer/assets/gallery1.jpg" alt="Gallery 1">
      <p>Gallery 1 description</p>
    </div>
    <div>
      <button onclick="prevPhoto()">Previous Photo</button>
      <button onclick="nextPhoto()">Next Photo</button>
    </div>
  </div>
</body>
</html>

