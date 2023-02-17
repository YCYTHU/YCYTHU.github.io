---
layout: article
title: Gallery
permalink: /MolViewer/docs/gallery
sidebar:
  nav: MolViewer
---

<!--more-->

<!DOCTYPE html>
<html>
<head>
  <title>My Photo Gallery</title>
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
  </script>
</head>
<body>
  <h1>My Photo Gallery</h1>
  <div>
    <img id="photo" src="/MolViewer/assets/gallery1.jpg" alt="Gallery 1">
    <p>Gallery 1 description</p>
  </div>
  <button onclick="nextPhoto()">Next Photo</button>
</body>
</html>
