# 搭建博客

## 安装

全局安装：
```bash
> npm install amberpine -g
```

## 初始化：
```sh
> mkdir blog
> cd blog
> abp i
```
在当前目录生成结构：
1. source 目录存放博客文章列表。
2. assets 目录中存放静态资源，包含一个必须的 index.css 文件，可修改此文件来改变样式。

## 预览
```sh
> abp d
```
启动本地server，访问`localhost:8080`即可预览。参考 source/first-post 目录中的 yaml 文件和 md 文件进行写作，文章编辑保存时，浏览器会自动刷新以体现最新的进展。

## 构建
```
> abp
```
执行此命令将在 dist 目录下生成完整的站点，包含一个首页 index.html 和每篇文章的一个 html 页。目录树如下：
```sh
.
├── assets
│   ├── index.css
│   └── lanscape.jpg
├── dist
│   ├── blog
│   └── index.html
└── source
    ├── 1
    ├── blog.yaml
    └── first-post
```

## 发布
一般情况下，将 dist 目录作为根目录完整地发布到任何静态文件服务器即可。这里使用`github-pages`服务。

### 新建github仓库
在GitHub新建一个托管博客的仓库，这里命名为`blog`。

github-pages要求将静态文件内容放在仓库的`gh-pages`分支，才可访问到。所以，blog项目有两个分支：
- master, 保存博客的源码
- gh-pages, 保存生成的html文件

可通过如下地址访问：
```
<username>.github.io/<project>
```
这里的`<username>`填你的github帐号名，`<project>`填项目名。比如本博客可访问地址为：
`macguff.github.io/blog`。

### 创建gh-pages分支
执行如下命令来创建分支，并且删除不需要的文件：
```sh
$ git checkout --orphan gh-pages
$ git rm --cached -r .
$ git clean -df
```

现在，目录下应该只剩下 `dist` 目录了，首先，忽略一些文件：
```sh
$ echo "dist" >> .gitignore
$ git add .gitignore
$ git commit -m "Ignore some files"
```

然后，加入 dist 下的内容到分支中
```
$ cp -r dist/* .
$ git add .
$ git commit -m "publish"
```

### 上传至GitHub
现在，可以生成的静态内容上传到 `GitHub` 中 blog 项目的 gh-pages 分支了
```bash
$ git push -u origin gh-pages
```
现在，博客的内容已经上传到 GitHub 上，所以通过访问 macguff.github.io/blog 就可以访问博客了！
(完)