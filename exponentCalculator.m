function pO = exponentCalculator(X, YO, paint)
%a = figure ;

% % % % % %plot(X,YO , '-o', 'DisplayName', 'Variance')
% % % % % %legend('-DynamicLegend')
% % % % % %hold all
[pO, bint] = polyfit(log(X(end/4:end)), log(YO(end/4:end)),1);
err = sqrt(diag((bint.R)\inv(bint.R'))./bint.normr.^2./bint.df);
YFit = pO(1).*(log(X(end/2:end))) + pO(2); 
if paint
            a = openFigure('Real Hyperuniform'); 
            plot( X,YO , 'k-o', X(end/4:end),exp(pO(2)).*X(end/4:end).^pO(1) , 'r', 'LineWidth',4,  'MarkerSize', 8);
            a.Children.FontSize = 24;
            a.Children.XScale = 'log';
            a.Children.YScale = 'log';
            a.Children.LineWidth = 2;
            xlabel('Normalized Radius');
            ylabel('Variance');
            b =legend('Variance', ['Fit, \alpha = ' num2str(pO(1))], 'Location', 'northwest');
            b.FontSize = 30;
            b.FontName = 'Arial';   
            
%             text((X(1)), exp(pO(2)).*X(end-3).^pO(1), [ 'Exponent: ' num2str(pO(1))])
%             text((X(1)), exp(pO(2)).*X(end-5).^pO(1),['Cut:           ' num2str(exp(pO(2)))])
%             text((X(1)), exp(pO(2)).*X(end-6).^pO(1), [ 'Error: ' num2str(err(1))])
%             box on
            axis square
end
pO = [pO(1), exp(pO(2)), err(1)];
