---
title: 康威生命游戏
tags: 
- Cellular Automaton
cover: /assets/images/game of life.jpg
---
康威生命游戏是英国数学家John Horton Conway于1970年发明的一个零玩家游戏，其演变仅由其初始状态决定而不需要进一步输入。游戏在一个无限的二维网格上进行，每个格子称为一个“细胞”，它只有两种状态：存活或死亡。
<!--more-->
<style>
    iframe {
        margin-top: 20px;
        width: 100%;
        height: 600px;
    }
</style>

## 规则

- 任何一个活细胞，如果周围有两个或三个活的邻居，则其在下一轮中仍然存活；否则死亡。
- 任何一个死细胞，如果周围有三个活的邻居，则其在下一轮中复活。

## 示例

如下是康威生命游戏的在线模拟[^ref]，基本操作见下表。

<iframe src="/Game-of-Life.html"></iframe>

<table>
    <tbody>
        <tr><td>左键单击</td><td>移动视图</td></tr>
        <tr><td>右键单击</td><td>创建或删除细胞</td></tr>
        <tr><td>鼠标滚轮</td><td>缩放</td></tr>
        <tr><td>方向键，HJKL</td><td>平移视图</td></tr>
        <tr><td>+, -</td><td>缩放</td></tr>
        <tr><td>空格键</td><td>下一代</td></tr>
        <tr><td>制表键</td><td>执行多次下一代</td></tr>
        <tr><td>回车键</td><td>运行或停止</td></tr>
        <tr><td>退格键</td><td>重置</td></tr>
        <tr><td>]</td><td>加快模拟速度</td></tr>
        <tr><td>[</td><td>减慢模拟速度</td></tr>
        <tr><td>退出键</td><td>关闭弹出窗口</td></tr>
    </tbody>
</table>

[^ref]:基于[GitHub项目](https://github.com/copy/life)修改