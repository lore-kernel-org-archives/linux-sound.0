From: Bill Nottingham <notting@redhat.com>
Date: Mon, 14 Dec 1998 18:06:40 +0000
Subject: Re: Modular Sound 2.0.36
Message-Id: <marc-linux-sound-91367066002076@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91364363717610@msgid-missing>
In-Reply-To: <marc-linux-sound-91364363717610@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Andries, Bert (Bert.Andries@uza.uia.ac.be) said: 
>  Via ftp.redhat.com ( and ftpsearch.lycos.com ) I found in
> sound/patches-current/modular-sound-2.0.36-2.diff.gz
>  When applied to the kernel 2.0.36 source tree ( the real thing, not the
> RH5.2 pre-2.0.36 ) it gives rejects on Config.in ( /drivers/sound/Config.in
> )
> 
>  Anyone here has experience on this subject ?  Am I following the right
> procedure to get modular sound on 2.0.36 ?

It seems to work OK here on a plain 2.0.36 - there's a couple of
patches with offsets (I'll throw a newer version on the FTP site
that doesn't do this), but it goes through clean. What version
of patch are you using?

Bill
