From: "Eric B. Mitchell" <emitchell@altaira.com>
Date: Thu, 04 Mar 1999 15:58:49 +0000
Subject: Re: Full Duplex (Play + Record simultaniously)
Message-Id: <marc-linux-sound-92056343611643@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92048039409666@msgid-missing>
In-Reply-To: <marc-linux-sound-92048039409666@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org



Thomas Sailer wrote:
> 
> Georg Wendt wrote:
> 
> > I wanna use a record-programm running in one shell and playback audio
> > started on another shell.
> > However, whenever one of the programs has started, it blocks the
> > dsp-device and the other application can't work.
> 
> Depends on the soundcard and the driver. With some drivers this works.
> 
> > Is there a way to avoid this effect?
> 
> Yep - don't access the audio device directly, use an intermediate
> program. EsounD might provide what you need.

The OSS drivers allow full duplex operation on some sound cards.
My SB AWE 32 works great for it.  EsounD will use it if it's 
available, but I'm not sure how robust the error handling is
should the full duplex operation fail (haven't had the problem
myself =).

> > Another way: What about using two soundcards, one for playback, the
> > other for recording? Since I can decide the sound-device used by the
> > applications, this should work, shouldn't it?
> 
> In this case you get plesiochronous sampling rates. If that is a
> problem depends on the application.

plesiochronous? i assumes that translates roughly into "skewed data"?

> Tom

-- ebm
+=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
| Eric B. Mitchell         mailto:ericmit@ix.netcom.com |
+=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
