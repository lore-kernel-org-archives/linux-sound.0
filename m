From: Kai Vehmanen <kaiv@wakkanet.fi>
Date: Fri, 03 Sep 1999 18:08:12 +0000
Subject: ecasound as a virtual effect box :)
Message-Id: <marc-linux-sound-93638572714079@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I tested realtime effect processing with ALSA drivers and it 
turned out to work rather well. I've tested this quite a lot with
OSS/Linux, but never with ALSA devices. Anyway, with a buffersize 
of 128 samples (~3ms) and raisen priority, there were no dropouts 
and as there's no file-i/o, I was able to use more complex effect
setups than when doing normal file playback. I guess with Ingo's
kernel patches, I could use even smaller buffersizes without losing
stability. But 3-6ms~ is already quite good. It's a good sign, 
that I could play "live" with my drum machine without noticing 
any processing delay...

It actually turned out to be so much fun that I spent hours playing
with my guitar and trying different effect setups. :) Most ecasound's
effects are pretty simple, but when you combine them, things start
to get interesting. Especially with delays and reverbs, you can 
do stuff that is impossible with rack effects... I'd love to do
some ecasound testing with the new AMD Athlon (I have a 166MMX
now...). With that CPU-power you could do much.

Well, here's an example...:

ecasound -r -c -b:128 -a:1,2 -i alsa,0,0 -o alsa,1,0 \
	   	      -a:1 -eas:50 \
		      -a:2 -efl:800 -etr:400,0,60 -eas:200

This adds a 400ms reverb to the low frequencies. Sounds quite 
dub-ish when I put my drum machine through this. ;) Works 
quite well on my machine, but if I try to add more chains or
cpu-intensive effects (delay, filters), I quickly run out of 
cpu-power.

-- 
Kai Vehmanen ----------------------------- CS, University of Turku, Finland
 : email                                 mailto:kaiv@wakkanet.fi
 : audio processing for linux            http://www.wakkanet.fi/ecasound/
 : my music (ambient-idm-rock-...mp3/ra) http://www.wakkanet.fi/sculpscape/
