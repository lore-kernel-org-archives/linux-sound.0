From: Gabor Halaszvari <fire@3hacker.hu>
Date: Fri, 02 May 2003 10:31:07 +0000
Subject: sb audigy
Message-Id: <marc-linux-sound-105187115217371@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

I have a SB Audigy with a 4.1 speaker set which is connected to the front and 
rear output of the soundcard, and I'm using SuSE 8.1 (2.4.19, alsa-0.9.0).

I experienced some strange thing:

The channel names in the mixer are not correct (it's not a problem, but I 
don't know if it can be changed).

If I'm adjusting the front and rear volume in some position, the bass speaker 
is louder or quieter. I think it comes from, that the front and rear waves 
compensate each other, because there is an inverted wave on one of the 
outputs. Is this normal? How can I fix this?

If you know this problems (and the answers), please help me.

I know that the Audigy driver is not in finished state, I'm programming in C 
language, but I have never written drivers yet. So if this problem can be 
solved with developing the driver, and if there are more people, who have 
this problems and can help to develop, we can start it.

Another topic. I used lots of midi software with VSTi support (under Windows - 
in the dark ages), do you know linux software like that? I'm interested in 
analog synths, sequencers... (like Reason, Rebirth, Cakewalk).

Best regards,
Gabor Halaszvari


