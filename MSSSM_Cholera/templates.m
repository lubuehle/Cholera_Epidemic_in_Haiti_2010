gammasolve=ones(10,16)*0.345;

gammasolve(:,[1:8])=gammasolve(:,[1:8])+gammasolve(:,[1:8]).*0.01;

gammasolve(:,[9:16])=gammasolve(:,[9:16])-gammasolve(:,[9:16]).*0.01;





epsilonsolve=ones(10,16)*0.014;

epsilonsolve(:,[1:4, 9:12])=epsilonsolve(:,[1:4, 9:12])+epsilonsolve(:,[1:4, 9:12]).*0.01;

epsilonsolve(:,[5:8,13:16])=epsilonsolve(:,[5:8,13:16])-epsilonsolve(:,[5:8,13:16]).*0.01;







betaxsolve=ones(10,16)*0.010;

betaxsolve(:,[1,2,5,6,9,10,13,14])=betaxsolve(:,[1,2,5,6,9,10,13,14])+betaxsolve(:,[1,2,5,6,9,10,13,14]).*0.01;

betaxsolve(:,[3,4,7,8,11,12,15,16])=betaxsolve(:,[3,4,7,8,11,12,15,16])-betaxsolve(:,[3,4,7,8,11,12,15,16]).*0.01;








betawsolve=ones(10,16)*0.944;

betawsolve(:,[1:2:15])=betawsolve(:,[1:2:15])+betawsolve(:,[1:2:15]).*0.01;

betawsolve(:,[2:2:16])=betawsolve(:,[2:2:16])-betawsolve(:,[2:2:16]).*0.01;



A=10:-1:1

[C,I] = min(A)




