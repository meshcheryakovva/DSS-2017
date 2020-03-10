function I3_res = fis_I3(inVector, inCodes)
  // аргументы: входной вектор числовых значений и массив строк-имен переменных
    
  f_I3=newfls("m"); // тип Мамдани
  f_I3.name="fisI3";
  f_I3.TNorm="min"; // and
  f_I3.SNorm="max"; // or
  f_I3.Comp="one";  // not
  f_I3.defuzzMethod="centroide"; // центр тяжести
  f_I3.ImpMethod = 'min'
  f_I3.AggMethod = 'max'
  
  // переменные
  f_I3=addvar(f_I3, "input", inCodes(10), [-1 1]);
  f_I3=addvar(f_I3, "input", inCodes(11), [-1 1]);
  
  f_I3=addvar(f_I3, "output", "I3", [-1 1]);


  // функции принадлежности
  for i=1:2
    f_I3 = addmf(f_I3,"input",i,"low","trimf",[-1.1 -1.0 0.0]);  
    f_I3 = addmf(f_I3,"input",i,"mid","trimf", [-1.0 0.0 1.0]);  
    f_I3 = addmf(f_I3,"input",i,"high","trimf", [0.0 1.0 1.1]);  
  end

  f_I3 = addmf(f_I3,"output", 1, "low","trimf",[-1.1 -1.0 0.0]);  
  f_I3 = addmf(f_I3,"output", 1, "mid","trimf", [-1.0 0.0 1.0]);  
  f_I3 = addmf(f_I3,"output", 1, "high","trimf", [0.0 1.0 1.1]);  

  // матрица правил из FisPro
  rulesFISProI3 = [3 , 3 ,  3;
    3 , 2 ,  3;
    2 , 3 ,  3;
    3 , 1 ,  2;
    1 , 3 ,  1;
    2 , 2 ,  2;
    2 , 1 ,  2;
    1 , 2 ,  1;
    1 , 1 ,  1];
  
  // добавить столбцы для конъюнкции и весов правил
  len = size(rulesFISProI3,1);
  rulesI3 = cat(2, rulesFISProI3, ones(len,2));
  
  f_I3 = addrule(f_I3, rulesI3); // база правил
  
  
  editfls(f_I3)
  I3_res = evalfls(inVector(8:9), f_I3); // вывод
  
endfunction
