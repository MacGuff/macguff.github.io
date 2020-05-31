---
title:  检查命令是否安装
date: 2020-04-01
---

有时我们需要确定一个命令是否在当前的系统已经安装，并且可以直接通过名字调用。比如我们写了一个JAVA应用，给用户提供的启动脚本里，可能需要做这样的检测：
```sh
cmd=java
for p in ${PATH//:/ }; do
	if test -f $p/$cmd; then
		echo "java is: $p/$cmd"
		exit 0
	fi
done
echo "java is not installed"
exit 1
```
但是，这种方法并不优雅，我们有其他的间接方法来完成任务。

### hash
shell将命令的完整路径存在一个内部的hash表里（避免每次执行命令都去搜索PATH路径列表）`hash` cmd会执行这一操作，如果命令不存在于PATH，返回失败，因此我们可以用它来检查。
```sh
if hash java > /dev/null 2>&1; then
	echo "java is available"
fi
```

### command
`command`命令的-v选项会跳过函数，它也会执行PATH搜索，
因此我们也可以用它来检查。
```sh
if command -v java >/dev/null 2>&1; then
	ehco "java is available"
fi
```

### which
which命令会搜索路径，同样可以达到目的。