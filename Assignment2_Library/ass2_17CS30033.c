/*
Name: Shivam Kumar Jha
Roll Number: 17CS30033
 */


// prints a string of characters. The parameter is terminated by
// ’\0’. The return value is the number of characters printed.

int printStr(char *str) 
{
    int i=0;
    char temp[1000];
    for(;str[i] != '\0';i++)
        temp[i] = str[i];
    
    /* inline assembly line commands for system call to print "temp" to STDOUT*/
    __asm__ __volatile__ (
        "movl $(SYS_write), %%eax \n\t"
        "movq $(STDOUT_FILENO), %%rdi \n\t"
        "syscall \n\t"
        :
        :"S"(temp),"d"(i)
        );

    return i;
}


// reads a signed integer in ‘%d’ format. Caller gets the value
// through the pointer parameter. The return value is OK (for success) or ERR (on failure).

int readInt(int *n) 
{
	char temp[1];
	char ep[100];
	int val=0,i=0;
	
    while(1)
    {
        /*inline assembly command for system call to read 1 char into 'temp' from STDIN*/
        __asm__ __volatile__ ("syscall"::"a"(0), "D"(0), "S"(temp), "d"(1));
            
        if(temp[0] == '\n' || temp[0] == ' ') break;
        
        else if(( (temp[0]-'0' > 9) || (temp[0]-'0' < 0) ) && temp[0] != '-' ) 
            return ERR;
        
        else ep[i++]=temp[0]; 
	}
    
    if( i > 9 || !i)
        return ERR;
    
    if( ep[0] == '-' ) 
    {
        if( i == 1) 
            return ERR;

        for( int j=1 ; j<i ; j++) {
            if( ep[i] == '-') return ERR;
            val *= 10;
            val += ep[i]-'0';
        }
        val*=-1;
    }

    else
    {
        for( int j=0; j<i ; j++)
        {
            if(ep[i] == '-') return ERR;
            val *= 10;
            val += ep[i]-'0';
        }
    }
    *n = val;
	return OK;
}



// prints the signed integer (n) with left-alignment. Printing sign
// for a negative number is mandatory while for a positive number it is not required. On
// success, function will return the number of characters printed and on failure it will return
// ERR.

int printInt(int n)
{
	char temp[100];
	int i=0,fl=0;
    if(!n) temp[i++]='0';
    else
    {
        if(n < 0)
        {
            fl=1;
            n*=-1;
        }
        while(n)
        {
            temp[i++] = n%10 + '0';
            n/=10;
        }
        if(fl) temp[i++]='-';
        for(int j=0,k=i-1;j<k;j++,k--)
        {
            char swa = temp[j];
            temp[j] = temp[k];
            temp[k] = swa;
        }
    }

	/* inline assembly line commands for system call to print "temp" to STDOUT*/
	__asm__ __volatile__ (
        "movl $(SYS_write), %%eax \n\t"
        "movq $(STDOUT_FILENO), %%rdi \n\t"
        "syscall \n\t"
        :
        :"S"(temp),"d"(i)
        );

    return i;
}


// reads a floating point number in ‘%f’ format (for example, –123.456). 
// Caller gets the value through the pointer parameter. The return value is
// ERR or OK.

int readFlt(float *f) {
	char temp[1];
	char ep[100];
	int i=0,fl=0;
    float val = 0.0;
	
    while(1)
    {
        /*inline assembly command for system call to read 1 char into 'temp' from STDIN*/
        __asm__ __volatile__ ("syscall"::"a"(0), "D"(0), "S"(temp), "d"(1));
            
        if(temp[0] == '\n' || temp[0] == ' ') break;
        
        else if(( (temp[0]-'0' > 9) || (temp[0]-'0' < 0) ) && temp[0] != '-' && temp[0]!='.' ) 
            return ERR;
        
        else ep[i++]=temp[0]; 
	}
    
	if( i > 12 || !i)
        return ERR;

	if ( ep[0]=='-') 
    {
		if(i==1) 
            return ERR;

		if(ep[1] == '.') return ERR;

        float dec = 1;
		for (int j=1; j<i; j++) 
        {
			if(ep[i] == '-') return ERR;
			if(ep[i] == '.' && fl) return ERR;
			if(ep[i] == '.') 
            {
				fl=1;
				continue;
			}
			if(fl) {
				dec *= 10.0;
				val +=(ep[i]-'0')/dec;
			}
			else
            {
                val *= 10;
                val += ep[i]-'0';
	    	}
		}
		val*=-1;
	}

	else
    {
        if( ep[0]=='.' ) return ERR;
		
        float dec = 1;
		for (int j=1; j<i; j++) 
        {
			if(ep[i] == '-') return ERR;
			if(ep[i] == '.' && fl) return ERR;
			if(ep[i] == '.') 
            {
				fl=1;
				continue;
			}
			if(fl) {
				dec *= 10.0;
				val +=(ep[i]-'0')/dec;
			}
			else
            {
                val *= 10;
                val += ep[i]-'0';
	    	}
		}
	}
	*f = val;/*The decimal is stored in *ep*/
	return OK;
}




// prints the floating point number (f) with left-alignment. 
// Printing sign for a negative number is mandatory while for a positive number it is not required.
// However, decimal point should be printed to differentiate it from an integer number. 
// Returns the number of characters printed (on success) or ERR (on failure).

int printFlt(float f)
{
	char temp[1000];
	int i=0,fl=0;
    if(!f) 
    {
        temp[i++] ='0';
        temp[i++] ='.';
        temp[i++] = '0';
    }
    else
    {
        if(f < 0)
        {
            fl=1;
            f*=-1;
        }
        int dec = 0;
        while((int)f != f)
        {
            f*=10;
            dec++;
        } 
        if(!dec)
            temp[i++] = '0';

        int n = f;
        while(n)
        {
            if(i == dec) temp[i++] = '.';
            temp[i++] = n%10 + '0';
            n/=10;
        }
        if(fl) temp[i++]='-';
        
        for(int j=0,k=i-1;j<k;j++,k--)
        {
            char swa = temp[j];
            temp[j] = temp[k];
            temp[k] = swa;
        }
    }

	/* inline assembly line commands for system call to print "temp" to STDOUT*/
	__asm__ __volatile__ (
        "movl $(SYS_write), %%eax \n\t"
        "movq $(STDOUT_FILENO), %%rdi \n\t"
        "syscall \n\t"
        :
        :"S"(temp),"d"(i)
        );

    return i;
}
