From: Maarten de Boer <maarten.deboer@iua.upf.es>
Date: Fri, 17 Sep 1999 10:46:52 +0000
Subject: Re: [alsa-user] Re: latencytests results on a Pentium133, again EXCELLENT, 2.1ms.:-)
Message-Id: <marc-linux-sound-93756643831266@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> My question is : is it really mandatory to use two threads (one for audio in
> an one for audio out).
No.

> What if I do :
> 
> while(1)
> {
>     read(&buffer); // btw I'll be using alsa not oss
>     Process(buffer);
>     write(&buffer);
> }
Works fine. Make sure you do 
(I quote Benno:)
[blocking read/write] write 4 fragments of silence to the output, at this 
point both audio input and audio output will start (or alternatively you 
could trigger the start via ioctl() after the write).

The ALSA latency.c test does it a bit different.

> Isn't it ok ? I suppose some people have already written this kind of app...
Yes, I did. I do use 2 threads, 1 for audio in->process->out, and one for
the GUI (FLTK). It's very easy.

Maarten.
