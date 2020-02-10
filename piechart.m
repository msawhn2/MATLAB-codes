function piechart()
[Num, Txt, Raw] = xlsread('data2.xls');
Themes = Txt(:,4);
[d, theme_names] = findgroups(Themes);

for i = 1:max(d)                                                    %Dont let the number of lines fool you.
    Totals(i) = sum(d==i);                                          %My code for this began at 120 lines and
end                                                                 %after hours of torture with strings, I managed
                                                                    %to compact this bitch down to something                                                                
pie(Totals);                                                        %this simple looking
legend(theme_names{1:end}, 'location','EastOutside');
title('Most Popular Gaming Genres');

end