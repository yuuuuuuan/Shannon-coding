% 输入符号概率
p = [0.2 0.19 0.18 0.17 0.15 0.10 0.01];

% 计算信源熵
H = -sum(p .* log2(p));

% 计算每个符号的香农编码长度
codeLen = ceil(-log2(p));

% 计算累计概率
cumP = cumsum(p);

% 根据累计概率为每个符号分配编码
code = cell(size(p));
for i = 1:length(p)
    code{i} = dec2bin(round(cumP(i) * 2^codeLen(i)), codeLen(i));
end

% 计算平均编码长度和编码效率
avgLen = sum(p .* codeLen); % 平均编码长度
efficiency = H / avgLen; % 编码效率

% 输出结果
disp('符号  概率  香农编码  编码长度');
for i = 1:length(p)
    fprintf('%d      %.2f     %s        %d\n', i, p(i), code{i}, codeLen(i));
end
fprintf('平均编码长度：%.2f\n', avgLen);
fprintf('编码效率：%.2f\n', efficiency);