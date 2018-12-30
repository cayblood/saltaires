---
layout: default
title: Music
permalink: /music/
---

### Listen to the Saltaires

<div id="ytplayer1"></div>
<div id="ytplayer2"></div>
<div id="ytplayer3"></div>
<div id="ytplayer4"></div>

<script>
  // Load the IFrame Player API code asynchronously.
  var tag = document.createElement('script');
  tag.src = "https://www.youtube.com/player_api";
  var firstScriptTag = document.getElementsByTagName('script')[0];
  firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

  // Replace the 'ytplayer' element with an <iframe> and
  // YouTube player after the API code downloads.
  var player;
  function onYouTubePlayerAPIReady() {
    player = new YT.Player('ytplayer1', {
      height: '450',
      width: '800',
      videoId: '9eyJNISfwe8'
    });
    player = new YT.Player('ytplayer2', {
      height: '450',
      width: '800',
      videoId: '7AK1lHNkD8A'
    });
    player = new YT.Player('ytplayer3', {
      height: '450',
      width: '800',
      videoId: 'puzdJail3Mo'
    });
    player = new YT.Player('ytplayer4', {
      height: '450',
      width: '800',
      videoId: 'x9TMH5voDbo'
    });
  }
</script>

### Current music

 All Saltaires sheet music and learning tracks can be accessed through [a private web application](https://saltaires.groupanizer.com).  Login is required.  Contact the Saltaires president if you need access.
