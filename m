From: Rui Sousa <rsousa@grad.physics.sunysb.edu>
Date: Mon, 09 Aug 1999 14:57:08 +0000
Subject: Re: File descriptors and Sound
Message-Id: <marc-linux-sound-93421235323784@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93415570309034@msgid-missing>
In-Reply-To: <marc-linux-sound-93415570309034@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Alan Cox wrote:
> 
> > If the device is full-duplex how can I have one application
> > reading it and another writing?
> 
> You either do file handle passing (funky) or normally one program runs the
> other: ie
> 
>         open file
>         fork()
> 
>         child:
>                 exec other app (which inherits file)
>                 exit
> 
>         parent:
>                 run code

As I said before I'm trying to get speakfreely to work in full-duplex
mode.
This program has two components (two independent processes) that try to
access /dev/audio. The thing is that during execution they open/close
/dev/audio multiple times so I think that the second method wont work
(correct me if I am wrong).

Can you indicate me some (online) documentation concerning file handle
passing?

Thanks
-- 
Rui Sousa
