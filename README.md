# LFS Book 翻译项目 [![Build Status](https://travis-ci.org/LCTT/LFS-BOOK.svg?branch=8.0-rc1-translating)](https://travis-ci.org/LCTT/LFS-BOOK)

## 当前任务

* 参考之前已完成的 [LCTT/LFS-BOOK-7.7-systemd][1] 项目和未完成的 [7.8-systemd-translating][2] 分支对上游的 [8.0-rc1][3] 版本进行翻译。

最新构建版本：

* Systemd
  - [PDF][4]
  - [HTML/单页][5]
  - [HTML/分页][6]
* SysV（暂未构建）

### 合并 7.8 整理内容

* **已完成**   章节 1-9
* **已完成**   序章 & 附录

### 翻译 8.0-rc1 新增内容

需要重新翻译的小节：

* **已完成**   chapter01/changelog.xml（改得太多）
* **已完成**   chapter02/stages.xml（新章节）

部分内容需要翻译的小节：

* **已完成**   chapter02/aboutlfs.xml
* **已完成**   chapter02/creatingpartition.xml
* **已完成**   chapter02/introduction.xml
* **已完成**   chapter03/packages.xml
* **已完成**   chapter05/gcc-pass1.xml
* **已完成**   chapter05/gcc-pass2.xml
* **已完成**   chapter05/tcl.xml
* **已完成**   chapter05/texinfo.xml
* **martin**   chapter05/toolchaintechnotes.xml
* **martin**   chapter06/adjusting.xml
* **martin**   chapter06/bash.xml
* **martin**   chapter06/binutils.xml
* **martin**   chapter06/bison.xml
* **martin**   chapter06/creatingdirs.xml
* **martin**   chapter06/flex.xml
* **martin**   chapter06/gcc.xml
* **martin**   chapter06/glibc.xml
* **martin**   chapter06/gmp.xml
* **martin**   chapter06/groff.xml
* **martin**   chapter06/grub.xml
* **dongfengweixiao**   chapter06/iproute2.xml
* **dongfengweixiao**   chapter06/kdb.xml
* **dongfengweixiao**   chapter06/libcap.xml
* **dongfengweixiao**   chapter06/man-db.xml
* **dongfengweixiao**   chapter06/perl.xml
* **dongfengweixiao**   chapter06/pkgconfig.xml
* **dongfengweixiao**   chapter06/sed.xml
* **dongfengweixiao**   chapter06/shadow.xml
* **未实施**   chapter06/systemd.xml
* **未实施**   chapter06/texinfo.xml
* **未实施**   chapter06/util-linux.xml
* **未实施**   chapter06/vim.xml
* **未实施**   chapter07/udev.xml
* **已完成**   chapter07/symlinks.xml （大段追加）
* **未实施**   chapter07/systemd-custom.xml（大段追加）
* **未实施**   chapter08/kernel.xml
* **未实施**   chapter08/grub.xml
* **未实施**   chapter09/teend.xml

### 校对

* **未实施**

## 分支介绍

### 当前工作分支

当前原文分支：

* [8.0-rc1][3]

对应翻译分支：

* [8.0-rc1-translating][7]

版本区别分支：
* [7.7-to-8.0-rc1-diff][8]
* [7.8-to-8.0-rc1-diff][9]

### 旧版本分支

#### 7.8 相关：

原文分支：

* [7.8-systemd][10]

翻译分支：

* [7.8-systemd-translating][11]

#### 7.7 相关

原文分支：

* [LFS-BOOK-7.7-systemd][12]

## 协作规范

* **开始前，请务必保证阅读并理解** [CONTRIBUTING.md](CONTRIBUTING.md)

[1]: https://github.com/LCTT/LFS-BOOK-7.7-systemd
[2]: https://github.com/LCTT/LFS-BOOK/tree/7.8-systemd-translating
[3]: https://github.com/LCTT/LFS-BOOK/tree/8.0-rc1
[4]: https://lctt.github.io/LFS-BOOK/LFS-SYSD-BOOK.pdf
[5]: https://lctt.github.io/LFS-BOOK/LFS-SYSD-BOOK.html
[6]: https://lctt.github.io/LFS-BOOK/index.html
[7]: https://github.com/LCTT/LFS-BOOK/tree/8.0-rc1-translating
[8]: https://github.com/LCTT/LFS-BOOK/tree/7.7-to-8.0-rc1-diff
[9]: https://github.com/LCTT/LFS-BOOK/tree/7.8-to-8.0-rc1-diff
[10]: https://github.com/LCTT/LFS-BOOK/tree/7.8-systemd
[11]: https://github.com/LCTT/LFS-BOOK/tree/7.8-systemd-translating
[12]: https://github.com/LCTT/LFS-BOOK-7.7-systemd
