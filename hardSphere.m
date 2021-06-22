function hard = hardSphere(nPuntos,max,min, Radio, Paint)
hard = zeros(nPuntos,2);
j =0;
correct = 1;
Repeticiones = 0;
while 1
    
    candidate = (max-min)*rand(1,2) + min;
    if length(hard) > 1
        for i = 1:length(hard) -1
            distance = sqrt((hard(i,1)-candidate(1))^2 +(hard(i,2)-candidate(2))^2);
            %disp([i correct])
            if distance < 2*Radio
                correct = 0;
                
                Repeticiones = Repeticiones +1;
                break
            else
                correct = 1;
                
               
            end
            
        
        end
       
    end
 
    if correct
        j = j+1;
        hard(j,:) =  candidate;
        Repeticiones = 0;
       
    end
    if j == nPuntos
       
        break
        
    end
    if Repeticiones ==10000
        break
    end
    

end
hard = hard(1:j,:);
if Paint
    figure
    scatter(hard(:,1), hard(:,2),'SizeData', 10)
    for i = 1:length(hard)
        circle(hard(i,1), hard(i,2), Radio,'r')
        hold on
    end
    axis square
end
        