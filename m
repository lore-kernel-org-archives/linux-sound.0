From: Jan Niehusmann <jan@gondor.com>
Date: Mon, 05 Jun 2000 08:50:20 +0000
Subject: Re: C-Media 8x38 driver for kernel 2.4
Message-Id: <marc-linux-sound-96019700502935@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96019100230870@msgid-missing>
In-Reply-To: <marc-linux-sound-96019100230870@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, Jun 05, 2000 at 04:21:33AM -0400, Chen-Li Tien wrote:
> I also made a version that support kernel 2.2 and 2.4 (thanks for your
> work), and fixes since the version 3.21. I read that you add S/PDIF in/out
> in the init-module. May I remind you that they are not supported with all
> format, so if you only use 44k/48k then it is ok.

Is there any documentation about that topic available? I only found some 
register descriptions, and used them (with some trial and error) to 
enable s/pdif in and out. It's clearly an experimental feature.
It should not be a big problem to enable s/pdif only if compatible parameters
are used, with documentation available. 

But I do have problems with lost or modified data - for testing purposes
I connected s/pdif out back to in, and piped a textfile through it (turn
your stereo off before you try this ;-) )

Some months ago I did an interesting observation: Corruptions were worse on
an idle system! As soon as I started to play music on a second sound card, 
I saw nearly no lost bytes any more. 

I'd really like to hear if other people have similar problems. Perhaps I just
got a bad sound card?

Jan
