From: "Scott Thompson" <postfail@hushmail.com>
Date: Wed, 01 Aug 2007 05:45:29 +0000
Subject: Re: [PATCH]:  sound: ioremap/iounmap function balancing audit
Message-Id: <20070801054530.B6459DA820@mailserver8.hushmail.com>
List-Id: <linux-sound.vger.kernel.org>
References: <20070801040601.009F3DA820@mailserver8.hushmail.com>
In-Reply-To: <20070801040601.009F3DA820@mailserver8.hushmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org

On Wed, 01 Aug 2007 00:52:26 -0400 Andrew Morton <akpm@linux-
foundation.org> wrote:
>The patch is terribly wordwrapped.
>
>I suspect a lot of the code which you're fixing is about to be 
>removed. 
>But I suppose we should fix it before removing it anwyay.  Still, 
>please
>split this patch into at least one for sound/oss and one for 
>sound/soc and
>sound/pci, thanks.

Will do, though wordwrapping issues will still be there.  The part 
of the function I was patching in i810_probe is nested so deep 
birds have taken up residence.

---------------------------------------
Scott Thompson / postfail@hushmail.com
---------------------------------------

--
Save up to 50% on medical billing software fees.  Click here to compare products.
http://tagline.hushmail.com/fc/Ioyw6h4fneC6fpcvTDYSgkm83Hr8G69CcftGKEmliJtHLKxWx7VBzH/

