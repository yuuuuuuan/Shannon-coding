% ������Ÿ���
p = [0.2 0.19 0.18 0.17 0.15 0.10 0.01];

% ������Դ��
H = -sum(p .* log2(p));

% ����ÿ�����ŵ���ũ���볤��
codeLen = ceil(-log2(p));

% �����ۼƸ���
cumP = cumsum(p);

% �����ۼƸ���Ϊÿ�����ŷ������
code = cell(size(p));
for i = 1:length(p)
    code{i} = dec2bin(round(cumP(i) * 2^codeLen(i)), codeLen(i));
end

% ����ƽ�����볤�Ⱥͱ���Ч��
avgLen = sum(p .* codeLen); % ƽ�����볤��
efficiency = H / avgLen; % ����Ч��

% ������
disp('����  ����  ��ũ����  ���볤��');
for i = 1:length(p)
    fprintf('%d      %.2f     %s        %d\n', i, p(i), code{i}, codeLen(i));
end
fprintf('ƽ�����볤�ȣ�%.2f\n', avgLen);
fprintf('����Ч�ʣ�%.2f\n', efficiency);