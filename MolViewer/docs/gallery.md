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
      height: 80vh;
    }
    .photo-container {
      display: flex;
      flex-direction: column;
      align-items: center;
      margin-bottom: 20px;
    }
    .photo {
      max-width: 80%;
      height: auto;
    }
    .buttons-container {
      display: flex;
      justify-content: space-between;
      width: 80%;
    }
    button {
      background-color: #4CAF50;
      color: #ffffff;
      border: none;
      padding: 10px 20px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      margin: 4px 2px;
      cursor: pointer;
    }
  </style>
  <script>
    var currentPhoto = 1;
    var numPhotos = 2;
    function nextPhoto() {
      currentPhoto++;
      if (currentPhoto > numPhotos) {
        currentPhoto = 1;
      }
      document.getElementById("photo").src = "/MolViewer/assets/images/gallery" + currentPhoto + ".jpg";
    }
    function prevPhoto() {
      currentPhoto--;
      if (currentPhoto < 1) {
        currentPhoto = numPhotos;
      }
      document.getElementById("photo").src = "/MolViewer/assets/images/gallery" + currentPhoto + ".jpg";
    }
  </script>
</head>
<body>
  <div class="container">
    <div class="photo-container">
      <img id="photo" class="photo" src="/MolViewer/assets/images/gallery1.jpg" alt="Gallery 1">
      <p>Gallery 1 description</p>
      <div class="buttons-container">
        <button style="background-color: #4CAF50; color: #ffffff" onclick="prevPhoto()">Previous Photo</button>
        <button style="background-color: #4CAF50; color: #ffffff" onclick="nextPhoto()">Next Photo</button>
      </div>
    </div>
  </div>
</body>
</html>