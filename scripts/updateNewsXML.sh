#!/bin/bash
cd symbol-news/
echo "Requesting RSS Feeds ..."
page="$(curl http://rssmix.com/u/11801188/rss.xml)"
> index.html
echo "Updating file content ..."
echo "$page" >> index.html
echo "print file after update"

echo find . -maxdepth 1 -type f -not -path '*/\.*' | sed 's/^\.\///g' | sort
cd ..