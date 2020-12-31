function [A1,B1,C1]=max_out(A,B)
[r,s,t]=size(A);
p=1;
if r<13
    for k=1:t
        BB=B(k,:);
        for l=1:r
            AA=[];
            AA(1:r,1:s)=A(:,:,k);
            AA(r+1,BB(l))=1;
            AA(r+1,BB(l+1))=1;
            AA(BB(l),r+1)=1;
            AA(BB(l+1),r+1)=1;
            if p==1
                A1(:,:,p)=AA;
                B1(p,1:l)=BB(1:l);
                B1(p,l+1)=r+1;
                B1(p,l+2:r+2)=BB(l+1:r+1);
                p=p+1;
            else
                m1=0;
                for m=1:p-1
                    if graphisomorphism(sparse(A1(:,:,m)),sparse(AA))==1
                        m1=m1+1;
                        break;
                    end
                end
                if m1==0
                    A1(:,:,p)=AA;
                    B1(p,1:l)=BB(1:l);
                    B1(p,l+1)=r+1;
                    B1(p,l+2:r+2)=BB(l+1:r+1);
                    p=p+1;
                end
            end
        end
    end
else
    for k=1:t
        BB=B(k,:);
        for l=1:r
            A1(1:r,1:s,p)=A(:,:,k);
            A1(r+1,BB(l),p)=1;
            A1(r+1,BB(l+1),p)=1;
            A1(BB(l),r+1,p)=1;
            A1(BB(l+1),r+1,p)=1;
            B1(p,1:l)=BB(1:l);
            B1(p,l+1)=r+1;
            B1(p,l+2:r+2)=BB(l+1:r+1); 
            p=p+1;
        end
    end
end
%The spectral radius of the graph P_1+P_{n-1} for n=6,7,...,16
F=[3.22274330595442,3.46356590901646,3.67579030822086,3.86841246572300,4.04649331624631,4.21317338493712,4.37056106697175,4.52015938640701,4.66308942467802,4.80021684241257,4.93222846150174];
[r1,s1,t1]=size(A1);
p=1;
for i=1:t1
    D=max(eig(A1(:,:,i)));
    if (abs(D-F(r1-5))<1e-10)||(D>=F(r1-5))
        if p==1
            C1(:,:,p)=A1(:,:,i);
            p=p+1;
        else
            m1=0;
            for m=1:p-1
                if graphisomorphism(sparse(C1(:,:,m)),sparse(A1(:,:,i)))==1
                    m1=m1+1;
                    break;
                end
            end
            if m1==0
                C1(:,:,p)=A1(:,:,i);
                p=p+1;
            end
        end
    end
end
end