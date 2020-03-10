function I2_res = fis_I2(inVector, inCodes)
  // аргументы: входной вектор числовых значений и массив строк-имен переменных
    
  f_I2=newfls("m"); // тип Мамдани
  f_I2.name="fisI2";
  f_I2.TNorm="min"; // and
  f_I2.SNorm="max"; // or
  f_I2.Comp="one";  // not
  f_I2.defuzzMethod="centroide"; // центр тяжести
  f_I2.ImpMethod = 'min'
  f_I2.AggMethod = 'max'
  
  // переменные
  f_I2=addvar(f_I2, "input", inCodes(8), [-1 1]);
  f_I2=addvar(f_I2, "input", inCodes(9), [-1 1]);
  
  f_I2=addvar(f_I2, "output", "I2", [-1 1]);


  // функции принадлежности
  for i=1:2
    f_I2 = addmf(f_I2,"input",i,"low","trimf",[-1.1 -1.0 0.0]);  
    f_I2 = addmf(f_I2,"input",i,"mid","trimf", [-1.0 0.0 1.0]);  
    f_I2 = addmf(f_I2,"input",i,"high","trimf", [0.0 1.0 1.1]);  
  end

  f_I2 = addmf(f_I2,"output", 1, "low","trimf",[-1.1 -1.0 0.0]);  
  f_I2 = addmf(f_I2,"output", 1, "mid","trimf", [-1.0 0.0 1.0]);  
  f_I2 = addmf(f_I2,"output", 1, "high","trimf", [0.0 1.0 1.1]);  

  // матрица правил из FisPro
  rulesFISProI2 = [3 , 3 ,  3;
    2 , 3 ,  3;
    3 , 2 ,  3;
    2 , 2 ,  2;
    3 , 1 ,  2;
    1 , 3 ,  2;
    2 , 1 ,  1;
    1 , 2 ,  1;
    1 , 2 ,  1;
    1 , 1 ,  1];
  
  // добавить столбцы для конъюнкции и весов правил
  len = size(rulesFISProI2,1);
  rulesI2 = cat(2, rulesFISProI2, ones(len,2));
  
  f_I2 = addrule(f_I2, rulesI2); // база правил
  
  
  editfls(f_I2)
  I2_res = evalfls(inVector(8:9), f_I2); // вывод
  
endfunction
