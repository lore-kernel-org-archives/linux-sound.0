From: est@hyperreal.org
Date: Wed, 27 Oct 1999 21:15:21 +0000
Subject: Re: mmap()/mlockall()/read()
Message-Id: <marc-linux-sound-94105904620235@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94095888330340@msgid-missing>
In-Reply-To: <marc-linux-sound-94095888330340@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Benno Senoner discourseth:
> 
> I think the best fallback solution is the following (but not 100% reliable
> in the case of syscalls):
> mlock(MCL_CURRENT);
> mlock() malloec()ed aread

Hmm, I remain sceptical that I'll see large apps using this.  Using
other-people's-libraries is common after all.  It would mean a lot of
work that doesn't seem worth the benefit to me.  However, it would be
pleasant if people proved me wrong. :)

> but strange,
> MAP_UNLOCKED seems to not exist on my 2.2.12 kernel !!

It doesn't exist..I made it up! :)

I think it would be A Good Idea, and it looks easy to add.

> > Eric is hard to satisfy. :)
> 
> You are not the only !
> :-)

Thence comes progress.

Eric
