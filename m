From: Erik de Castro Lopo <erikd@zip.com.au>
Date: Wed, 10 Feb 1999 12:23:46 +0000
Subject: Re: mpeg2 support in kernel?
Message-Id: <marc-linux-sound-91864965101410@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91863075621412@msgid-missing>
In-Reply-To: <marc-linux-sound-91863075621412@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Britton wrote:
> 
> I see the following snipet of code in the O'Reilly Linux Multimedia Guide:
> 
> if (formats & AFMT_MPEG) {
>   printf("  MPEG 2");
>   (deffmt = AFMT_MPEG) ? printf(" (default)\n") : printf("\n");
> }
> 
> Is there something you can compile into the kernel that will let the "dsp"
> produce mpeg 2 encoded stuff?  If so I'd love to know about it.

MPEG encoding/decoding does not belong in the kernel but in a 
user space program or library. The libary option is probably
best.

Erik
-- 
+-------------------------------------------------+
     Erik de Castro Lopo     erikd@zip.com.au
+-------------------------------------------------+
"We all know Linux is great...it does infinite loops in 5 
seconds." -- Linus Torvalds
