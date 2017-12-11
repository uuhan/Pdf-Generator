# HsPDF

**./demo demo.conf**, 输出文稿: demo.pdf
简单的 **DSL** 来生成特定的PDF文档，比如
    (0, 0), F:Helvetica             -- 文稿的字体设置为: Helvetica
    (100, 100), T:example text      -- 在文稿的x: 100, y: 100处放置一条文字: "example text"
    (100, 100), P:./data/sample.png -- 在文稿的x: 100, y: 100处放置一张图片: sample.png
默认的文稿为横向A4纸张。

# TODO

[ ] 添加更丰富的指令集，比如表单，签名，注释
[ ] Monadic Form
[ ] Monadic Library Binding

