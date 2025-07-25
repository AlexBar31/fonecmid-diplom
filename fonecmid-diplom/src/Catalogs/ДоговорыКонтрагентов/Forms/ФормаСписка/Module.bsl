
//ВКМ_Начало: Задача 1.1.*******************************************

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Список.ТекстЗапроса ="ВЫБРАТЬ
	|СправочникДоговорыКонтрагентов.Ссылка КАК Ссылка,
	|СправочникДоговорыКонтрагентов.ПометкаУдаления КАК ПометкаУдаления,
	|СправочникДоговорыКонтрагентов.Владелец КАК Владелец,
	|СправочникДоговорыКонтрагентов.Код КАК Код,
	|СправочникДоговорыКонтрагентов.Наименование КАК Наименование,
	|СправочникДоговорыКонтрагентов.Организация КАК Организация,
	|СправочникДоговорыКонтрагентов.ВидДоговора КАК ВидДоговора,
	|СправочникДоговорыКонтрагентов.ВКМ_ДатаНачала КАК ДатаНачала,
	|СправочникДоговорыКонтрагентов.ВКМ_ДатаОкончания КАК ДатаОкончания,
	|СправочникДоговорыКонтрагентов.ВКМ_СуммаАбонПлаты КАК СуммаАбонПлаты,
	|СправочникДоговорыКонтрагентов.ВКМ_СтоимостьЧасаРаботы КАК СтоимостьЧасаРаботы,
	|СправочникДоговорыКонтрагентов.Предопределенный КАК Предопределенный,
	|СправочникДоговорыКонтрагентов.ИмяПредопределенныхДанных КАК ИмяПредопределенныхДанных,
	|ВЫБОР
	|	КОГДА НаличиеФайлов.ЕстьФайлы ЕСТЬ NULL
	|		ТОГДА 0
	|	КОГДА НаличиеФайлов.ЕстьФайлы
	|		ТОГДА 1
	|	ИНАЧЕ 0
	|КОНЕЦ КАК ЕстьФайлы
|ИЗ
|	Справочник.ДоговорыКонтрагентов КАК СправочникДоговорыКонтрагентов
|		ЛЕВОЕ СОЕДИНЕНИЕ РегистрСведений.НаличиеФайлов КАК НаличиеФайлов
|		ПО СправочникДоговорыКонтрагентов.Ссылка = НаличиеФайлов.ОбъектСФайлами";
	
    // Массив для новых реквизитов
    ДобавляемыеРеквизиты = Новый Массив();
	// Описываем новые ревизиты формы
    РеквизитФильтрПоВидуДоговора = Новый РеквизитФормы(
        "ФильтрПоВидуДоговора",
        Новый ОписаниеТипов("ПеречислениеСсылка.ВидыДоговоровКонтрагентов"),
        ,
        "Вид списка по виду договора" );
   // Заполняем массив новых реквизитов
    ДобавляемыеРеквизиты.Добавить(РеквизитФильтрПоВидуДоговора);
    // Добавляем новые реквизиты в форму
    ИзменитьРеквизиты(ДобавляемыеРеквизиты);

   //Добавляем элементы на форму
     НовыйЭлемент = Элементы.Вставить(
        "ФильтрПоВидуДоговора",
        Тип("ПолеФормы"),,Элементы.Список);
    НовыйЭлемент.ПутьКДанным    = "ФильтрПоВидуДоговора";
    НовыйЭлемент.Вид            = ВидПоляФормы.ПолеВвода;
    НовыйЭлемент.УстановитьДействие("ПриИзменении","ФильтрПоВидуДоговораПриИзменении");
   
   //Создаем новую грруппу колонок
   НоваяГруппаКолонок = Элементы.вставить("ГруппаКолонокАбонДог", Тип("ГруппаФормы"), Элементы.Список,Элементы.Ссылка);
   НоваяГруппаКолонок.Вид                 = ВидГруппыФормы.ГруппаКолонок;
   НоваяГруппаКолонок.ОтображатьЗаголовок = Ложь;
   НоваяГруппаКолонок.Группировка         = ГруппировкаКолонок.Вертикальная;
   НоваяГруппаКолонок.Видимость = Ложь;
   
   
    // Добавляем элементы внутрь новой группы колонок
    НовыйЭлемент = Элементы.Добавить("ДатаНачала", Тип("ПолеФормы") , НоваяГруппаКолонок );
    НовыйЭлемент.ПутьКДанным = "Список.ДатаНачала";
    НовыйЭлемент.Вид = ВидПоляФормы.ПолеВвода;
    
    НовыйЭлемент = Элементы.Добавить("ДатаОкончания", Тип("ПолеФормы") ,НоваяГруппаКолонок );
    НовыйЭлемент.ПутьКДанным = "Список.ДатаОкончания";
    НовыйЭлемент.Вид = ВидПоляФормы.ПолеВвода;
    
    НовыйЭлемент = Элементы.Добавить("СуммаАбонПлаты", Тип("ПолеФормы") ,НоваяГруппаКолонок );
    НовыйЭлемент.ПутьКДанным = "Список.СуммаАбонПлаты";
    НовыйЭлемент.Вид = ВидПоляФормы.ПолеВвода;
    
    НовыйЭлемент = Элементы.Добавить("СтоимостьЧасаРаботы", Тип("ПолеФормы") ,НоваяГруппаКолонок );
    НовыйЭлемент.ПутьКДанным = "Список.СтоимостьЧасаРаботы";
    НовыйЭлемент.Вид = ВидПоляФормы.ПолеВвода;
    
 
КонецПроцедуры

&НаКлиенте
Процедура ФильтрПоВидуДоговораПриИзменении(Элемент)
 //Устанавливаем видимость полей списка по виду договора
 ЭтоАбонДоговор = ФильтрПоАбонентскомуДоговору(ФильтрПоВидуДоговора);
 Элементы.ГруппаКолонокАбонДог.Видимость = ЭтоАбонДоговор;
 
КонецПроцедуры

&НаСервереБезКонтекста
Функция ФильтрПоАбонентскомуДоговору(ВидДоговора)
	Возврат ВидДоговора = Перечисления.ВидыДоговоровКонтрагентов.ВКМ_АбонентскоеОбслуживание;
КонецФункции



//ВКМ_Конец: ********************************************************