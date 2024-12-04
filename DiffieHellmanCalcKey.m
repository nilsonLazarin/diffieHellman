while true
clc;                    %Clear command window
disp('Diffie Hellman Key Exchange');
disp('-----------------------------------------');
disp('Defina os parâmetros globais da comunicação ');
disp('------------------------------------------- ');
clear;
%'Key = (p^private1 mod N)^private2 mod N'

% Definindo os parâmetros globais da comunicação 


B = input('Informe o Nr primo pequeno (B): ');
N = input('Informe o Nr primo grande  (N): ');
if(isprime(B) == isprime(N)==1)
    break;
end
end

% Chave de comunicação encontrada por BOB
privKey = input('Informe a sua chave Privada: ');
publicKey = input('Informe a chave Pública do Destinatário: ');
%keyBob = mod(publicEva^privBob,N);
key = publicKey;
for i = 2:privKey
    key = mod((B*key),N);
end
disp('------------------------------------------- ');
disp(['A chave da comunicação segura é: ' num2str(key)]);