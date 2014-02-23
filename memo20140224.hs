-- -----------
-- 2章型を信じろ!
-- -----------

-- :tで型を確認できる
:t 'a'
:t "abc"

-- 明示的な型宣言ができる

removeNonUppercase' :: [Char] -> [Char]
removeNonUppercase' st = [c | c <- st, c `elem` ['A'..'Z']]

removeNonUppercase' "Kanda Taiki"

-- 型変数

-- a, b, cなどの適当な文字
:t head
:t fst
:t snd

-- 型クラス→関数の分類?
-- インスタンス→関数の実際?

:t (==)
-- Eqの型制約は
-- - 2つの引数
-- - Boolを返す
-- -引数はEqクラスのインスタンス

-- Ord 比較
-- Show 文字列として表わせる
-- Read Showの対

-- 型注釈
-- :: Xxx で型推論を補助
read "5" :: Int
read "5" :: Float

-- Enum 順序のあるもの
-- Bounded 上限下限を持つ
-- Num 数
-- Floating
-- Integral
