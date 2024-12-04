B=0;
N=0;
clear;
while true
clc;                    %Clear command window
disp('Diffie Hellman Key Exchange');
disp('-----------------------------------------');
disp('Defina os parâmetros globais da comunicação ');
disp('------------------------------------------- ');
%'Key = (p^private1 mod N)^private2 mod N'

% Definindo os parâmetros globais da comunicação 

B = randi([1 1000000-1]);
disp(['Gerando um Nr primo pequeno (B): ' num2str(B)]);
if(isprime(B) ==1)
    break;
end
end

while true
clc;                    %Clear command window
disp('Diffie Hellman Key Exchange');
disp('-----------------------------------------');
disp('Defina os parâmetros globais da comunicação ');
disp('------------------------------------------- ');
%'Key = (p^private1 mod N)^private2 mod N'

% Definindo os parâmetros globais da comunicação 

disp(['Gerando um Nr primo pequeno (B): ' num2str(B)]);
N = randi([1 1000000000-1]);
disp(['Gerando um Nr primo grande  (N): ' num2str(N)]);
if(isprime(N)==1)
    break;
end
end


disp('------------------------------------------- ');
disp('Gerando chaves assimétrica');
BobPrivKey = randi([1 N-1]);
disp(['Escolha um numero secreto (chave privada) para BOB: ' num2str(BobPrivKey)]);
BobPublicKey = B;
for i = 2:BobPrivKey
    BobPublicKey = mod((B*BobPublicKey),N);
end
disp(['------------> Chave pública de BOB (envie para Eva): ' num2str(BobPublicKey)]);

EvaPrivKey = randi([1 N-1]);
disp(['Escolha um numero secreto (chave privada) para EVA: ' num2str(EvaPrivKey)]);
EvaPublicKey = B;
for i = 2:EvaPrivKey
    EvaPublicKey = mod((B*EvaPublicKey),N);
end
disp(['------------> Chave pública de EVA (envie para Bob): ' num2str(EvaPublicKey)]);

disp('------------------------------------------- ');
disp('Bob calculando a chave de comunicação:');
KeyComBob = EvaPublicKey;
for i = 2:BobPrivKey
    KeyComBob = mod((B*KeyComBob),N);
end
disp(['-----------> Chave: ' num2str(KeyComBob)]);

disp('------------------------------------------- ');

disp('Eva calculando a chave de comunicação');
KeyComEva = BobPublicKey;
for i = 2:EvaPrivKey;
    KeyComEva = mod((B*KeyComEva),N);
end
disp(['-----------> Chave: ' num2str(KeyComEva)]);
