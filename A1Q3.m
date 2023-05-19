% NOTE : CLOSE THE PREVIOUS GRAPHS BEFORE OPENING NEW 
%{  
Q3(a)
 Multiplicity of a root means that how many times a root is repeated in the
 factorization.
 f(x) = 27x^4 + 162x^3 - 180x^2 + 62x - 7 
 Multiplicity for root 1/3 to be 3 means that f(x) can be represented as g(x) * (x-1/3)^3 
 There are 2 ways to prove that the multiplicity of the polynomial f(x) is 3 for the root 1/3. 
 Either divide f(x) by (x-1/3)^3 and show that the remainder is 0 polynomial and when divided by (x-1/3)^4 , The remainder is non 0.
 Or take 3 derivatives and then show that the function is now not 0 at x= 1/3, even though at the second derivative it was 0
 Method 1 : 
f(x)= 27x^4 + 162x^3 - 180x^2 + 62x - 7          [ has x = 1/3 as one of the root ]
(f(x)/(x-1/3)) = 27x^3 + 171x^2 - 123x + 121     [ has x = 1/3 as one of the root ] 
((f(x)/ (x-1/3)^2) = 27x^2 + 180x -63            [ has x = 1/3 as one of the root ] 
((f(x)/ (x-1/3)^2) = 27x + 189                   [ does not have x = 1/3 as one of the root ]
(27x^4 + 162x^3 - 180x^2 + 62x - 7 ) / (x-1/3)^3 = 27(x+7) ; where x = 1/3
is not a root anymore.

Method 2 : 
f(x)= 27x^4 + 162x^3 - 180x^2 + 62x - 7     ; f(1/3) = 0 
f'(x) = 108x^3 + 486x^2 -360x +62          ; f'(1/3) = 0
f''(x) = 324x^2 + 972x -360               ; f''(1/3) = 0
f'''(x) = 648x + 972                    ; f'''(1/3) != 0

This proves that the multiplicity of the function f is 3 for root 1/3 ;

A plot is made which has functions plotted and all of them except the last
one pass through (1/3,0) ;
%}
prompt = "Do you want to run Q3(a) [only plot] or Q3(b) [plot with answer] or Q3(c) [plot with answer] enter a/b/c :\n" ;
k = input(prompt,"s") ;
if k=="a"
tiledlayout(1,3)
x =linspace(-3,3) ;
% for x in range -3 and 3 plot the following function
plot(x,27.*x.^4 + 162.*x.^3 - 180.*x.^2 + 62.*x - 7,"y") ; % plotting f(x)
hold on 
plot(x,27.*x.^3 + 171.*x.^2 - 123.*x + 21, "r") ; % plotting f(x)/(x - 1/3) 
plot(x,27.*x.^2 + 180.*x -63 , "g") ; % plotting f(x)/(x - 1/3)^2 
plot(x, 27.*x + 189 , "b"); % plotting f(x)/(x - 1/3)^3 
plot(1/3,0,"-s") ; % plotting (1/3 , 0)
legend({'f(x)', 'f(x)/(x-1/3)' ,'f(x)/(x-1/3)^2','f(x)/(x-1/3)^3', '(1/3,0)'}, 'Location','northeast') ;
hold off 
title("Plot of f(x) and when f(x) is succesively divided by (x-1/3)")
elseif k=="b"
prompt = "You have chosen part b, Do you want to see all iterations ? (Y/N) :\n" ;
bb = input(prompt,"s") ;
c1=newton_basic(0,0,bb) ; % newton method is called with suitable inputs 
fprintf("The answer to the given problem using standard method is %.12f and it terminates in %.0f iterations\n",c1(1),c1(2)) ;
elseif k=="c"
prompt = "You have chosen part c, Do you want to see all iterations ? (Y/N) :\n" ;
bb = input(prompt,"s") ;
c2=newton_modified(0,0,bb) ; % modified newton method is called with some inputs
fprintf("The answer to the given problem using standard method is %.12f and it terminates in %.0f iterations\n",c2(1),c2(2)) ;
else 
fprintf("Wrong input format\n") ;
end
% This is the function for normal newton method iteration
function a=newton_basic(x,iterations,bb)
    % bb is the flag which tells wheter to print all the intermediate
    % iterations
    x_new=x-f(x)/g(x); 
    ekarr1=[ek(x)]; % array for storing values to plot x axis values 
    ekp1=[(ek(x_new))]; % array for storing values to plot y axis values
    while(abs(x_new - x)>10^(-8))  % Termination condition
        iterations=iterations+1 ;
        x = x_new;
        x_new=x-f(x_new)/g(x_new); % Updation step for newton's method
        ekarr1(end+1)=(ek(x)); 
        ekp1(end+1)=(ek(x_new));
        if (bb=="Y")
        fprintf("The ans after %d iteration is %.12f\n",iterations,x) ;
        end
    end
    
    plot(ekarr1,ekp1,"-s");
    title("Part b plot")
    xlabel('e_k') 
    ylabel('e_{k+1}') 
        
    hold off
    a=[x_new,iterations];
end
function a2=newton_modified(x,iterations,bb)
    % bb is the flag which tells wheter to print all the intermediate
    % iterations
    x_new=x-3*f(x)/g(x); 
    ekarr=[ek(x)]; % array for storing values to plot x axis values
    ekp1sqr=[(ek(x_new))^2]; % array for storing values to plot y axis values

    while(abs(x_new-x)>10^(-8))
        iterations=iterations+1 ;
        x = x_new;
        x_new=x-3*f(x_new)/g(x_new); % Updation step for modified newton's method
        ekarr(end+1)=(ek(x))^2;
        ekp1sqr(end+1)=(ek(x_new));
        if (bb=="Y")
        fprintf("The ans after %d iteration is %.12f\n",iterations,x) ;
        end   
    end
    plot(ekarr,ekp1sqr,"-o");
    title("Part c plot")
    xlabel('e_k^2') 
    ylabel('e_{k+1}')
    a2=[x_new,iterations];
end
function a1 = ek(x)
% Function ek(x) which tells |x_inf - x|
a1= abs(1/3 - x) ;
end
function a2 = f(x)
% Function whose root has to be calculated
    a2= 27*(x^4) + 162*(x^3) - 180*(x^2) + 62*x - 7 ; 
end
function a3=g(x)
% Derivative of f(x)
    a3=108*(x^3) + 486*(x^2) - 360*x + 62 ;
end

% The values plotted for 3(b) are ek+1 w.r.t ek and
% The values plotted for 3(c) are ek+1 w.r.t (ek)^2
