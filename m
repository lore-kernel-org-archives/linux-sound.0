From: Mihai Ciocoiu <mihaic@wam.umd.edu>
Date: Tue, 06 Jun 2000 21:56:05 +0000
Subject: K7 + 2.2.13 + es1370 = crash?
Message-Id: <marc-linux-sound-96033716114503@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi all, 

I'm having trouble getting sound to work with my Abit KA7 mobo and
soundblaster 64 PCI (ensoniq 1370) card. The distribution-supplied kernel
drivers (Slakware 7, kernel 2.2.13) install fine, and recognize the sound
card correclty, but when I try to access the audio device it works for 1-2
sec, then the system freezes. 

I tried compiling the drivers in the kernel
and as modules, I tried using the 2.2.15 kernel, I also tried the ALSA
drivers and get the same results. 

Has anyone seen/solved this? 
Any suggestions about what else I could try? 

Thanks,
Mihai Ciocoiu
