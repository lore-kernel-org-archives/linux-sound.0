From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Mon, 23 Aug 1999 18:32:32 +0000
Subject: Re: Streaming disk I/O kills file buffering and makes Linux unusable
Message-Id: <marc-linux-sound-93543474513000@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93541443318803@msgid-missing>
In-Reply-To: <marc-linux-sound-93541443318803@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> I'm afraid, if we want that Linux will be a good multimedia OS, this is a
> _STRONGLY_NEEDED_  feature.
> 
> The user wants to playback his video/audio from disk, and still be able
> to launch his apps, without waiting 10 secs for loading a simple xterm.
> 
> The SCT's  raw-io patches are nice, but not very suitable in a general purpose
> multimedia enviroment, since you can't tell to the user to store his videos on a
> raw partition.

Stephens patches are basis of raw I/O on files in a filesystem too.

However what you are saying and raw-io don't neccessarily tally. You are
actually saying "there is a bug in the current page cache handling for
this kind of operation". Far better therefore to fix the heuristic used.
