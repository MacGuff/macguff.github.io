个人博客源码-[macguff.github.io][github-page]

## 安装Hexo
1. `npm i hexo-cli -g`,若报错，用root身份运行
2. `hexo -v`验证是否安装成功
3. `hexo init`初始化文件夹，接着输入`npm install`安装必备的组件
4. 安装一个扩展`npm i hexo-deployer-git`（部署到github会用到）
5. `hexo g`生成网站，`hexo s`启动本地服务器，然后浏览器打开localhost:4000/
6. 如果看到页面，说明一切正常;ctrl+c关闭服务器

## 写作
1. `hexo new post "article title"`
2. `hexo g;hexo s`本地预览效果

## 发布到github
1. 在github新建一个repo,名字必须为 github-username.github.io
2. 打开博客根目录下的_config.yml文件，修改最后一行的配置：
   ```
   deploy:
     type: git
     repository: https://github.com/MacGuff/macguff.github.io
     branch: gh-pages
   ```
   repository修改为你自己的github项目地址
3. `hexo d`发布,访问[macguff.github.io][github-page]

[github-page]: https://macguff.github.io/
