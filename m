From: wmphang@wkl.com
Date: Wed, 21 Apr 1999 04:45:45 +0000
Subject: AWE 32
Message-Id: <marc-linux-sound-92467011307878@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,
  Hope that someone can help me on this sound problem. I have install
the linux (kernel 2.0.36) and I can not able play the midi files. 

Checking on the log file, i have found that on the boot up there is a
problem on loading the sound font file. Since I've partition my hard to
/ for root and /usr, and when boot up time it can not find sfxload
(cause it is in /usr/bin and this partition is not mount yet) so I copy
sfxload to /etc/midi and modified the /etc/conf.modules and reboot. So
that solve the load font problem. 

But i still can not play midi file. Using the kde midi play in debug
infomation, it seem that some instrument are not found. I even load all
the sound font that i can find in my Windows 95 and still missing some
instrument.
My sound card is AWE 32 with 2MB RAM
Anyone can help me on this ?

Thanks
