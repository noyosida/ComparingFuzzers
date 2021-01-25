-dataフォルダ
3節の再現実験および4節の拡張実験の実験結果が含まれています．
命名規則は次の通りです．
対象のプログラム名_使用したツール名
例えばobjdump_afl-1.94bは，プログラムobjdumpに対して，ファジングツールAFL-1.94bを適用した結果です．
※afl-rbは，fairfuzzを指します．
形式は次の通りです
経過時間，検出したパス数，検出したクラッシュ数
例えば0.8075,1444,27は，0.8075時間ツールを実行した時点で，1444のパスと27のクラッシュを検出したことを意味しています．

--replication_aflfastフォルダ
3章のAFLFastの再現実験の結果です．
--replication_fairfuzzフォルダ
3章のFairFuzzの再現実験の結果です．
--replication_aflfast_add_versionフォルダ
4章1節のAFLFastの再現実験の拡張の結果です
--replication_fairfuzz_add_versionフォルダ
4章1節のfairfuzzの再現実験の拡張の結果です
--lava-mフォルダ
4章2節のlava-mに適用した場合の結果です．


-graphフォルダ
3章の再現実験および4章の拡張実験の実験結果のグラフが含まれています．
フォルダ構造はdataフォルダと同様です．
dataフォルダから新たに追加されたフォルダは以下の通りです．
--boxplotフォルダ
4章の実験結果のboxplotが保存されています．
--add_testsuiteフォルダ
4章のbinutilsのtestsuiteをもとにファジングを実行した際のブランチカバレッジがまとめられています．
