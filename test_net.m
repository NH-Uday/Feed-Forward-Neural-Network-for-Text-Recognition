
% initialize a feed-forward neural network
net = make_ffnet(3, [784, 800, 10], [true, true, false]);

% load the weights from a mat file and store them in the network
load weights;
net.w = w;

% load the MNIST data set
load digits;


failed = zeros(10,10); % collect first 10 failed recognitions for each digit
rec_as = zeros(10,10); % what they were recognized for

for d=1:10
   [M,N]=size(test{d});
   correct(d) = 0;
   total(d)   = 0;
   nf=0;
   for im = 1:M
      total(d) = total(d)+1;

      % evaluate network with image im of digit d from the test set
      net = ffnet_eval(net, test{d}(im,:));

      % which output has the largest signal? -> recognized digit
      [v,I] = max(net.O{end});

      % test, whether recognized digit agrees with actual digit
      if I == d
         correct(d) = correct(d)+1;
      else
         nf=nf+1;

         % store the first 10 failed recognitions for later plotting
         if nf<=10
            failed(d,nf) = im;
            rec_as(d,nf) = I-1;
         end
      end
   end
   fprintf('Recognition of %d: succes rate %f%% (%d samples)\n',d-1,correct(d)/total(d)*100,total(d));
end

p = sum(correct) / sum(total);

% plot failed recongnitions
show_failed(test,failed,rec_as);