clear;clc;
%%
freq = 2e9:25e6:3.7e9;

raw_data = [2.25e9,-10,2.3e9,-15,2.1e9,-15; ...
            2.5e9,-10,2.6e9,-15,2.4e9,-15; ...
            2.7e9,-10,2.8e9,-15,2.6e9,-15
            ];
sweep_num = 1:size(raw_data,1);

stack = [];
for j = sweep_num
    sweep = zeros(1,size(freq,2));
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
colormap(turbo)
imagesc(freq,sweep_num,stack)
view(0,-90)
xlabel("Frequency")
ylabel("Sweep Number")


disp("Im done")