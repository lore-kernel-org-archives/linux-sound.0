From: Thomas Sailer <sailer@ife.ee.ethz.ch>
Date: Thu, 04 Mar 1999 11:35:50 +0000
Subject: Re: Full Duplex (Play + Record simultaniously)
Message-Id: <marc-linux-sound-92054772427340@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92048039409666@msgid-missing>
In-Reply-To: <marc-linux-sound-92048039409666@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Georg Wendt wrote:

> I wanna use a record-programm running in one shell and playback audio
> started on another shell.
> However, whenever one of the programs has started, it blocks the
> dsp-device and the other application can't work.

Depends on the soundcard and the driver. With some drivers this works.

> Is there a way to avoid this effect?

Yep - don't access the audio device directly, use an intermediate
program. EsounD might provide what you need.

> Another way: What about using two soundcards, one for playback, the
> other for recording? Since I can decide the sound-device used by the
> applications, this should work, shouldn't it?

In this case you get plesiochronous sampling rates. If that is a
problem depends on the application.

Tom
