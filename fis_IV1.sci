function IV1_res = fis_IV1(inVector, inCodes)
  // аргументы: входной вектор числовых значений и массив строк-имен переменных
    
  f_IV1=newfls("m"); // тип Мамдани
  f_IV1.name="fisIV1";
  f_IV1.TNorm="min"; // and
  f_IV1.SNorm="max"; // or
  f_IV1.Comp="one";  // not
  f_IV1.defuzzMethod="centroide"; // центр тяжести
  f_IV1.ImpMethod = 'min'
  f_IV1.AggMethod = 'max'

  // переменные и функции принадлежности
  for i=1:3
    f_IV1 = addvar(f_IV1, "input", inCodes(i+9), [-1 1]);
    f_IV1 = addmf(f_IV1,"input",i,"low","trimf",[-1.1 -1.0 0.0]);  
    f_IV1 = addmf(f_IV1,"input",i,"mid","trimf", [-1.0 0.0 1.0]);  
    f_IV1 = addmf(f_IV1,"input",i,"high","trimf", [0.0 1.0 1.1]);  
  end

  f_IV1 = addvar(f_IV1, "output", "IV1", [-1 1]);
  f_IV1 = addmf(f_IV1,"output", 1, "low","trimf",[-1.1 -1.0 0.0]);  
  f_IV1 = addmf(f_IV1,"output", 1, "mid","trimf", [-1.0 0.0 1.0]);  
  f_IV1 = addmf(f_IV1,"output", 1, "high","trimf", [0.0 1.0 1.1]);  

  // матрица правил из FisPro
  rulesFISProIV1 = [ 3 , 3 , 3 ,   3;
3 , 3 , 2 ,   3;
3 , 2 , 3 ,   3;
3 , 2 , 2 ,   2;
2 , 3 , 2 ,   2;
2 , 2 , 3 ,   2;
2 , 2 , 2 ,   2;
1 , 2 , 2 ,   1;
2 , 1 , 2 ,   1;
2 , 2 , 1 ,   2;
2 , 1 , 1 ,   1;
1 , 2 , 1 ,   1;
1 , 1 , 2 ,   1;
1 , 1 , 1 ,   1];
  
  // добавить столбцы для конъюнкции и весов правил
  len = size(rulesFISProIV1,1);
  rulesIV1 = cat(2, rulesFISProIV1, ones(len,2));
  
  f_IV1 = addrule(f_IV1, rulesIV1); // база правил
  
  
  editfls(f_IV1)
  IV1_res = evalfls(inVector(10:12), f_IV1); // вывод
  
endfunction
