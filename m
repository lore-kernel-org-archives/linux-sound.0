From: Peter Rasmussen <plr@cedara.com>
Date: Mon, 17 Jul 2000 15:00:55 +0000
Subject: Support not in Linux, but in ALSA
Message-Id: <marc-linux-sound-96384685629051@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I have never before *had* to use an external driver to a sound card, but this
weekend it appeared to me that I had to. I bought a [cheap] PCI sound card that
I needed to be non-SB because it would interfere with the mobo-SBVibra that I
have. It is a ForteMedia FM801 soundcard with no information on the chips, and
failing attempts to use just about every driver in Linux, I had to look 
elsewhere and found that ALSA supports it, just like that. It even has OSS
emulation so I could continue where I left with the SB driver.

As ALSA is also GPL, does anyone here know why it hasn't been included into
the Linux sound subsystem? It looks to me like there is duplicate work going
on and not necessarily for the benefit of the general Linux user.

OSS is a commercial company that releases their for profit drivers when they are
old enough for them not to make any profit anymore (it seems), ergo presently
the Linux sound system is getting the crums from OSS, when instead we could
have a very nice looking sound system like ALSA put into the kernel. I know 
there is more than OSS sound drivers in Linux, but those are pretty scarce and
the cards pretty expensive :-)

Is it because of the history of OSS being the first to ever have Linux sound
drivers, or is it the ALSA team that doesn't want to have their code included
into Linux proper?

This is my first encounter ever with ALSA, and I am just wondering if there are
technical (ALSA doesn't really fit well into Linux proper), managerial (somebody
has to do the work and nobody can) or political (the ALSA team doesn't like 
the Linux sound guys or vice versa) reasons for it?

At least there has to have been some talk about it, but I have never heard it
and I have not before seen ALSA mentioned a lot here?

Peter
