From: flatmax <flatmax@cse.unsw.EDU.AU>
Date: Tue, 06 Jun 2000 14:43:35 +0000
Subject: Re: ALSA
Message-Id: <marc-linux-sound-96030583009489@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95557469806551@msgid-missing>
In-Reply-To: <marc-linux-sound-95557469806551@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Have you tried the ALSA mail list ?
Although alot of people here use both ALSA and OSS, you might get more
help specifically on ALSA from the alsa mail list or home page :
www.alsa-project.org
OR you could also try the 4front:
www.4front-tech.com

OTHERWISE .... compile your kernel with sound enabled :
1 cd /usr/src/linux
2 make xconfig OR make config
	Build the kernel with sound modules enabled and configured ...
	might require isapnp as well to set up the card at boot.
3 make bzlilo or somehting similar to compile the kernel
4 make modules
5 make modules_install
6 Reboot
7 debug !!!

fuzzies to ya...
Matt

On Tue, 6 Jun 2000, Mr I.E. Esten wrote:

> Hi people,
> 	I need your help! I am having a bit of trouble setting up ALSA on
> my Dell Optiplex (w/ Redhat 6). I have two cards in the machine; an sb16
> built in to the motherboard, and an sb live pci card. Trouble is, I can't
> get MIDI working on the sb live. Jazz complains that /dev/sequencer2 and
> /dev/music are not configured, and more'ing them just to see what happens
> reports the same. I can't even get the sb16 detected (allthough it works
> fine with the kernel sound drivers), as isapnp can't find it. I would
> really appreciate some help with all this - I've tried just about
> everything I can think of. I've included the conf.modules i've been using
> and the /proc/modules report.
> Thanks v. much,
> Ian
> 
> PS - everything else on the sb live works ok - its just MIDI that doesn't.
> 
