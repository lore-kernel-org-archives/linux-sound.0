From: David Jander <djander@alumnos.utfsm.cl>
Date: Mon, 26 Jul 1999 20:59:03 +0000
Subject: Ensoniq Audio PCI ES1370- no CD-Audio !
Message-Id: <marc-linux-sound-93302376110504@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


Hi all,

A friend recently installed Red-Hat 6.0, and since he is a newbie, I helped him
configuring the sound-card, an Ensoniq Audio PCI ES-1370
I compiled the kernel (2.2.5) with support for the ES-1370, and everything
worked fine, except for some "details":

1.- CD-audio does not sound: Apparently the mixer DOS not support the CD-audio
channel correctly, is that true ? Anybody knows about this issue ? Any
newer kernel/driver version fixes this ? Maybe ALSA ? 
Under Windoze, it works fine, i.e. you can hear CD-audio and control the
volume with the mixer, but in linux... silence (well... noise actually) !

2.- Sound output has a constant background noise, just as if one mixer channel
(with noise) was wide open, when all mixer sliders are at zero position. This
also does not occur under Windoze.

Thanks for any advice ...


---------------------------------------------------------------------
David Jander J.                   | "M$-Windows sux, Linux Rulez !  
Electronics Student, UTFSM, Chile |  That's it !"
E-Mail : djander@alumnos.utfsm.cl |               -Me
