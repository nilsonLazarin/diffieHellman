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
BobPrivKey = input('Escolha um numero secreto (chave privada): ');
BobPublicKey = B;
for i = 2:BobPrivKey
    BobPublicKey = mod((B*BobPublicKey),N);
end
disp(['------------> Sua chave pública (envie para o destinatario): ' num2str(BobPublicKey)]);

disp('------------------------------------------- ');
disp('Calculando a chave de comunicação:');
KeyComBob = input('... Qual a chave publica recebida? :');
for i = 2:input('... Informe seu número secreto:')
    KeyComBob = mod((B*KeyComBob),N);
end
disp(['-----------> Chave: ' num2str(KeyComBob)]);
