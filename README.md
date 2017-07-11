# LFS Book 翻译项目 [![Build Status](https://travis-ci.org/LCTT/LFS-BOOK.svg?branch=8.0-rc1-translating)](https://travis-ci.org/LCTT/LFS-BOOK)

## 当前任务

* 参考之前已完成的 [LCTT/LFS-BOOK-7.7-systemd][1] 项目和未完成的 [7.8-systemd-translating][2] 分支对上游的 [8.0-rc1][3] 版本进行翻译。

最新构建版本：

* [https://lctt.github.io/LFS-BOOK/][4]

### 合并 7.8 整理内容

* **已完成**   章节 1-9
* **已完成**   序章 & 附录

### 翻译 8.0-rc1 新增内容

需要重新翻译的小节：

* **已完成**   chapter01/changelog.xml（改得太多）
* **已完成**   chapter02/stages.xml（新章节）

部分内容需要翻译的小节：

#### systemd

* **已完成**   chapter02/aboutlfs.xml
* **已完成**   chapter02/creatingpartition.xml
* **已完成**   chapter02/introduction.xml
* **已完成**   chapter03/packages.xml
* **已完成**   chapter05/gcc-pass1.xml
* **已完成**   chapter05/gcc-pass2.xml
* **已完成**   chapter05/tcl.xml
* **已完成**   chapter05/texinfo.xml
* **已完成**   chapter05/toolchaintechnotes.xml
* **已完成**   chapter06/adjusting.xml
* **已完成**   chapter06/bash.xml
* **已完成**   chapter06/binutils.xml
* **已完成**   chapter06/bison.xml
* **已完成**   chapter06/creatingdirs.xml
* **已完成**   chapter06/flex.xml
* **已完成**   chapter06/gcc.xml
* **已完成**   chapter06/glibc.xml
* **已完成**   chapter06/gmp.xml
* **已完成**   chapter06/groff.xml
* **已完成**   chapter06/grub.xml
* **已完成**   chapter06/iproute2.xml
* **已完成**   chapter06/kdb.xml
* **已完成**   chapter06/libcap.xml
* **已完成**   chapter06/man-db.xml
* **已完成**   chapter06/perl.xml
* **已完成**   chapter06/pkgconfig.xml
* **已完成**   chapter06/sed.xml
* **已完成**   chapter06/shadow.xml
* **已完成**   chapter06/systemd.xml
* **已完成**   chapter06/texinfo.xml
* **已完成**   chapter06/util-linux.xml
* **已完成**   chapter06/vim.xml
* **已完成**   chapter07/networkd.xml
* **已完成**   chapter07/udev.xml
* **已完成**   chapter07/symlinks.xml （大段追加）
* **已完成**   chapter07/systemd-custom.xml（大段追加）
* **已完成**   chapter08/kernel.xml
* **已完成**   chapter08/grub.xml
* **已完成**   chapter09/teend.xml

#### sysv

* **已完成**   chapter06/sysklogd.xml
* **已完成**   chapter06/sysvinit.xml
* **已完成**   chapter06/eudev.xml
* **已完成**   chapter07/introduction.xml
* **已完成**   chapter07/bootscripts.xml
* **martin**   chapter07/network.xml
* **martin**   chapter07/usage.xml
* **martin**   chapter07/profile.xml
* **已完成**   appendices/scripts.xml
* **已完成**   appendices/udev-rules.xml

以上为 sysv 独立章节，混合章节内部缓步更新。

### 校对

* **实施中**

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
[4]: https://lctt.github.io/LFS-BOOK/
[7]: https://github.com/LCTT/LFS-BOOK/tree/8.0-rc1-translating
[8]: https://github.com/LCTT/LFS-BOOK/tree/7.7-to-8.0-rc1-diff
[9]: https://github.com/LCTT/LFS-BOOK/tree/7.8-to-8.0-rc1-diff
[10]: https://github.com/LCTT/LFS-BOOK/tree/7.8-systemd
[11]: https://github.com/LCTT/LFS-BOOK/tree/7.8-systemd-translating
[12]: https://github.com/LCTT/LFS-BOOK-7.7-systemd
