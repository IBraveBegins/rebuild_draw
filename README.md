## 小颗粒度方式：优化频繁build绘制导致性能降低的问题
> FlutterSDK 3.16.0
## 问题描述
在同一个setState内的widget，其中任意一个widget发生变化，都会触发build，导致同一个setState内所有widget都重绘，
如果其他widget没有依赖发生变化的widget，这样的重绘会导致性能问题(如卡顿帧率降低、内存泄漏)。

## 优化方法
1. 频繁build的widget而且其他widget不依赖与它，就把它单独封装成一个StatefulWidget，让它只在这个节点重绘，就不影响其他widget。
2. 绘制复杂的widget用const修饰，const修饰的widget被创建过以后，就不会再重建。

## Tips
CSDN https://ibrave.blog.csdn.net/article/details/134684331?spm=1001.2014.3001.5502
