From: Sven Dummer <sdummer1@linux01.gwdg.de>
Date: Wed, 30 Dec 1998 10:10:19 +0000
Subject: Re: problems with cdda2wav and other audio CDROM ripping software
Message-Id: <marc-linux-sound-91502605803480@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91491718927482@msgid-missing>
In-Reply-To: <marc-linux-sound-91491718927482@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Tony Nugent wrote:
> 
> For the life of me I just can't get cdda2wav to work on my RH5.1/5.2
> box!
> 
> % cdda2wav -q -e -t2 -d0 -N -D /dev/cdrom
> 
> (and lots of variants) just produces ugly noise.  Same for cdparanoia
> - the wav files it creates sound like a ham radio between signals :)

I guess you need to to swap the word-order in your wav files. You can
do so by converting the files using the "sox" utility, using the -x
option (see http://home.sprynet.com/sprynet/cbagwell/projects.html or
the sox man page if you already have it). I think, cdda2wav also has
an option for byte-swapping, see the man page (I haven't got it on
my machine here at home...)

E.g. using cdda2wav with HP CD-writers may produce wav-files that just
sound noisy. If you do a "sox -x file.wav file_new.wav" the result
should be okay (but if you want to burn it on a CD-R using the HP
recorder again, you'll have only noise on your CD, because the HP
needs the other byte-order!).


Regards,
Sven

-- 
Sven Dummer - sdummer@gwdg.de
---------------------------------
