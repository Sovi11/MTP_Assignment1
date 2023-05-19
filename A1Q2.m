prompt = "Do you want to run Q2(a) or Q2(b) enter a/b :\n" ;


k = input(prompt,"s") ;
if k=="a"
prompt= "Please enter a suitable value for a to calculate 1/a :\n" ; % asks for the value of a 
a = input(prompt) ;
c=newton_raphson(10^-100,a,10^-16) ; % This calls the function with specified values of error and initial point 
fprintf("The answer for 1/a is :\n") ;
disp(c) ;
elseif k=="b"
x=newton_raphson2(1) ;
y=20-x;
disp("The 2 numbers satisfying the given conditions are :");
disp(x) ;
disp(y) ;
else 
    disp("Wrong input format") ;
end
% This is the start of functions for part a of Q2
function ans1 = newton_raphson(x,t,eps)
a = abs(t) ;
% If a is negative, then calculate value of 1/a for positive a and then add
% minus symbol
    ans1=x-(f1(x,a)/g1(x));  
    while(abs((ans1-x)/ans1)>eps) % running condition is relative error in consecutive iterations < tolerance 
        x=ans1;
        ans1= ans1-(f1(ans1,a)/g1(ans1));    % newton's method updation
    end
    ans1=x;
    if t<0
        ans1 = ans1 *(-1) ; 
    end 
end
function f = f1(x,a)
% we use the function a - 1/x so that f'(x) is 1/x^2 and therefore no issue
% of direct division by a 
    f = a-1/x ; 
end 
function g=g1(x)
% This is f'(x) function to be used in newton's method of iterations.
    g=1/(x^2);
end

% Functions for part b start here

function ans2=newton_raphson2(x)
    % This is the function to calculate the value of x, given certain function
    % whose root is x
    ans2=x-(f2(x)/g2(x)); 
    while(abs((ans2-x))>10^-8) % This is the termination condition specified by the question
        x=ans2; 
        ans2= ans2-(f2(ans2)/g2(ans2)); % Newton's updation condition
    end
    
end
function f = f2(x)
    % Assuming the 2 numbers are x and y 
    % From equation 1 we find out that y is related as 20-x, 
    % substituting y as 20-x in condition 2, we get the following equation
    % in one variable
    f = (x + sqrt(x))*(20-x + sqrt(20-x))- 155.55   ; 
    % f2(x) = 0 will give the value of x 
end 
function g=g2(x)
    % This is the derivative of f2(x) [calculated by hand] 
    g=20 - 2*x + sqrt(20-x) - x/(2*sqrt(20-x)) + 10/sqrt(x) - (3/2) *(sqrt(x)) + ((10-x)*x)/(sqrt(20*x - x*x));
end

