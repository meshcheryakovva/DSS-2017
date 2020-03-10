// Система поддержки принятия решений
// Прогнозированние перспектив развития кластера
// на основе систем нечеткого логического вывода.
// Реализация в SciLab 5.5.2
// Использованы модули: GUI Builder 3.0, Fuzzy Logic Toolbox (sciFLT 0.4.7)
// Мещеряков В.А., 2017
clc
clear all
funcprot(0)

global stage // флаги завершения этапов ввода данных и расчетов
global outVector // вектор выхода первого каскада


stage = zeros(5, 1); // 5 этапов
outVector = zeros(11 ,1) 

exec("wind1.sce");
while ~stage(1)
end

// если первый этап корректно завершен
exec("wind2.sce");
while ~stage(2)
end

// если второй этап корректно завершен
exec("wind2_23.sce");
while ~stage(3)
end

// если третий этап корректно завершен
exec("wind34.sce");
while ~stage(4)
end

exec("wind5.sce");



