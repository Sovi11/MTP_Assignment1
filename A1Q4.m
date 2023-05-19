format long % To give more digits to decimal
% The code immediately below is only to enhance interface : 
fprintf("This code finds the root of a certain function using 3 methods\n") ;
prompt= "Specify a value for the error :\n" ;
eps1 = (input(prompt,"s"));
eps = str2double(eps1) ;
fprintf("1st Running the bisection method :\n")
prompt= "Do you want to see all the iterations of bisection method Y/N :\n" ;
bb1= input(prompt,"s") ;
b2 = bisection(-10,15,0,bb1,eps) ;
fprintf("The answer to the given problem using Bisection is %.12f and it terminates in %.0f iterations\n",b2(1),b2(2)) ;
fprintf("2nd Running the Hybrid method :\n")
prompt= "Do you want to see all the iterations of Hybrid method method Y/N :\n" ;
bb2= input(prompt,"s") ;
b1 =hybrid(-10,15,0.1,bb2,eps) ;
fprintf("The answer to the given problem using Hybrid is %.12f and it terminates in %.0f iterations\n",b1(1),b1(2)) ;
fprintf("3rd Running the Newton method :\n")
prompt= "Do you want to see all the iterations of Newton method Y/N :\n" ;
bb3= input(prompt,"s") ;
b3 = newton(1,0,bb3,eps) ;
fprintf("The answer to the given problem using Newton method is %.12f and it terminates in %.0f iterations\n",b3(1),b3(2)) ;
fprintf("Summary :\n The bisection method runs in %.0f iterations\n The Hybrid method runs in %.0f iterations\n The Newton's method runs in %.0f iterations\n", b2(2),b1(2),b3(2)) ;
% The functions below are used for calculating roots using different
% methods
%eps is the error input by user

% The function below is for simple newton method
function a7=newton(x,iterations,bb1,eps)
        % bb1 is the flag which tells wheter to print all the intermediate
        % iterations
        m=x-f(x)/g(x) ;
while(abs((m-x)) > eps) % Termination condition
        x=m;
        iterations=iterations+1;
        m = m  - f(m)/g(m) ;% Updation condition for newton method
        if (bb1=="Y")
            fprintf("The ans after %d iteration is %.12f\n",iterations,x) ;
        end
end
    a7= [m , iterations+1];
end

% The function below is for simple bisection method
function a6= bisection(a,b,iterations,bb1,eps)
    % bb1 is the flag which tells wheter to print all the intermediate
    % iterations
    x= (a+b)/2 ;
    ans1= 1000000000 ;
    while(abs((x-ans1)) > eps) % Termination condition for bisection method (absolute method)
        iterations=iterations+1 ;
        ans1 = x ;
        if f(x)>0 
            b=x; 
        else 
            a =x ;
        end
        x=(a+b)/2 ;
        if (bb1=="Y")
            fprintf("The ans after %d iteration is %.12f\n",iterations,x) ;
        end   
    end
    a6=[(a+b)/2 , iterations];
end

% The function below is the final hybrid method
function a5= hybrid(a,b,s,bb2,eps)
    % bb2 is the flag which tells wheter to print all the intermediate
    % iterations
    var1 = bisection_hybrid(a,b,b-a,s,0,bb2) ;
    var2 = bisection_hybrid(a,b,b-a,s,0,bb2);
    a5=newton_hybrid(var1(1),var2(2),bb2,eps) ; 
end

% Function below is intermediate newton method for hybrid method
function a4 = newton_hybrid(x,iterations,bb2,eps)
    m=x-f(x)/g(x) ; 
while(abs((m-x)) > eps) % Termination condition
        x=m;
        iterations=iterations+1;
        m = m  - f(m)/g(m) ; % 
        if (bb2=="Y")
            fprintf("The ans after %d iteration is %.12f\n",iterations,x) ;
        end 
end
    a4= [m , iterations+1];

    
end

% Function below is intermediate bisection method for hybrid method
function a3=bisection_hybrid(a,b,d,s,iterations,bb3)
    while((b-a)>= s*d) 
        iterations=iterations+1 ;
        x= (a+b)/2 ;
        if f(x)>0 
            b=x; 
        else 
            a =x;
        end
        if (bb3=="Y")
            fprintf("The ans after %d iteration is %.12f\n",iterations,x) ;
        end 
    end
    a3=[(a+b)/2 , iterations];
end

function a1 = f(x)
% tanh(x) is also written as the following
    a1= (exp(x) - exp(-x) )/ (exp(x) + exp(-x)); 

end
function a2=g(x)
% derivative of f(x) is g(x)
    a2=1 - (f(x))^2;
end
