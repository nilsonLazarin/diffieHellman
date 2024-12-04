while true
disp('Diffie Hellman Key Exchange');
disp('-----------------------------------------');
disp('Defina os parâmetros globais da comunicação ');
disp('------------------------------------------- ');
clear;
%'Key = (p^private1 mod N)^private2 mod N'

% Definindo os parâmetros globais da comunicação 


B = input('Informe um Nr primo pequeno (B): ');
N = input('Informe um Nr primo grande  (N): ');
if(isprime(B) == isprime(N)==1)
    break;
end
end
disp('------------------------------------------- ');
disp('Gerando chaves assimétrica');
BobPrivKey = input('Escolha um numero secreto (chave privada) para BOB: ');
BobPublicKey = B;
for i = 2:BobPrivKey
    BobPublicKey = mod((B*BobPublicKey),N);
end
disp(['------------> Chave pública de BOB (envie para Eva): ' num2str(BobPublicKey)]);

EvaPrivKey = input('Escolha um numero secreto (chave privada) para EVA: ');
EvaPublicKey = B;
for i = 2:EvaPrivKey
    EvaPublicKey = mod((B*EvaPublicKey),N);
end
disp(['------------> Chave pública de EVA (envie para Bob): ' num2str(EvaPublicKey)]);

disp('------------------------------------------- ');
disp('Bob calculando a chave de comunicação:');
KeyComBob = input('... Qual a chave que EVA enviou? :');
for i = 2:input('... Informe seu número secreto:')
    KeyComBob = mod((B*KeyComBob),N);
end
disp(['-----------> Chave: ' num2str(KeyComBob)]);

disp('------------------------------------------- ');
pause;
disp('Eva calculando a chave de comunicação');
KeyComEva = input('... Qual a chave que Bob enviou? :');
for i = 2:input('Informe seu número secreto:')
    KeyComEva = mod((B*KeyComEva),N);
end
disp(['-----------> Chave: ' num2str(KeyComEva)]);
