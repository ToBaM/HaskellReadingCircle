-- -------------
-- 3章 関数の構文
-- -------------

-- パターンマッチ

-- 与えられた数が7かどうか調べる関数

-- 大事!!
:set +m
-- 複数行に渡って関数を定義
-- let
-- ;
-- を忘れないように

let {lucky :: Int -> String;
	 lucky 7 = "LUCKY NUMBER SEVEN!" ;
	 lucky n = "Sorry, you're out of luck, pal!";
	}

lucky 7
lucky 8

-- 小文字からはじまる名前がワイルドカード

-- もうちょっとややこしいの

let {sayMe :: Int -> String; sayMe 1 = "One";
	 sayMe 2 = "Two"; 
	 sayMe 3 = "Three";
	 sayMe x = "Not Between 1 and 5";}

sayMe 1
sayMe 2
sayMe 3
sayMe 10

-- 階乗を再帰的に定義
let {fuctorial :: Int -> Int;
	 fuctorial 0 = 1;
	 fuctorial n = n * fuctorial (n - 1);
	}

fuctorial 2
fuctorial 5
fuctorial 1

-- タプルのマッチ

let {
addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double);
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2);
}

addVectors (1.0, 2.0) (3.0, 4.0)

-- トリプルの各要素を取り出す関数

let {
	first :: (a, b, c) -> a;
	first (x, _, _) = x;
}

first (1, 2, 3)

let {
	second :: (a, b, c) -> b;
	second (_, x, _) = x;
}

second (1, 2, 3)

let {
	third :: (a, b, c) -> c;
	third (_, _, x) = x;
}

third (1, 2, 3)

let {xs = [(1, 2), (3, 4), (5, 6), (7, 8)];}
[a + b | (a, b) <- xs]

-- head関数を再定義
let {
	head' :: [a] -> a;
	head' [] = error "List is empty!";
	head' (x:_) = x;
}

head' xs
head' []

-- asパターン
let {
	firstLetter :: String -> String;
	firstLetter "" = "Empty String!";
	firstLetter all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]
}

firstLetter "Dracula"

-- ---------------------------
-- 場合分けして，きっちりガード!
-- ---------------------------

let {
	bmiTell :: Double -> String;
	bmiTell bmi
		|bmi <= 18.5 = "Underweight!"
		|bmi <= 25.0 = "Normal!"
		|bmi <= 30.0 = "Fat!"
		|otherwise = "Congratulations!";
}

-- ガードの複数行の場合は注意

-- 独自のmax関数

let {
	max' :: (Ord a) => a -> a -> a;
	max' a b
	|a <= b = b
	|otherwise = a;
}

max' 1 2
max' 2 1