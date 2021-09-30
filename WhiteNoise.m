%WHITE NOISE +
%If you breakpoint at 8, its white noise, if you breakpoint at 10 its
%synthesize puretone
sr = 44100; % sample rate in Hz
d = 1; %duration of noise
noise = rand(1, round (sr*d));
noise = noise*2;  % expansion
noise = noise-1 ; % translation
sound(noise,sr)
tone = sin(2*pi*f*t); % actual final tone
