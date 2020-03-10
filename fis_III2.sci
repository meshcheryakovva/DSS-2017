function III2_res = fis_III2(inVector, inCodes)
  // аргументы: входной вектор числовых значений и массив строк-имен переменных
    
  f_III2=newfls("m"); // тип Мамдани
  f_III2.name="fisIII2";
  f_III2.TNorm="min"; // and
  f_III2.SNorm="max"; // or
  f_III2.Comp="one";  // not
  f_III2.defuzzMethod="centroide"; // центр тяжести
  f_III2.ImpMethod = 'min'
  f_III2.AggMethod = 'max'

  // переменные и функции принадлежности
  for i=1:2
    f_III2 = addvar(f_III2, "input", inCodes(i+5), [-1 1]);
    f_III2 = addmf(f_III2,"input",i,"low","trimf",[-1.1 -1.0 0.0]);  
    f_III2 = addmf(f_III2,"input",i,"mid","trimf", [-1.0 0.0 1.0]);  
    f_III2 = addmf(f_III2,"input",i,"high","trimf", [0.0 1.0 1.1]);  
  end

  f_III2 = addvar(f_III2, "output", "III2", [-1 1]);
  f_III2 = addmf(f_III2,"output", 1, "low","trimf",[-1.1 -1.0 0.0]);  
  f_III2 = addmf(f_III2,"output", 1, "mid","trimf", [-1.0 0.0 1.0]);  
  f_III2 = addmf(f_III2,"output", 1, "high","trimf", [0.0 1.0 1.1]);  

  // матрица правил из FisPro
  rulesFISProIII2 = [ 3 , 1 ,   3;
    3 , 2 ,   3;
    2 , 3 ,   2;
    3 , 3 ,   2;
    2 , 2 ,   2;
    2 , 1 ,   2;
    1 , 2 ,   1;
    1 , 3 ,   1;
    1 , 1 ,   2];
  
  // добавить столбцы для конъюнкции и весов правил
  len = size(rulesFISProIII2,1);
  rulesIII2 = cat(2, rulesFISProIII2, ones(len,2));
  
  f_III2 = addrule(f_III2, rulesIII2); // база правил
  
  
  editfls(f_III2)
  III2_res = evalfls(inVector(6:7), f_III2); // вывод
  
endfunction
