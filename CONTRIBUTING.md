# LFS Book 协作规范

* 「LFS Book」翻译项目使用 GitHub 进行仓库维护。
* 中心代码仓库 **[LCTT/LFS-BOOK](https://github.com/LCTT/LFS-BOOK)** 不再允许翻译人员进行直接 Push，对于所有提交请先创建分支、作出修改、然后发出 Pull Request 以供审核。

## 初始化工作环境

1. Fork 中心代码仓库 **[LCTT/LFS-BOOK](https://github.com/LCTT/LFS-BOOK)**。
2. 使用任意类 Unix 系统（如 Linux、OS X）`$ git clone <自己的代码仓库>`。
3. `$ git remote add upstream git@github.com:LCTT/LFS-BOOK.git`

## 推送提交流程

1. Pull 自己的对应翻译分支到上游最新版本。
  1. 切换到当前翻译分支：`$ git checkout <当前翻译分支>`。
  2. Pull 上游 develop 分支：`$ git pull upstream <当前翻译分支>`。
2. 创建新的分支 `$ git checkout -b <分支名> <当前翻译分支>`。
  - 注意：分支名尽量有意义，并使用 `-` 连接小写英文单词和数字组合作为名称，例如：`translate-chapter-1`、`fix-typo-chapter-3-section-1`。
3. Commit 更改：执行 `git commit` 并编写 Commit 信息。
  - 提示：Commit 信息规范参考 **[「Pro Git 第二版」 章节 5.2 分布式 Git - 为项目作贡献](http://git-scm.com/book/zh/v1/%E5%88%86%E5%B8%83%E5%BC%8F-Git-%E4%B8%BA%E9%A1%B9%E7%9B%AE%E4%BD%9C%E8%B4%A1%E7%8C%AE)**。
4. Push 分支：执行 `git push -u origin <分支名>` 以发布 Commit 的更改到自己的代码仓库。
5. 登录 GitHub 发起 PR 并等待审核。

> 注意：请在 PR 前在本地确保没有错字、书写风格或翻译错误，以加速审核。
> 警告：请不要在本地编辑原文分支或翻译分支以及 master 以防止 PR 无法自动 merge。

## 文档风格

**TODO**

## 术语表

**TODO**
