# symbol-news-scripts

[![Build Status](https://travis-ci.com/nemgrouplimited/symbol-news-scripts.svg?branch=main)](https://travis-ci.com/nemgrouplimited/symbol-news-scripts)

A Travis CronJob that runs on a daily basis to refresh RSS Feeds for [symbol-wallet](https://github.com/nemgrouplimited/symbol-desktop-wallet) news page.

## Why?

The [symbol-wallet](https://github.com/nemgrouplimited/symbol-desktop-wallet) uses [rssmix aggregator](http://www.rssmix.com/) as the main resource for building news feeds in the app. Since rssmix doesn't support HTTPS protocol but, only HTTP which could lead to a Potential Content Spoofing vulnerability. We decided to host the xml-content returned from the aggregator on [github-page](https://nemgrouplimited.github.io/symbol-news/) then consume it from wallet over HTTPS to avoid MiTM attacks and responses manipulation.

### How it functions?

1. First thing it clones [symbol-news repository](https://github.com/nemgrouplimited/symbol-news) which contains xml-content for news from previous build.
2. then executes [./updateNewsXMLUpdate.sh](https://github.com/nemgrouplimited/symbol-news-scripts/blob/main/scripts/updateNewsXML.sh) script that updates file content with latest [rss-feeds](http://rssmix.com/u/11801188/rss.xml) from rssmix.
3. finally executes [./pushUpdates.sh](https://github.com/nemgrouplimited/symbol-news-scripts/blob/main/scripts/pushUpdates.sh) to push back updates [symbol-news](https://github.com/nemgrouplimited/symbol-news) to host latest updates on Github Pages.
