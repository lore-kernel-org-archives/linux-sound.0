From: Etienne Grossmann <etienne@anonimo.isr.ist.utl.pt>
Date: Sat, 24 Oct 1998 18:56:47 +0000
Subject: re: soundcard confusion
Message-Id: <marc-linux-sound-90925850915034@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90887944325515@msgid-missing>
In-Reply-To: <marc-linux-sound-90887944325515@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org



  Hello,

  sorry, I don't have many answers :

> Well, I compiled the es1370 driver into my kernel

  Wasn't there a SB-specific option to set when you configured the
kernel? What did you configure your kernel with? "make menuconfig"?


> What's the difference between /dev/audio and /dev/dsp?

  I'm not sure, but for me, doing :
   
       cat ~/ftp/sndkit/dsp/endoftheworld > /dev/dsp

  does some normal quality sound, whereas 

       cat ~/ftp/sndkit/dsp/endoftheworld > /dev/audio

  does some noise vaguely reminiscent of what the original sound was.

> Why I'm I not getting any sound from /dev/dsp?

  None none? Turned the volume up?

> How do I use /dev/midi? Nothing seems to work.

  Did you try the program called "playmidi" ?


  As you see, I haven't been of much help. 

  There seems to be many questions, on this list but few answers.


  Good luck, and don't hesitate to ask more questions.

  Etienne
