From: Thomas Zimmerman <qubes@aa.net>
Date: Fri, 03 Mar 2000 06:16:38 +0000
Subject: Re: Playing Multiple Audio streams
Message-Id: <marc-linux-sound-95206442615949@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95205421910517@msgid-missing>
In-Reply-To: <marc-linux-sound-95205421910517@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Jeff McBride wrote:
> 
> Hello,
> 
> Are there any good ways to play several audio sources simultaneously? If
> an application wants to be playing say, several wave files overtop of each
> other, does it have to mix them itself and then play one stream. Or are
> there other drives, or possibly a daemon of some kind to do it?
> 
> And how about multiple applications that are unaware of each other playing
> at the same time?
> 
> Thanks for any help,
> 
> Jeff

EsounD deamon is what you are looking for. However, the apps need to
know to use ESD to play...
