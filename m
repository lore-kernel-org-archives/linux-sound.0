From: u81ib6r2@umail.furryterror.org (Zygo Blaxell)
Date: Thu, 11 Feb 1999 18:37:54 +0000
Subject: Re: successive mmap()s will not work to record sound?
Message-Id: <marc-linux-sound-91875895612073@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91871041516692@msgid-missing>
In-Reply-To: <marc-linux-sound-91871041516692@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

In article <79v13d$1vp$1@naga.corel.eng>,
Zygo Blaxell <u81ib6r2@umail.furryterror.org> wrote:
>In article <Pine.OSF.3.96.990210195646.13922A-100000@aurora.alaska.edu>,
>Britton  <fsblk@aurora.alaska.edu> wrote:
>>I have been trying to write a brec-like program that will record long
>>tracks of raw sound using many successive mmap()s of the same file, but it
>>isn't working.  I get stuff like this:

Come to think of it, if you _really_ want to do this, why don't you mmap()
the entire file and just read() into that?

Also, make sure that the file is already large enough to hold the data you
are writing; otherwise you'll get a segfault.

-- 
Zygo Blaxell, Linux Engineer, Corel Corporation, zygob@corel.ca (work),
zblaxell@furryterror.org (play).  It's my opinion, I tell you! Mine! All MINE!
Size of 'diff -Nurw [...] winehq corel' as of Thu Feb 11 13:14:02 EST 1999
Lines/files:  In 489 / 13, Out 6383 / 76, Both 6869 / 88
