From: lantz moore <lmoore@contigo.com>
Date: Wed, 15 Mar 2000 20:36:55 +0000
Subject: Re: Playing Multiple Audio streams
Message-Id: <marc-linux-sound-95317042824081@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95205421910517@msgid-missing>
In-Reply-To: <marc-linux-sound-95205421910517@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Jeff McBride <trep@trep.dhs.org> writes:

> Are there any good ways to play several audio sources simultaneously? If
> an application wants to be playing say, several wave files overtop of each
> other, does it have to mix them itself and then play one stream. Or are
> there other drives, or possibly a daemon of some kind to do it? 

rplay[1], nas[2], and ESounD[3] can all do this very well.

> And how about multiple applications that are unaware of each other playing
> at the same time? 

rplay and ESoundD both have ways of tricking an application into playing
audio via sound servers.  i know that both rplay and esd are under
development, however, i'm not sure about nas.

-l

[1] http://rplay.doit.org
[2] ftp://ftp.x.org/contrib/audio/nas/
[3] http://www.tux.org/~ricdude/EsounD.html
