function III1_res = fis_III1(inVector, inCodes)
  // аргументы: входной вектор числовых значений и массив строк-имен переменных
    
  f_III1=newfls("m"); // тип Мамдани
  f_III1.name="fisIII1";
  f_III1.TNorm="min"; // and
  f_III1.SNorm="max"; // or
  f_III1.Comp="one";  // not
  f_III1.defuzzMethod="centroide"; // центр тяжести
  f_III1.ImpMethod = 'min'
  f_III1.AggMethod = 'max'

  // переменные и функции принадлежности
  for i=1:5
    f_III1 = addvar(f_III1, "input", inCodes(i), [-1 1]);
    f_III1 = addmf(f_III1,"input",i,"low","trimf",[-1.1 -1.0 0.0]);  
    f_III1 = addmf(f_III1,"input",i,"mid","trimf", [-1.0 0.0 1.0]);  
    f_III1 = addmf(f_III1,"input",i,"high","trimf", [0.0 1.0 1.1]);  
  end

  f_III1 = addvar(f_III1, "output", "III1", [-1 1]);
  f_III1 = addmf(f_III1,"output", 1, "low","trimf",[-1.1 -1.0 0.0]);  
  f_III1 = addmf(f_III1,"output", 1, "mid","trimf", [-1.0 0.0 1.0]);  
  f_III1 = addmf(f_III1,"output", 1, "high","trimf", [0.0 1.0 1.1]);  

  // матрица правил из FisPro
  rulesFISProIII1 = [ 3 , 0 , 0 , 3 , 3 ,   3;
    3 , 0 , 0 , 3 , 2 ,   3;
    3 , 0 , 0 , 3 , 1 ,   3;
    2 , 0 , 0 , 2 , 2 ,   2;
    2 , 0 , 0 , 1 , 2 ,   2;
    2 , 0 , 0 , 1 , 3 ,   1;
    1 , 0 , 0 , 1 , 3 ,   1];
  
  // добавить столбцы для конъюнкции и весов правил
  len = size(rulesFISProIII1,1);
  rulesIII1 = cat(2, rulesFISProIII1, ones(len,2));
  
  f_III1 = addrule(f_III1, rulesIII1); // база правил
  
  
  editfls(f_III1)
  III1_res = evalfls(inVector(1:5), f_III1); // вывод
  
endfunction
