From: Chen-Li Tien <cltien@home.com>
Date: Mon, 05 Jun 2000 13:06:57 +0000
Subject: Re: C-Media 8x38 driver for kernel 2.4
Message-Id: <marc-linux-sound-96023713414180@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96019100230870@msgid-missing>
In-Reply-To: <marc-linux-sound-96019100230870@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org



Paolo Rossi wrote:

> Hi Chen-Li,
> >
> > I also made a version that support kernel 2.2 and 2.4 (thanks for your
> > work), and fixes since the version 3.21. I read that you add S/PDIF in/out
> > in the init-module. May I remind you that they are not supported with all
> > format, so if you only use 44k/48k then it is ok. User would need to unload
> > and load the driver to use S/PDIF in/out and use another wave format. I
> > don't suggest add it as general driver come with kernel. It is also explain
> > in the cmpci file.
>
> ...I know that there are some problems with S/PDIF, in fact this is an
> EXPERIMENTAL feature. I've included it in the driver because I think
> that people may have interest on working on it.
>

How about adding some comments in Configure.help as I do? I hope there is not too
many
technical support for this flood into C-Media's web site...;-) I know many cards
have S/PDIF
function and have also this format limit.

Please make sure merge my code because it fix a serious bug that cause the DMA
stop when heavy
network traffic. For example, playback a mp3 with xmms and ftp a large file
(100MB) in the LAN.

Did you get 8738B? They told me it is test version and not in mass production.

>
> >
> > The version 4.02 driver can be got at
> > http://members.home.net/puresoft/cmedia.html.
> >
> ...yeah! I reported it on my site (http://web.tiscalinet.it/luvassu)
>
> Bye.
>
> -lupo
