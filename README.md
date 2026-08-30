# disk9scver

常駐している9SCDRV.Xのバージョンを調べて表示します。

_X_KPCHK.Oの動作検証用です。
_X_KPCHK.Oをそのまま使っているため、後述する不具合の影響を受けます。


## _X_KPCHK.Oの不具合

* 常駐プロセス以外のメモリブロックを9SCDRV.Xの常駐部と誤認する可能性があります。
* メモリブロックの範囲外のアドレスから値を読み込む場合があります。
  これにより、以下の症状が発生します。
  * 9SCDRV.Xではないメモリブロックを9SCDRV.Xの常駐部と誤認する可能性があります。
  * 該当アドレスにメモリが存在しない場合、バスエラーが発生します。


## Build

PCやネット上での取り扱いを用意にするために、src/内のファイルはUTF-8で記述されています。
X680x0上でビルドする際には、UTF-8からShift_JISへの変換が必要です。

### src2buildを使用する場合

必要ツール: [src2build](https://github.com/kg68k/src2build)

srcディレクトリのある場所で以下のコマンドを実行します。
```
src2build src
make -C build
```

### その他の方法

src/内のファイルを適当なツールで適宜Shift_JISに変換して別のディレクトリに保存し、
ディレクトリ内で`make`を実行してください。  
UTF-8のままでは正しくビルドできません。


## License

GNU General Public License version 3 or later.


## Author

9SCSET.LZHおよびそれに含まれる_X_KPCHK.Oは、6no8rou氏によるものです。

それ以外の部分はTcbnErikにより作成されました。

TcbnErik / https://github.com/kg68k/disk9scver
