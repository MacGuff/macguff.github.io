个人博客源码-[macguff.github.io][github-page]

## 安装Hexo
1. npm i hexo-cli -g,若报错，用root身份运行
2. hexo -v验证是否安装成功
3. hexo init初始化文件夹，接着输入npm install安装必备的组件
4. 安装一个扩展npm i hexo-deployer-git（部署到github会用到）
5. hexo g生成网站，hexo s启动本地服务器，然后浏览器打开localhost:4000/
6. 如果看到页面，说明一切正常;ctrl+c关闭服务器

## 写作
1. hexo new post "article title"
2. `hexo g;hexo s`本地预览效果

## 发布到github
1. 在github新建一个repo,要求名字格式必须为 你的github用户名.github.io
2. 打开博客根目录下的_config.yml文件，修改最后一行的配置：
   ```
   deploy:
     type: git
     repository: https://github.com/MacGuff/macguff.github.io
     branch: master
   ```
   repository修改为你自己的github项目地址
3. hexo d发布,访问[macguff.github.io][github-page]

[github-page]: https://macguff.github.io/
