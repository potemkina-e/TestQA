﻿#language: ru


Функционал: проверка расчета суммы документа Заказ

Как Менеджер по закупкам я хочу
создание документа Заказ и проверка расчета суммы
чтобы проверять сумму в документе при изменении количества и цены   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: создание документа Заказ и проверка расчета суммы
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю "Продажи" "Заказ"
	Тогда открылось окно "Заказ (создание)"
* Заполнение шапки документа
	И из выпадающего списка с именем 'Организация' я выбираю точное значение "ООО \"Все для дома\""
	И я нажимаю кнопку выбора у поля с именем 'Покупатель'
	Тогда открылось окно "Контрагенты"
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование"    |
		| "000000005" | "Скороход АО" |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Заказ (создание) *"
	И из выпадающего списка с именем 'Склад' я выбираю точное значение "Малый"
	И из выпадающего списка с именем 'ВидЦен' я выбираю точное значение "Розничная"
	И из выпадающего списка с именем 'Валюта' я выбираю точное значение "Рубли"
* Заполнение товарной части
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
	Тогда открылось окно "Товары"
	И в таблице 'Список' я перехожу на один уровень вниз
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000031" | "Босоножки"    |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно "Заказ (создание) *"
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыЦена'
	И в таблице 'Товары' в поле с именем 'ТоварыЦена' я ввожу текст "3 000,00"
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "2"
	И я перехожу к следующему реквизиту
	И в таблице 'Товары' я завершаю редактирование строки
* Проверка расчета суммы
	Тогда таблица 'Товары' стала равной:
		| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'    |
		| 'Босоножки' | '3 000,00' | '2'          | '6 000,00' |
* Проверка расчета суммы при изменении цены и количества
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыЦена'
	И в таблице 'Товары' я выбираю текущую строку
	И в таблице 'Товары' в поле с именем 'ТоварыЦена' я ввожу текст "4 000,00"
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' я выбираю текущую строку
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "3"
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыСумма'
	Тогда таблица 'Товары' стала равной:
		| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'     |
		| 'Босоножки' | '4 000,00' | '3'          | '12 000,00' |	
	И я нажимаю на кнопку "Записать"
* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна "Заказ (создание) *" в течение 20 секунд
* Проверка создания документа
	И В командном интерфейсе я выбираю "Продажи" "Заказы"
	И таблица "Список" содержит строки:
		| 'Номер' |
		| '$Номер$'   |