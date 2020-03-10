function III3_res = fis_III3(inVector, inCodes)
  // аргументы: входной вектор числовых значений и массив строк-имен переменных
    
  f_III3=newfls("m"); // тип Мамдани
  f_III3.name="fisIII3";
  f_III3.TNorm="min"; // and
  f_III3.SNorm="max"; // or
  f_III3.Comp="one";  // not
  f_III3.defuzzMethod="centroide"; // центр тяжести
  f_III3.ImpMethod = 'min'
  f_III3.AggMethod = 'max'

  // переменные и функции принадлежности
  for i=1:2
    f_III3 = addvar(f_III3, "input", inCodes(i+7), [-1 1]);
    f_III3 = addmf(f_III3,"input",i,"low","trimf",[-1.1 -1.0 0.0]);  
    f_III3 = addmf(f_III3,"input",i,"mid","trimf", [-1.0 0.0 1.0]);  
    f_III3 = addmf(f_III3,"input",i,"high","trimf", [0.0 1.0 1.1]);  
  end

  f_III3 = addvar(f_III3, "output", "III3", [-1 1]);
  f_III3 = addmf(f_III3,"output", 1, "low","trimf",[-1.1 -1.0 0.0]);  
  f_III3 = addmf(f_III3,"output", 1, "mid","trimf", [-1.0 0.0 1.0]);  
  f_III3 = addmf(f_III3,"output", 1, "high","trimf", [0.0 1.0 1.1]);  

  // матрица правил из FisPro
  rulesFISProIII3 = [ 3 , 3 ,   3;
3 , 2 ,   3;
2 , 3 ,   3;
2 , 2 ,   2;
2 , 1 ,   2;
1 , 2 ,   1;
1 , 1 ,   1];
  
  // добавить столбцы для конъюнкции и весов правил
  len = size(rulesFISProIII3,1);
  rulesIII3 = cat(2, rulesFISProIII3, ones(len,2));
  
  f_III3 = addrule(f_III3, rulesIII3); // база правил
  
  
  editfls(f_III3)
  III3_res = evalfls(inVector(8:9), f_III3); // вывод
  
endfunction
