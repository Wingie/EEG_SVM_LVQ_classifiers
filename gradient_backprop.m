

%set up I/O
patterns = P;   
desired_out = T;       
sse_rec = [];   
sse = 10;       
eta = 1;        
                
alpha = 0.8;    
patterns = [patterns ones(size(patterns,1),1) ];       
                
num_inp = size(patterns,2);     
               
num_hid = 3;   
num_out = size(desired_out,2);   

w1 = 0.5*(1-2*rand(num_inp,num_hid-1)); 

w2 = 0.5*(1-2*rand(num_hid,num_out));   

dw1_last = zeros(size(w1));    
dw2_last = zeros(size(w2));    
epoch = 0;                     

while sse > 0.01                        
        winp_into_hid = patterns * w1;  
        hid_act = 1./(1+exp( - winp_into_hid)); 
        hid_with_bias = [ hid_act ones(size(hid_act,1),1) ];
        winp_into_out = hid_with_bias * w2; 
        out_act = 1./(1+exp( - winp_into_out));
        output_error = desired_out - out_act;  
        sse = trace(output_error'*output_error);
        sse_rec = [sse_rec sse];                
        deltas_out = output_error .* out_act .* (1-out_act);                             
        deltas_hid = deltas_out*w2' .* hid_with_bias .* (1-hid_with_bias);
        deltas_hid(:,size(deltas_hid,2)) = [];  
                        
        dw1 = eta * patterns' * deltas_hid + alpha * dw1_last;   
                         
        dw2 = eta * hid_with_bias' * deltas_out + alpha * dw2_last;
        w1 = w1 + dw1; w2 = w2 + dw2;          
        dw1_last = dw1; dw2_last = dw2; 
        epoch = epoch + 1;
        if rem(epoch,50)==0    
                 disp([' Epoch ' num2str(epoch) '  SSE ' num2str(sse)]);
        end
end     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of main loop

figure(1);
plot(sse_rec); xlabel('Epochs'); ylabel('Sum squared error (SSE)'); % The end

