From: Erik de Castro Lopo <erikd@zip.com.au>
Date: Sun, 14 Mar 1999 20:05:46 +0000
Subject: Re: awe64 not initializing on 2.2.2
Message-Id: <marc-linux-sound-92144227622558@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92139407200837@msgid-missing>
In-Reply-To: <marc-linux-sound-92139407200837@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Eric Tork wrote:
> 
> As luck would have it, that did the trick.  The module loads, and all
> is fine.......but one problem remains.  /dev/audio outputs garble when I
> send something to it, like a wav file.  KDE's systems sounds all come
> through clear, so I assume that it sends its output through something
> else?  Is there something that needs to be done with /dev/audio?
> 
>   btw, this is a redhat 5.1 box with an isa pnp soundblaster 64.

/dev/audio is for Sun .au format files only.

To play .wav files you must use a player such as the one that comes
with SoX or wavplay. Have a look at:

http://www.bright.net/~dlphilp/linux_soundapps.html

These players all use /dev/dsp for outputing audio.

Hope this helps,
Erik
-- 
+-------------------------------------------------+
     Erik de Castro Lopo     erikd@zip.com.au
+-------------------------------------------------+
The difference between a violin and a viola is that a viola 
burns longer.
