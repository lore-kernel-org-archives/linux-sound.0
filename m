From: "Andries, Bert" <Bert.Andries@uza.uia.ac.be>
Date: Tue, 15 Dec 1998 09:50:40 +0000
Subject: RE: Modular Sound 2.0.36
Message-Id: <marc-linux-sound-91371705121337@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91364363717610@msgid-missing>
In-Reply-To: <marc-linux-sound-91364363717610@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org



	>Andries, Bert (Bert.Andries@uza.uia.ac.be) said: 
> >  Via ftp.redhat.com ( and ftpsearch.lycos.com ) I found in
> > sound/patches-current/modular-sound-2.0.36-2.diff.gz
> >  When applied to the kernel 2.0.36 source tree ( the real thing, not the
> > RH5.2 pre-2.0.36 ) it gives rejects on Config.in (
> /drivers/sound/Config.in
> > )
> > 
> >  Anyone here has experience on this subject ?  Am I following the right
> > procedure to get modular sound on 2.0.36 ?
> 
	<  It seems to work OK here on a plain 2.0.36 - there's a couple of
	<  patches with offsets (I'll throw a newer version on the FTP site
	<  that doesn't do this), but it goes through clean. What version
	<  of patch are you using?

	<  Bill

 It isn't clear to me against what the
sound/patches-current/modular-sound-2.0.36-2.diff.gz
should be patched.

 What I failed to reveal in my posting is that I'm trying to get beta
modular sound drivers from 
the 2.1.xxx kernel onto 2.0.36.   In particular the Turtle Beach Pinnacle /
Fiji driver.
( Andrew Veliath http://www.rpi.edu/~veliaa/pinlinux.html )

 The mentioned patch file puts the 'extra' 2.1.xxx drivers in the
drivers/sound directory ( looks
good at first glance ).  Only patching the Config.in fails.  I tried to put
the chunk of code for the 
Turtle Beach Pinnacle / Fiji into it ... manually.  Which works except that
tkparse doesn't 
accept the 'string' keyword.  ( make mrproper ; make xconfig ).  

 I'll check the version of patch ... it should be the one that came with the
rh5.1.

 Bert
