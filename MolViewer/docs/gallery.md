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
    .description {
      font-family: Arial, sans-serif;
      font-size: 20px;
      font-weight: bold;
    }
    button {
      background-color: #4CAF50;
      color: #ffffff;
      border: none;
      padding: 10px 20px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-family: Arial, sans-serif;
      font-size: 16px;
      font-weight: bold;
      margin: 4px 2px;
      cursor: pointer;
      border-radius: 10px;
    }
  </style>
  <script>
    var currentPhoto = 1;
    var numPhotos = 5;
    var descriptions = [
      "Methane",
      "Ethylamine & Methanol",
      "Fullerene"
    ];
    function nextPhoto() {
      currentPhoto++;
      if (currentPhoto > numPhotos) {
        currentPhoto = 1;
      }
      document.getElementById("photo").src = "/MolViewer/assets/images/gallery" + currentPhoto + ".jpg";
      document.getElementById("description").textContent = descriptions[currentPhoto - 1];
    }
    function prevPhoto() {
      currentPhoto--;
      if (currentPhoto < 1) {
        currentPhoto = numPhotos;
      }
      document.getElementById("photo").src = "/MolViewer/assets/images/gallery" + currentPhoto + ".jpg";
      document.getElementById("description").textContent = descriptions[currentPhoto - 1];
    }
  </script>
</head>
<body>
  <div class="container">
    <div class="photo-container">
      <img id="photo" class="photo" src="/MolViewer/assets/images/gallery1.jpg" alt="Gallery 1" width="540">
      <p id="description" class="description">Methane</p>
      <div class="buttons-container">
        <button style="background-color: #4CAF50; color: #ffffff" onclick="prevPhoto()">PREVIOUS</button>
        <button style="background-color: #4CAF50; color: #ffffff" onclick="nextPhoto()">NEXT</button>
      </div>
    </div>
  </div>
</body>
</html>