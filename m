From: Thomas Sailer <sailer@ife.ee.ethz.ch>
Date: Thu, 04 Mar 1999 18:32:19 +0000
Subject: Re: Full Duplex (Play + Record simultaniously)
Message-Id: <marc-linux-sound-92057302819532@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92048039409666@msgid-missing>
In-Reply-To: <marc-linux-sound-92048039409666@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

"Eric B. Mitchell" wrote:

> The OSS drivers allow full duplex operation on some sound cards.
> My SB AWE 32 works great for it.  EsounD will use it if it's
> available, but I'm not sure how robust the error handling is
> should the full duplex operation fail (haven't had the problem
> myself =).

You've got the source for EsounD, you can improve the situtation 8-)

> plesiochronous? i assumes that translates roughly into "skewed data"?

The sampling rates are slightly different, thus sliding about each
other. If you don't do any corrective measures, you'll either
get buffer overruns or underruns.

Tom
