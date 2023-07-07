clear;clc;
%%
freq = 2e9:25e6:3.7e9;
threshold = -20;
raw_data = [2.25e9,-10,2.3e9,-15,2.1e9,-15; ...
            2.5e9,-10,2.6e9,-15,2.4e9,-15; ...
            2.7e9,-10,2.8e9,-15,2.6e9,-15
            ];
sweep_num = 1:size(raw_data,1);
minVal = min(raw_data,[],'all');
stack = [];
for j = sweep_num
    sweep = ones(1,size(freq,2)).*threshold;
    organized = reshape(raw_data(j,:),[2,size(raw_data(j,:),2)/2]).';
    for i = 1:size(freq,2)
        found = find(freq(1,i)==organized(:,1));
    %     disp(['i = ' num2str(i) '  Found = ' num2str(found)])
        if(found)
            sweep(1,i) = organized(found,2);
        end
    end
    stack = [stack;sweep];
end

colormap parula
surf(freq,sweep_num,stack)
% view(0,-90)
view(0,90)
xlabel("Frequency")
ylabel("Sweep Number")
colorbar();

disp("Im done")