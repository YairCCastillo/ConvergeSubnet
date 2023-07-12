%MODELO REAL Y FINAL DE LA PRIMERA TÉCNICA Y CON LAG
figure
for Sim=1:10
    no=1000;  %Numero de la población
    co=3;   %Numero de conocidos hacía cada lado
    p=0.1;    %Probabilidad de cambiar la conexión de 2 nodos
    lg=10;  %No tomar en cuenta un estado anterior
    
    if lg>1
        lagg=1;
    else
        lagg=lg;
    end
    
    h=WattsStrogatz(no,co,p) %Programa para hacer la red que queremos
    
    ini=3;  % El nodo donde empezamos
    x=table2array(h.Edges(:,1)); %Convertir a tabla
    pos1=find(x(:,1)==ini);   %Buscar nodos que tienen conexión con el inicial
    pos2=find(x(:,2)==ini);   %Buscar nodos que tienen conexión con el inicial
    nuev=[transpose(x(pos2,1)),transpose(x(pos1,2))];  %Poner en un solo renglón
    imp=[];   %Creamos vectores vacios, aquí los importantes
    qui=[];   % Aquí los que quitamos
    cov=1-length(nuev)/(length(nuev)+1); %Este el coverage
    %figure
    %plot((length(nue)+1),cov,"bo")
    %hold on
    real=(length(nuev)+1)/no;
    %plot((length(nue)+1),real,"ro")
    x1=[cov];
    x2=[real];
    y=[length(nuev)+1];
    lag=[ini,unique(nuev)];
    lagpos=[1,length(unique(nuev))];
    [length(nuev)];
    for i=1:length(nuev)
        pos1=find(x(:,1)==nuev(i));
        pos2=find(x(:,2)==nuev(i));
        finpos=[transpose(x(pos2,1)),transpose(x(pos1,2))];
        if lagg>0
            for l=1:sum(lagpos(end-(lagg):end))
                finpos=finpos(finpos~=lag(end+1-l));
            end
        end
        imp=[imp,finpos];
        qui=[qui,nuev(i)*ones(1,length(finpos))];
        clear finpos
    end
    n=[ini,nuev,imp];
    posi=[];
    sing=[];
    for k=1:length(imp)
        if  sum(n==imp(k))==1
            sing=[sing,imp(k)];
            posi=[posi,qui(k)];
        end
    end
    
    m=[nuev];
    ev=[];
    
    for k=1:length(imp)
        if  sum(sing==imp(k))==0 && sum(imp==imp(k))~=1 && sum(m==imp(k))==0 && sum(ev==imp(k))==0 
            ev=[ev,imp(k)]; %Que no sea singleton, no importa que sea repetido, que no haya salido antes,para no tomar 2 veces
            posi=[posi,qui(k)];
        end
    end
    nue=[sing,ev];
    clear qui imp pos1 pos2 ev ev2 i k m
    %cov=1-length(sing)/length(unique(n)); 
    cov=1-length(sing)/length(n); 
    
    % plot(length(n),cov,"bo")
    % hold on
    real=length(unique(n))/no;
    x1=[cov,x1];
    x2=[real,x2];
    % y=[length(unique(n)),y];
    y=[length(n),y];
    lag=[lag,nue];
    lagpos=[lagpos,length(nue)];
    
    % plot(length(n),cov,"bo")
    % hold on
    % plot(length(n),real,"ro")
    % beb=0
    [length(sing),length(n)];
    while length(nue)~=0
        % beb=beb+1
        m=unique(n);
        qui2=[];
        imp2=[];
        if lagg<lg
            lagg=lagg+1;
        end
        for i=1:length(nue)
            pos1=find(x(:,1)==nue(i));
            pos2=find(x(:,2)==nue(i));
            finpos=[transpose(x(pos2,1)),transpose(x(pos1,2))];
            if lagg>0
                for l=1:sum(lagpos(end-(lagg):end))
                    finpos=finpos(finpos~=lag(end+1-l));
                end
            end
            imp2=[imp2,finpos];
            qui2=[qui2,nue(i)*ones(1,length(finpos))];
            clear finpos
        end
        
        n=[n,imp2];
        posi=[];
        sing=[];
        for k=1:length(imp2)
            if  sum(n==imp2(k))==1
                sing=[sing,imp2(k)];
                posi=[posi,qui2(k)];
            end
        end
        
        ev=[];
        
        for k=1:length(imp2)
            if  sum(sing==imp2(k))==0 && sum(imp2==imp2(k))~=1 && sum(m==imp2(k))==0 && sum(ev==imp2(k))==0
                ev=[ev,imp2(k)];
                posi=[posi,qui2(k)];
            end
        end
        nue=[sing,ev];
        lag=[lag,nue];
        lagpos=[lagpos,length(nue)];
        % cov=1-length(sing)/length(unique(n)); 
        cov=1-length(sing)/length(n); 
        [length(sing),length(unique(n))];
        real=length(unique(n))/no;
        x1=[cov,x1];
        x2=[real,x2];
        % y=[length(unique(n)),y];
        y=[length(n),y];
        clear qui2 imp2 k i finpos pos1 pos2 posi2 sing2
        hold on
        % plot(length(n),cov,'bo')
        %plot(length(n),real,"ro")
        
        % dif=(cov-real)^2
        % indi=length(n)
    end
    plot(x2,x1,"r-")
    hold on
    plot([0,1],[0,1],"k-")
    % plot(y,x2,"r-")
    xlabel('Real')
    ylabel('Estimada')

%    plot(y,x1,"b-")
%    hold on
%    plot(y,x2,"r-")
end
