From: Mike Wyer <mjw7@doc.ic.ac.uk>
Date: Tue, 22 Sep 1998 08:07:06 +0000
Subject: Re: How to create .mod files?
Message-Id: <marc-linux-sound-90645236704377@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90642111226910@msgid-missing>
In-Reply-To: <marc-linux-sound-90642111226910@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 22 Sep 1998, Ow W K Danny wrote:
>Hi,
>
>I've a couple of .mod files and the sound produced with this format is
>very good. Is there anyway to create or convert sound from CD into this
>format under Linux? 
>
>Any clue or pointers is very much appreciated.
>
The only file format I'm aware of with this extension (.mod) is that of
tracker modules- these consist of a bunch of samples, and then the
sequencing information to play them back at the right pitch and tempo
etc. Usually, there is just one sample of each inmstrument used, and the
tracker converts the pitch during playback. As you can see, it's not a
compression system, and creating .mod files is a non-trivial task (you
have the twin joys of sampling AND sequencing before you get anywhere).
They were first used on the Amiga, and the tracker software has been
ported to just about every architecture known to man.

So the simple answer is: No you can't convert CDs to mod files.
(Unless you have hours of spare time per track, and a very good ear for
converting a CD into 4 or 8 track data).
Cheers,
Mike
--
          ///   Mike Wyer : <m.wyer@ic.ac.uk>   \\\
         //\\___________________________________//\\
      "I want to die in my sleep like my grandfather....
 ...Not screaming and yelling like the passengers in his car."
