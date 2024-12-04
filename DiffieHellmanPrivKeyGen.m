while true
    clc;                    %Clear command window
    disp('Diffie Hellman Key Exchange');
    disp('-----------------------------------------');
    disp('Informe os parâmetros globais da comunicação ');
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

while true
    disp('------------------------------------------- ');
    disp('Gerando uma Chave Privada Aleatória');
    privKey = randi([1 N-1]);
    disp(['Chave privada: ' num2str(privKey)]);

    disp(' ');
    disp('Calculando a Chave Pública equivalente');
    publicKey = B;
    for i = 2:privKey
        publicKey = mod((B*publicKey),N);
    end
    disp(['Chave pública: ' num2str(publicKey)]);

    op = input('Gostaria de gerar mais um par de chaves? Digite [0] para parar.');
    if(op==0)
       break;
    end
end