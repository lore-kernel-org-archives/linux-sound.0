From: est@hyperreal.org
Date: Wed, 27 Oct 1999 15:30:37 +0000
Subject: Re: [linux-audio-dev] Re: mp3 seeking
Message-Id: <marc-linux-sound-94104024024056@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Andy Lo A Foe discourseth:
> 
> Very interesting. I'm thinking about a similar solution for doing
> reentrancy with plugins that don't support it, something like a proxy
> plugin interface with IPC and shared memory. Where can I get the latest
> version of oolaboola?

You can't yet..at least not the one with mp3 support.  Making it
deliverable is one of my two big tasks at the moment.

> Yes, if you want 100% correct seeking the best thing you can do is to
> store the frame start positions while decoding. It is a bit slow though.
> Is that what you're doing?

I actually calculate them before decoding unless they're cached (I've
got an on-disk format that stores 16-bit offsets between frames.)

Eric
