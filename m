From: august <black@mail.fl.aec.at>
Date: Tue, 04 Apr 2000 07:23:20 +0000
Subject: Re: Recording with anything?
Message-Id: <marc-linux-sound-95484334631310@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95480718509450@msgid-missing>
In-Reply-To: <marc-linux-sound-95480718509450@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> 
> I've got the SB PCI512, which uses the same chipset as the Live!, 
> and I've got the same problem.  No matter what I do I am unable
> to record a thing.  I don't think the support for the emu10k1
> chip is quite up to speed yet, but...
> 
> Which drivers are you using?
> 
> If you're using OSS/Commercial drivers (like I am), you should
> write to 4front technologies and tell them.  I've had some long
> talks with them , but they just keep gauranteeing me that the
> drivers work fine.

hmm...I got the live player...and have tested all three: the OSS
commercial, the OSS drivers from the opensource.creative.com site, and the
alsa drivers.  all of them see to work pretty much the same.  one major
problem with the OSS versions is a glitch in mixer commands.  with some
drivers I get 3 "line in"s showing up in aumix and with others only one.  
i think there was also some glitches in the OSS commercial.  both OSS's
are missing the /dev/sndstat still, I think.

and regarding recording...i can successfully record with programs such as
"record" and "mix"...(also under alsa)but not with other programs.  I can
also use PD (but unly under alsa with OSS emulations) in full duplex
mode...but need to send him extra -frags

my guess is, that some programs are asking for more contiguous memory than
others are.  my one problem right now is that i can't record with the
video software I am using - lavrec (for mjpeg capturing).  lavrec needs
32kb contiguous memory for the sound...and doesnt seem to do it with the
Live! emu10k1 .

- august.
