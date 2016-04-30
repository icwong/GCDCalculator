#include <stdio.h>

int gcd(int m, int n);

void main(){
	int m; 
	int n;
	printf("Enter 1st integer: ");
	scanf("%d", &m);
	printf("Enter 2nd integer: ");
	scanf("%d",&n);

	printf("The GCD is: %d\n", gcd(m,n));
}