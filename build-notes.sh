#!/bin/bash

base_dir=`pwd`
notes_dir=$base_dir/notes
#source_dir=$base_dir/source
notes_dir_out=$base_dir/public/notes

echo "start build notes..."
echo

cd $notes_dir
rm -rf $notes_dir_out

for book in *; do
    if [ -d $book ]; then
        mkdir -p $notes_dir_out/$book
        (cd $book
        echo "start build $book..."
        ./build.sh $notes_dir_out/$book
        )
    fi
done

# 生成notes/index.html

cat >> index.html << eof
<html>
<head>
	
	<title></title>
	<meta name="keywords" content="blog" />

    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    
        
<link rel="stylesheet" href="/css/bootstrap.min.css">

        
<link rel="stylesheet" href="/css/bootstrap-theme.min.css">

        <link href="/css/home.css?v=3" rel="stylesheet" type="text/css" />

    

    <link rel="alternate" type="application/atom+xml" href="/atom.xml" title="Atom feed">

    
	<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico?v=3"/>
    
    

<meta name="generator" content="Hexo 4.2.1"></head>

<body>
<nav class="navbar navbar-default navbar-fixed-top" style="opacity: .9" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
            
                
                    <li  class="active" >
                        <a href="/"> Blog</a>
                    </li>
                
                    <li >
                        <a href="/notes"> Notes</a>
                    </li>
                
                    <li >
                        <a href="https://github.com/macguff" target="_blank" rel="noopener"> GitHub</a>
                    </li>
                
            
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div class="row" style="padding-top: 70px">
    <div class="container center-block">
        <div class="col-md-2"></div>
        <div class="col-md-8 col-sm-12">
            <div class="panel panel-default">
eof

cat >> index.html << eof
                <ul class="list-group">
                    
                    
                     
<li class="list-group-item title">
	<div class="date">2020年5月28日</div>
    <a href="mysql/" target="_blank">mysql读书笔记</a>
</li>


                    
                     
<li class="list-group-item title">
	<div class="date">2020年4月1日</div>
    <a href="think-in-java/" target="_blank">java编程思想</a>
</li>


                    
                    
                </ul>
eof

cat >> index.html << eof
            </div>
        </div>

        <div class="col-md-2">
        </div>
<div style="display:none">
<script src="http://s4.cnzz.com/stat.php?id=&web_id=" language="JavaScript"></script>
</div>
    </div>
</div>



<!--加载导航栏所需js文件-->
<script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>



</body>
</html>
eof
cp -rf index.html $notes_dir_out/index.html

rm -rf *.html

echo
echo "build all notes ok!"