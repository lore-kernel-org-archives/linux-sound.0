From: Derrick J Brashear <shadow@dementia.org>
Date: Thu, 31 Dec 1998 00:43:18 +0000
Subject: Re: problems with cdda2wav and other audio CDROM ripping software
Message-Id: <marc-linux-sound-91511049901013@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91491718927482@msgid-missing>
In-Reply-To: <marc-linux-sound-91491718927482@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 29 Dec 1998, Tony Nugent wrote:

> (and lots of variants) just produces ugly noise.  Same for cdparanoia
> - the wav files it creates sound like a ham radio between signals :)
> 
> And I can't get 8hz-mp3 to compile (there's a bunch of missing
> ieee*.h header files).  So "ripperX" is useless.
>
> I'd really like to do some audio cdrom ripping (to do audio cdrom
> copies and to make some mp3 disks), but I'm at a loss to know what to
> use.
> 
> Can anyone point me in the direction of something (anything!!) that
> *works* ??

I've given up on cdda2wav and am using cdparanoia 
(http://www.mit.edu/afs/sipb/user/xiphmont/cdparanoia/index.html) and also
I've started using the "lamer" patches to the dist10 mp3 encoder in
preference to 8hz-mp3, but that pointer I don't have handy.

Both work on my RH 5.1 laptop, but cdparanoia needed work (which is now
integrated) to override the default read size since the automatic
optimization didn't work with the cdrom drive in my laptop.... which has 2
different jitter peaks, apparently. 

-D
