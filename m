From: Pariah Dog <kevin@efn.org>
Date: Sat, 11 Jun 2005 17:44:41 +0000
Subject: Linux and integrated ES1869 audio controller
Message-Id: <Xns967283AB9CEF9MisterFluffy@80.91.229.5>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Linux is unable to see my "sound card" 

I'm running Debian 3.1, "Sarge" on an old Compaq Presario 5220. The
so-called "sound card" is one of those damnable integrated ES1869 audio
controllers rather than a real sound card. 

Needless to say, I've got sound under WiNdOwS/MSDOG, but Linux isn't
able to even see that the sound card is there. 

Here is what I've tried, thus far: 

*: pnpdump can't see a thing, so I have nothing to feed to isapnp 

*: discover can't see a soundcard, but I do get 5 lines of: 
   "unknown unknown" 

*: dmesg shows nothing useful 

*: "modprobe sb <various parameters>" 
   gives me "Error inserting sb (/lib/.../sb.ko): No such device" 

*: "modprobe snd-es18xx <various parameters>" 
   gives me "Error inserting sb (/lib/.../snd-es18xx.ko): No such
   device" 

*: Hell, in desparation, I even ran a for loop on all the .ko files 
   under the /lib/modules/.../sound/ subdirectory in the hopes that 
   something would work. nothing worked 

*: no such file as /dev/sndstat 

*: alsaconf didn't find a sound card 

*: From what I can tell, nothing of any use in the output of hwinfo 

*: lspci... nope 

*: modinfo soundcore... yup, I have the soundcore module loaded 

One final note. 

I used wine to run the MSDOG esscfg.exe command with the same parameters
that I have in my autoexec.bat file from that side of the computer.  The
next time I entered KDE, I had a popup message telling me that it wasn't
able to detect a sound card.  Now, I had disabled this popup window
before, so I suspect that my running esscfg.exe under wine might have
convinced something that something resembling a soundcard might need to
be checked again. 

Can anyone offer me any further advice. I know that since this *is* an
integrated audio controller, there really is no soundcard, but I figure
that since WiNdOwS/MSDOG can see the thing, I should be able to convince
Linux to see it. 

