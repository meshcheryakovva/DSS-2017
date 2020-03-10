function I1_res = fis_I1(inVector, inCodes)
  // аргументы: входной вектор числовых значений и массив строк-имен переменных
    
  f_I1=newfls("m"); // тип Мамдани
  f_I1.name="fisI1";
  f_I1.TNorm="min"; // and
  f_I1.SNorm="max"; // or
  f_I1.Comp="one";  // not
  f_I1.defuzzMethod="centroide"; // центр тяжести
  f_I1.ImpMethod = 'min'
  f_I1.AggMethod = 'max'
  
  // переменные
  f_I1=addvar(f_I1, "input", inCodes(1), [-1 1]);
  f_I1=addvar(f_I1, "input", inCodes(2), [-1 1]);
  f_I1=addvar(f_I1, "input", inCodes(3), [-1 1]);
  f_I1=addvar(f_I1, "input", inCodes(4), [-1 1]);
  f_I1=addvar(f_I1, "input", inCodes(5), [-1 1]);
  f_I1=addvar(f_I1, "input", inCodes(6), [-1 1]);
  f_I1=addvar(f_I1, "input", inCodes(7), [-1 1]);
  f_I1=addvar(f_I1, "output", "I1", [-1 1]);


  // функции принадлежности
  for i=1:7
    f_I1 = addmf(f_I1,"input",i,"low","trimf",[-1.1 -1.0 0.0]);  
    f_I1 = addmf(f_I1,"input",i,"mid","trimf", [-1.0 0.0 1.0]);  
    f_I1 = addmf(f_I1,"input",i,"high","trimf", [0.0 1.0 1.1]);  
  end

  f_I1 = addmf(f_I1,"output", 1, "low","trimf",[-1.1 -1.0 0.0]);  
  f_I1 = addmf(f_I1,"output", 1, "mid","trimf", [-1.0 0.0 1.0]);  
  f_I1 = addmf(f_I1,"output", 1, "high","trimf", [0.0 1.0 1.1]);  

  // матрица правил из FisPro
  rulesFISProI1 = [  3 , 3 , 0 , 0 , 3 , 0 , 0 ,   3;
  3 , 3 , 0 , 3 , 0 , 0 , 0 ,   3;
  3 , 0 , 0 , 0 , 3 , 3 , 0 ,   3;
  0 , 3 , 0 , 0 , 3 , 0 , 3 ,   3;
  2 , 2 , 0 , 0 , 2 , 0 , 0 ,   2;
  2 , 2 , 0 , 2 , 0 , 0 , 0 ,   2;
  2 , 0 , 0 , 0 , 2 , 2 , 0 ,   2;
  0 , 2 , 0 , 0 , 2 , 0 , 2 ,   2;
  3 , 2 , 0 , 0 , 3 , 0 , 0 ,   3;
  2 , 3 , 0 , 2 , 0 , 0 , 0 ,   2;
  2 , 0 , 0 , 0 , 3 , 2 , 0 ,   3;
  0 , 2 , 0 , 0 , 2 , 0 , 3 ,   2;
  1 , 1 , 0 , 0 , 1 , 0 , 0 ,   1;
  1 , 1 , 0 , 1 , 0 , 0 , 0 ,   1;
  1 , 0 , 0 , 0 , 1 , 1 , 0 ,   1;
  0 , 1 , 0 , 0 , 1 , 0 , 1 ,   1;
  2 , 1 , 0 , 0 , 1 , 0 , 0 ,   1;
  2 , 1 , 0 , 1 , 0 , 0 , 0 ,   1;
  2 , 0 , 0 , 0 , 1 , 1 , 0 ,   1;
  0 , 1 , 0 , 0 , 1 , 0 , 2 ,   1];
  
  // добавить столбцы для конъюнкции и весов правил
  len = size(rulesFISProI1,1);
  rulesI1 = cat(2, rulesFISProI1, ones(len,2));
  
  f_I1 = addrule(f_I1, rulesI1); // база правил
  
  
  editfls(f_I1)
  I1_res = evalfls(inVector(1:7), f_I1); // вывод
  
endfunction
