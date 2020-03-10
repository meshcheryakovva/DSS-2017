function II3_res = fis_II3(inVector, inCodes)
  // аргументы: входной вектор числовых значений и массив строк-имен переменных
    
  f_II3=newfls("m"); // тип Мамдани
  f_II3.name="fisII3";
  f_II3.TNorm="min"; // and
  f_II3.SNorm="max"; // or
  f_II3.Comp="one";  // not
  f_II3.defuzzMethod="centroide"; // центр тяжести
  f_II3.ImpMethod = 'min'
  f_II3.AggMethod = 'max'

  // переменные и функции принадлежности
  for i=1:4
    f_II3 = addvar(f_II3, "input", inCodes(i+18), [-1 1]);
    f_II3 = addmf(f_II3,"input",i,"low","trimf",[-1.1 -1.0 0.0]);  
    f_II3 = addmf(f_II3,"input",i,"mid","trimf", [-1.0 0.0 1.0]);  
    f_II3 = addmf(f_II3,"input",i,"high","trimf", [0.0 1.0 1.1]);  
  end

  f_II3 = addvar(f_II3, "output", "II3", [-1 1]);
  f_II3 = addmf(f_II3,"output", 1, "low","trimf",[-1.1 -1.0 0.0]);  
  f_II3 = addmf(f_II3,"output", 1, "mid","trimf", [-1.0 0.0 1.0]);  
  f_II3 = addmf(f_II3,"output", 1, "high","trimf", [0.0 1.0 1.1]);  

  // матрица правил из FisPro
  rulesFISProII3 = [ 3 , 3 , 3 , 3 ,   3;
    3 , 3 , 2 , 3 ,   3;
    2 , 3 , 3 , 2 ,   2;
    2 , 2 , 2 , 2 ,   2;
    2 , 2 , 1 , 2 ,   2;
    2 , 2 , 1 , 1 ,   2;
    2 , 1 , 1 , 1 ,   1;
    1 , 1 , 1 , 1 ,   1];
  
  // добавить столбцы для конъюнкции и весов правил
  len = size(rulesFISProII3,1);
  rulesII3 = cat(2, rulesFISProII3, ones(len,2));
  
  f_II3 = addrule(f_II3, rulesII3); // база правил
  
  
  editfls(f_II3)
  II3_res = evalfls(inVector(19:22), f_II3); // вывод
  
endfunction
