# Etude I
## Жизнь диктует свои законы
## КЛЕТОЧНЫЕ АВТОМАТЫ И МАШИННАЯ ГРАФИКА

Жизнь — это многоклеточное сообщество, населяющее пустыни Флатландии. Пустыня представляет собой квадратную решетку, каждая ячейка которой вмещает одну клетку Жизни. Мерой течения времени служит смена поколений Жизни, приносящая в колонию клеток смерть и рождение.

Чтобы проследить за историей развития колонии, разместим в пустыне клетки Жизни в их начальном положении. Смена поколений будет происходить по следующим правилам.

1. Соседями клетки считаются все клетки, находящиеся в восьми ячейках, расположенных рядом с данной по горизонтали, вертикали или диагонали.
2. Если у некоторой клетки меньше двух соседей, она погибает от одиночества. Если клетка имеет больше трех соседей, она погибает от тесноты.
3. Если рядом с пустой ячейкой окажется ровно три соседние клетки Жизни, то в этой ячейке рождается новая клетка.
4. Гибель и рождение происходят в момент смены поколений. Таким образом, гибнущая клетка может способствовать рождению новой, но рождающаяся клетка не может воскресить гибнущую, и гибель одной клетки, уменьшив локальную плотность населения, не может предотвратить гибель другой.

## Задача
Напишите программу, моделирующую колонию Жизни. Исходными данными служит начальное расположение клеток, а в качестве результата нужно получить вид сверху всех поколений колонии.
