#! /bin/bash

echo "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"
 \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">

<html>
<head>
<title>Some numerical results</title>
</head>

<body>

<h2>Some numerical results</h2>"

echo "<ol>"
for filename in `find . -name *.jpg | sort`
do
  echo "<li><a href=\"$filename\">$filename</a></li>"
done
echo "</ol>"

echo "<body>
</html>"
