From: Alexandre Oberlin <aoberlin@netcourrier.com>
Date: Wed, 19 Jan 2000 13:35:01 +0000
Subject: no midi on sound cards
Message-Id: <marc-linux-sound-94829973205924@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi all,

I have been trying for ages to read a midi file with my sound cards on
Linux. I can't repeat here all I tried, it would take a book...
I have a SB Live value and a classic GUS. I think I finally understood
that midi is not supported for SB (emu10k1) but I've never seen that it
is also the case for GUS. 
I currently use kernel 2.2.13 with modular sound for GUS. I load the
module with
io=0x220 irq=5 dma=1
I can launch playmidi 2.4 without problem with option -g for GUS,
everything looks OK, even the xplaymidi animation, only I hear nothing.
On my external synth using mpu401, everything works fine with option -e.
Maybe the problem is with playmidi but it is not evident to find another
player and get it to work. If I use "cat 001.mid > /dev/sequencer" then
I get a segmentation fault.
P.S. Everything works fine on DOS/Windows 3.1 
Cheers
-- 
Alexandre Oberlin
http://www.altern.org/ao
