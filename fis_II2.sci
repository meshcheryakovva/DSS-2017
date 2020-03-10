function II2_res = fis_II2(inVector, inCodes)
  // аргументы: входной вектор числовых значений и массив строк-имен переменных
    
  f_II2=newfls("m"); // тип Мамдани
  f_II2.name="fisII2";
  f_II2.TNorm="min"; // and
  f_II2.SNorm="max"; // or
  f_II2.Comp="one";  // not
  f_II2.defuzzMethod="centroide"; // центр тяжести
  f_II2.ImpMethod = 'min'
  f_II2.AggMethod = 'max'

  // переменные и функции принадлежности
  for i=1:6
    f_II2 = addvar(f_II2, "input", inCodes(i+12), [-1 1]);
    f_II2 = addmf(f_II2,"input",i,"low","trimf",[-1.1 -1.0 0.0]);  
    f_II2 = addmf(f_II2,"input",i,"mid","trimf", [-1.0 0.0 1.0]);  
    f_II2 = addmf(f_II2,"input",i,"high","trimf", [0.0 1.0 1.1]);  
  end

  f_II2 = addvar(f_II2, "output", "II2", [-1 1]);
  f_II2 = addmf(f_II2,"output", 1, "low","trimf",[-1.1 -1.0 0.0]);  
  f_II2 = addmf(f_II2,"output", 1, "mid","trimf", [-1.0 0.0 1.0]);  
  f_II2 = addmf(f_II2,"output", 1, "high","trimf", [0.0 1.0 1.1]);  

  // матрица правил из FisPro
  rulesFISProII2 = [ 3 , 3 , 3 , 3 , 0 , 0 ,   3;
    3 , 2 , 3 , 2 , 0 , 0 ,   3;
    2 , 2 , 2 , 2 , 0 , 0 ,   2;
    2 , 1 , 2 , 1 , 0 , 0 ,   2;
    1 , 1 , 1 , 1 , 0 , 0 ,   1;
    3 , 0 , 0 , 3 , 0 , 3 ,   3;
    3 , 0 , 0 , 2 , 0 , 2 ,   2;
    2 , 0 , 0 , 1 , 0 , 1 ,   1;
    1 , 0 , 0 , 1 , 0 , 1 ,   1];
  
  // добавить столбцы для конъюнкции и весов правил
  len = size(rulesFISProII2,1);
  rulesII2 = cat(2, rulesFISProII2, ones(len,2));
  
  f_II2 = addrule(f_II2, rulesII2); // база правил
  
  
  editfls(f_II2)
  II2_res = evalfls(inVector(13:18), f_II2); // вывод
  
endfunction
