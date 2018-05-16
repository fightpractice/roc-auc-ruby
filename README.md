# roc-auc-ruby
`参考自 https://github.com/benhamner/Metrics/tree/master/Python,因为没发现ruby关于ROC曲线的auc计算因此参考这个pip包写了一个`

# example

` => actual = [1,1,1,0,0,0] `

` => posterior = [0.9,0.8,0.4,0.5,0.2,0.1] `

` => auc = RocAuc.auc(actual,posterior) `

` => 0.8888888888888888 `

