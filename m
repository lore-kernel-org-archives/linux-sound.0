From: Hannu Savolainen <hannu@opensound.com>
Date: Thu, 08 Jun 2000 21:59:43 +0000
Subject: Re: how to find the maximum fragment size for SNDCTL_DSP_SETFRAGMENT?
Message-Id: <marc-linux-sound-96050168816445@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96049072503276@msgid-missing>
In-Reply-To: <marc-linux-sound-96049072503276@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 8 Jun 2000, Britton wrote:

> 
> The guide of 4front's web page says total_buffer_size/2.  I know the
> kernel buffer size used to be defined at kernel compile time.  How does
> one go about determining it now?  DSP_GETBLKSZ?
Wy would you need this information? 

If you like to get as large fragments as possible just set the fragment
size to very big. The driver will then select the largest one it could
support.

However changing the fragment size bigger than the default doesn't give
any benefit. You can always write/read multiple fragments at time to get
the same effect.

> Does DSP_GETBLKSZ still
> fix the block size so that the device must be closed and opened again in
> order to set the fragment size?
This is the current and future behaviour.

Best regards,

Hannu
-----
Hannu Savolainen (hannu@opensound.com)
http://www.opensound.com (Open Sound System (OSS))
http://www.compusonic.fi (Finnish OSS pages)
