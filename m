From: ali <ali@mweb.co.za>
Date: Sat, 22 May 1999 17:45:36 +0000
Subject: Module Problems
Message-Id: <marc-linux-sound-92755650918736@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi

I have an AWE64 soundcard that works fine under linux. I've compiled all
sound drivers as modules ie. sb.o awe_wave.o and uart401.o 

Installing the modules sb and uart401 are no problem. When i install
awe_wave, the module installs but I have to type ^C ie ctrl+C in order to
regain control of my terminal.

This is a huge problem since I want to install these sound modules at
startup but the ctrl+C problem prevents my system from getting to the
login prompt. The system just stops when it reaches the command 'insmod
awe_wave io=0x620'

How can I fix this?

thanks (in advance)
ali
