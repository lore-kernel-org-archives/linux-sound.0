From: "Dustin Barlow" <dbarlow@omnids.com>
Date: Tue, 20 Jun 2000 22:28:35 +0000
Subject: Re: [linux-audio-dev] Re: Multimedia compression
Message-Id: <marc-linux-sound-96200429928836@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96126686903146@msgid-missing>
In-Reply-To: <marc-linux-sound-96126686903146@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


I will second Paco's synopsis of Shorten.

I have close to 100 concerts that were compressed using the lossless setting
in Shorten, and they are *exact* copies of the original when decompressed.
You can do an md5sum of the wav file prior to compressing it and it will
match after it is uncompressed later on.

I can typically cut a wave file size in half and it is lossless...I don't
think you
can ask for more then that...at least not yet anyway.  I have not tried to
do lossy compression with Shorten so I cannot comment on it's performance
in the lossy realm...

Another thing is that WinShorten *will* stream shorten files so that you do
not have to convert them to wav to listen to them.  I setup a machine to
do that very thing so that I didn't have to burn my extensive SHN library
to audio CDR or wav file prior to listening.  I haven't found a streaming
version of Shorten for linux, so I grabbed the source code the other day
and am looking into what it would take to do it...shouldn't be to difficult.

~Db

----- Original Message -----
From: <paco@hydrofunk.org>
To: Benno Senoner <sbenno@gardena.net>
Cc: Sergey <harlot@mail.ru>; <linux-sound@vger.rutgers.edu>;
<linux-audio-dev@ginette.musique.umontreal.ca>; John Lazzaro
<lazzaro@CS.Berkeley.EDU>
Sent: Tuesday, June 20, 2000 12:08 PM
Subject: [linux-audio-dev] Re: Multimedia compression


> On Sat, 17 Jun 2000, Benno Senoner wrote:
>
> > I tried shorten some time ago:
> >
> > OTOH, when using lossless compression the gain is sometime minimal,
> > only 20% if you are unlucky.
> > Not much for my taste.
>
> I find this very hard to believe.  Speaking from my own experience, I've
> had nothing but outstanding results with SHORTEN.
>
> I collect live concert bootlegs; recorded on DAT, dumped down onto the
> HDD as WAVs, compressed to SHNs, and burned onto CDs that I listen to.
> I've got nearly 100 such CDs sitting here at my side, and here's the
> stats based on those live concert CDs.
>
> My average song compression 52% savings
> My worst single-song comression 35% savings
> My best single-song compression 60% savings
>
> The main thing I wanted to point out is that I've never had a something
> compress less than 35%.
>
> peace,
> -Paco
