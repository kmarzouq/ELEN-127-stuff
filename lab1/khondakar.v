module khondakar (In, Out);
    input [2:0] In;
    output [6:0] Out;

    assign Out[0] = ~In[1] & ~In[0];
    assign Out[6]= In[2];
    assign Out[3]= ~In[1] & ~In[0];
    assign Out[5]= In[1];
    assign Out[4] = In[0];
    assign Out[1] = In[0];
    assign Out[2] = In[1];

endmodule

