# -*- coding: utf-8 -*-
require "saize/version"
require 'egison'
require 'set'

module Saize
  # 松屋の商品。価格は、牛めしなら並盛など、標準の量と思われるものを入れておく
  Menu = Struct.new(:pattern, :price)

  # 松屋に実際にあるメニュー。
  # 牛めしのようにプレミアムとそうでないものがある場合は、プレミアムだけを書く
  # オリジナルカレギュウ（プレミアム牛肉使用）も、プレミアムとして扱い、プレミアム牛肉使用と書いていないほうは書かない
  Sample = Set.new([ Menu.new(%i[彩り ガーデン サラダ], 630),
                    Menu.new(%i[小エビ の サラダ], 630),
                    Menu.new(%i[やわらか チキン の サラダ], 630),
                    Menu.new(%i[わかめ サラダ], 630),
                    Menu.new(%i[イタリアン サラダ], 630),
                    Menu.new(%i[シーフード サラダ], 630),
                    Menu.new(%i[半熟 卵 と ポーク の サラダ], 630),
                    Menu.new(%i[コーン クリーム スープ], 630),
                    Menu.new(%i[冷たい パンプキン スープ (季節限定)], 630),
                    Menu.new(%i[たっぷり 野菜 の ミネストローネ (季節限定)], 630),
                    Menu.new(%i[削り たて ペコリーノ チーズ], 630),
                    Menu.new(%i[ミニフィセル], 630),
                    Menu.new(%i[ガーリック トースト], 630),
                    Menu.new(%i[セット ドリンク バー], 630),
                    Menu.new(%i[辛味 チキン], 630),
                    Menu.new(%i[アスパラガス の オーブン 焼き (季節限定)], 630),
                    Menu.new(%i[ポップコーン シュリンプ], 630),
                    Menu.new(%i[エスカルゴ の オーブン 焼き], 630),
                    Menu.new(%i[ムール貝 の ガーリック 焼き], 630),
                    Menu.new(%i[野菜 ソース の グリル ソーセージ], 630),
                    Menu.new(%i[チョリソー], 630),
                    Menu.new(%i[柔らか 青豆 の 温 サラダ], 630),
                    Menu.new(%i[ほうれん草 の ソテー], 630),
                    Menu.new(%i[キャベツ と アンチョビ の ソテー], 630),
                    Menu.new(%i[ポテト の グリル], 630),
                    Menu.new(%i[セロリ の ピクルス (季節限定)], 630),
                    Menu.new(%i[真 イカ の パプリカ ソース], 630),
                    Menu.new(%i[フォッカチオ], 630),
                    Menu.new(%i[プチ フォッカ], 630),
                    Menu.new(%i[セット プチ フォッカ], 630),
                    Menu.new(%i[グラス ワイン], 630),
                    Menu.new(%i[デカンタ ・ 250 ml], 630),
                    Menu.new(%i[デカンタ ・ 500 ml], 630),
                    Menu.new(%i[キリン 一番 搾り （ジョッキ）], 630),
                    Menu.new(%i[キリン 一番 搾り （グラス）], 630),
                    Menu.new(%i[ストロング ゼロ ダブル レモン], 630),
                    Menu.new(%i[マグナム ・ 1500 ml], 630),
                    Menu.new(%i[グラッパ], 630),
                    Menu.new(%i[ランブルスコ セッコ （赤） 辛口], 630),
                    Menu.new(%i[ランブルスコ （ロゼ） 甘口], 630),
                    Menu.new(%i[ベルデッキオ （辛口・中）], 630),
                    Menu.new(%i[キャンティ （辛口・やや重い）], 630),
                    Menu.new(%i[キャンティ ル フィナ リゼルパ （辛口・重い）], 630),
                    Menu.new(%i[サイゼリヤ プレミアム （辛口・重い）], 630),
                    Menu.new(%i[サントリー オール フリー], 630),
                    Menu.new(%i[フレッシュ チーズ と トマト の サラダ], 630),
                    Menu.new(%i[フレッシュ チーズ と トマト の サラダ (Wサイズ)], 630),
                    Menu.new(%i[プロ シュート], 630),
                    Menu.new(%i[プロ シュート (Wサイズ)], 630),
                    Menu.new(%i[熟成 ミラノ サラミ], 630),
                    Menu.new(%i[熟成 ミラノ サラミ (Wサイズ)], 630),
                    Menu.new(%i[マルゲリータ ピザ], 630),
                    Menu.new(%i[パンチェッタ の ピザ], 630),
                    Menu.new(%i[野菜 と きのこ の ピザ], 630),
                    Menu.new(%i[やわらか イカ の アンチョビ の ピザ], 630),
                    Menu.new(%i[バッファロー モッツァレラ の ピザ], 630),
                    Menu.new(%i[ミラノ サラミ の ピザ], 630),
                    Menu.new(%i[ほうれん草 の グラタン (季節限定)], 630),
                    Menu.new(%i[シーフード グラタン], 630),
                    Menu.new(%i[アラビアータ], 630),
                    Menu.new(%i[ミートソース ボロニア 風], 630),
                    Menu.new(%i[半熟 卵 の ミートソース ボロニア 風], 630),
                    Menu.new(%i[アーリオ ・ オーリオ], 630),
                    Menu.new(%i[キャベツ の ペペロンチーノ], 630),
                    Menu.new(%i[タラコ ソース シシリー 風], 630),
                    Menu.new(%i[スープ 入り トマト 味 ボンゴレ (季節限定)], 630),
                    Menu.new(%i[パルマ 風 スパゲッティ], 630),
                    Menu.new(%i[イカ の 墨 入り スパゲッティ], 630),
                    Menu.new(%i[カルボナーラ], 630),
                    Menu.new(%i[アスパラガス と エビ の クリーム スパゲッティ (季節限定)], 630),
                    Menu.new(%i[アラビアータ (Wサイズ)], 630),
                    Menu.new(%i[ミートソース ボロニア 風 (Wサイズ)], 630),
                    Menu.new(%i[アーリオ ・ オーリオ (Wサイズ)], 630),
                    Menu.new(%i[キャベツ の ペペロンチーノ (Wサイズ)], 630),
                    Menu.new(%i[タラコ ソース シシリー 風 (Wサイズ)], 630),
                    Menu.new(%i[パルマ 風 スパゲッティ (Wサイズ)], 630),
                    Menu.new(%i[イカ の 墨 入り スパゲッティ (Wサイズ)], 630),
                    Menu.new(%i[カルボナーラ (Wサイズ)], 630),
                    Menu.new(%i[アスパラガス と エビ の クリーム スパゲッティ (季節限定) (Wサイズ)], 630),
                    Menu.new(%i[トッピング 半熟 卵], 630),
                    Menu.new(%i[ミラノ 風 ドリア], 630),
                    Menu.new(%i[半熟 卵 の ミラノ 風 ドリア], 630),
                    Menu.new(%i[セット プチ フォッカ 付き ミラノ 風 ドリア], 630),
                    Menu.new(%i[いろどり 野菜 の ミラノ 風 ドリア], 630),
                    Menu.new(%i[エビ と イカ の ドリア], 630),
                    Menu.new(%i[シーフード パエリア], 630),
                    Menu.new(%i[エビ と 野菜 の トマト クリーム リゾット], 630),
                    Menu.new(%i[ハヤシ & ターメリックライス], 630),
                    Menu.new(%i[半熟 卵 の ハヤシ ＆ ターメリック ライス], 630),
                    Menu.new(%i[ミックス グリル], 630),
                    Menu.new(%i[ハンバーグ ステーキ], 630),
                    Menu.new(%i[デミ グラス ソース の ハンバーグ], 630),
                    Menu.new(%i[野菜 ソース の ハンバーグ (ディアボラ風)], 630),
                    Menu.new(%i[イタリアン ハンバーグ], 630),
                    Menu.new(%i[焼肉 と ハンバーグ の 盛合せ], 630),
                    Menu.new(%i[若 鶏 の グリル (ディアボラ風)], 630),
                    Menu.new(%i[柔らか チキン の チーズ 焼き], 630),
                    Menu.new(%i[パンチェッタ と 若鶏 の グリル], 630),
                    Menu.new(%i[リブ ステーキ], 630),
                    Menu.new(%i[ライス], 630),
                    Menu.new(%i[ラージライス], 630),
                    Menu.new(%i[スモール ライス], 630),
                    Menu.new(%i[カプチーノ (アイスケーキ) (季節限定)], 630),
                    Menu.new(%i[ティラミス (アイスケーキ)], 630),
                    Menu.new(%i[シナモン フォッカチオ], 630),
                    Menu.new(%i[プリン と カプチーノ の 盛合せ], 630),
                    Menu.new(%i[プリン と ティラミス の 盛合せ], 630),
                    Menu.new(%i[ミルク アイス のせ シナモン フォッカチオ], 630),
                    Menu.new(%i[ミルク ジェラート], 630),
                    Menu.new(%i[シチリア 産 レモン の ソルベ], 630),
                    Menu.new(%i[イタリアン プリン], 630),
                    Menu.new(%i[チョコレート ケーキ], 630),
                    Menu.new(%i[コーヒー ゼリー], 630),
                    Menu.new(%i[トリフ アイスクリーム], 630),
                   ])

  # 松屋の朝定食
  Morning = Set.new()

  # 松屋ネットワーク
  NetworkNode = Struct.new(:node, :follow) do
    def inspect
      "#<#{node}->(#{follow.inspect})>"
    end
  end

  class << self
    # こんなことに使われるなんて可哀想なライブラリだな
    include Egison

    # 松屋ネットワークを構築し、始点を返す。
    # ==== Return
    # Matsuya::NetworkNode beginノード
    def network
      dic = {begin: NetworkNode.new(:begin, [])}
      Sample.each do |menu|
        [:begin, *menu.pattern, menu.price].each_cons(2) do |current, follow|
          node = dic[current] ||= NetworkNode.new(current, [])
          if follow.is_a? Symbol
            node.follow << dic[follow] ||= NetworkNode.new(follow, [])
          else
            node.follow << follow
          end
        end
      end
      dic.values
    end

    # お客様に提供する商品を作る。私は接客は不得意なので、ランダムなものが出てくる。
    # おかの値が1に近づくほど狂った商品が出てくる。
    # ==== Args
    # [okano:]
    #   Float おかの値。おかの値が高いと商品が変異する確率が上がる。0-1の範囲の値。
    # [current:]
    #   Matsuya::NetworkNode 再帰呼出し用。省略する。
    # ==== Return
    # Array 材料を並べた配列
    def generate(okano: 0.1, current: network.find{|n|n.node == :begin})
      if current.is_a? NetworkNode
        nex = current.follow.sample
        if nex.is_a?(NetworkNode) and rand < okano
          [current.node, *generate(okano: okano, current: network.sample)]
        else
          [current.node, *generate(okano: okano, current: nex)]
        end
      end
    end

    # 材料を選択したら釜に入れてぐーるぐーる。
    # キムカル丼のように、『キムチ＋カルビ』がキムカルに変化するなど、松屋活用を考慮して
    # Matsuya.generate の戻り値をStringに変換する
    # ==== Args
    # [dish] Array 現在の皿の状態
    # ==== Return
    # String できたー！どの特性を残そう？
    def preparation(dish)
      match(dish) do
        with(Egison::List.(*_head, :+, *_tail)) do
          if tail.last == :セット
            [head, :'　', :ミニ, tail]
          else
            [head, :'　', :ミニ, tail, :セット]
          end
        end

        with(Egison::List.(*_head, :キムチ, :カルビ, *_tail)) do
          [head, :キムカル, tail]
        end

        with(Egison::List.(*_head, :ビビンバ, :丼, *_tail)) do
          [head, :ビビン丼, tail]
        end

        with(Egison::List.(*_head, :鶏, :チリ, *_tail)) do
          [head, :鶏のチリ, tail]
        end

        with(Egison::List.(*_head, :カルビ, :焼肉, *_tail)) do
          [head, :カルビ焼, tail]
        end

        with(Egison::List.(*_head, :旨, :トマト, *_tail)) do
          [head, :うまトマ, tail]
        end

        with(Egison::List.(*_head, :鶏, :グリル, *_tail)) do
          [head, :チキン, :グリル, tail]
        end

        with(Egison::List.(*_head, :プレミアム, *_center, :（プレミアム牛肉使用）, *_tail)) do
          [head, :プレミアム, center + tail]
        end

        with(Egison::List.(*_head, :牛, :めし, *_center, :（プレミアム牛肉使用）, *_tail)) do
          [:プレミアム, head, :牛, :めし, center + tail]
        end

        with(Egison::Multiset.(*_not_match)) do
          not_match
        end
      end
        .map{|node| if node.is_a? Array then preparation(node) else node end }
        .flatten
    end

    # 商品を注文し、商品を受け取る
    # ==== Args
    # [okano]
    #   Float おかの値。おかの値が高いと商品が変異する確率が上がる。0-1の範囲の値。
    # ==== Return
    # String 商品名
    def order(okano=0.1) # !> shadowing outer local variable - ys2
      preparation(generate.reject{|x|x==:begin}).join
    end
  end
end
