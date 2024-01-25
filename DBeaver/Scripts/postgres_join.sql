--Specify columns to avoid duplicated columns in the result.
SELECT id,firstname,lastname,email,profession,public.citylist."CityName" FROM public.emplist
  JOIN public.citylist ON public.emplist."CityNo" = public.citylist."CityNo"
  LIMIT 10;

--Avoid duplicated columns in the result.
SELECT emplist.*, citylist."CityName" FROM emplist 
  LEFT JOIN citylist ON emplist."CityNo" = citylist."CityNo"
  LIMIT 10;

--Use table alias to simplify the SQL statement.
SELECT id,firstname,lastname,email,profession,c."CityName" FROM public.emplist as e
  RIGHT JOIN public.citylist as c ON e."CityNo" = c."CityNo"
  LIMIT 10;
