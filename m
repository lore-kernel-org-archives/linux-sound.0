From: Bill Nottingham <notting@redhat.com>
Date: Sun, 25 Apr 1999 19:43:08 +0000
Subject: Re: why no midi?
Message-Id: <marc-linux-sound-92507009223716@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92467332609462@msgid-missing>
In-Reply-To: <marc-linux-sound-92467332609462@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

qozmo x xx (qozm0@juno.com) said: 
> >cd /etc/midi
> >for foo in *; do ln -s midi/$foo ../$foo ; done
> >
> >That should fix the problem.
> >
> >Bill
> >
> 
> ok, i did try that command, and it worked, now i can play midi.
> what exactly did this command line do (and what is foo?)?
> thanx for the help,

foo is just a variable name. Basically, it just makes symlinks
for some playmidi files (drums.o3/sb, std.o3/sb) from /etc
(where playmidi is incorrectly looking for them) into /etc/midi
(where they actually are). The correct fix is to build playmidi
with the proper paths, but this works.

Bill

 
