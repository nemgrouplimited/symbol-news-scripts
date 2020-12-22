# symbol-news-scripts
## [![Build Status](https://travis-ci.com/dev-vibes/symbol-news-scripts.svg?branch=main)](https://travis-ci.com/dev-vibes/symbol-news-scripts)



A Travis CronJob that runs on a daily basis to refresh RSS Feeds for [symbol-wallet](https://github.com/nemgrouplimited/symbol-desktop-wallet) news page

### Why?
The [symbol-wallet](https://github.com/nemgrouplimited/symbol-desktop-wallet) uses [rssmix aggregator](http://www.rssmix.com/) as the main resource for building news feeds in the app, Since rssmix doesn't support HTTPS protocol but, only HTTP which could lead to a Potential Content Spoofing vulnerability. To diminish that problem we decided to host the [xml-content](https://nemgrouplimited.github.io/symbol-news/) returned from the aggregator on [github-page](https://github.com/nemgrouplimited/symbol-news) and then consume it in wallet over HTTPS to avoid MiTM attacks and responses manipulation.

### How it functions?
1. It clones symbol-news repository
2. Update hosted file content with latest [rss-feeds](http://rssmix.com/u/11801188/rss.xml)
3. Push updates back to [symbol-news](https://github.com/nemgrouplimited/symbol-news) 
