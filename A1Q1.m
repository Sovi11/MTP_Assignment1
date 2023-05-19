format long % Formatting the values to work in decimals with more precision
c=falsem(-2.5,-1,0.001,0) ; % This calls the function false method / regula falsi with the specified values.
fprintf("The root to the specified function is finally : %.10f\n", c(1)) ;
fprintf("The number of iterations required for the answer are : %.0f\n",c(2))
function m2= falsem(a,b,eps,iterations)
    m2= (a*func(b)-b*func(a))/(func(b)-func(a)); % Setting the initial value of m2
    m1=a; % Setting the initial previous value as left boundary
    while(abs((m2-m1)/m2) > eps)
        iterations = iterations + 1 ; 
        % Updating the boundaries after checking conditions.
        if (func(m2)*func(a) < 0)
            % shifting the right boundary 
            b = m2 ;
        else
            % shifting the left boundary 
            a = m2 ;
        end   
        
        xlabel("Iterations")
        plot(iterations,m1,"-s") % Plotting the point vs iteration
        ylabel("Updated value after iteration")
        hold on 
        fprintf("The value after %d iteration is %.10f\n", iterations,m2) ;
        %fprintf("The number of iterations required for the answer are : %.0f\n",c(2))
        m1=m2;
        m2= (a*func(b)-b*func(a))/(func(b)-func(a));
       
    
    end
    plot(iterations+1,m2,"-s")
    m2= [m2,iterations+1] ;
    
    title("A plot showing the values of x and their convergence") ;
end

function f = func(x)
f = x^3 - 6*x^2 + 32 ; 
end 
